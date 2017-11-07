# Terraform modules

Each module has the most common arguments. Some modules like aws_elb for instance, I wrote two of them, one without the **"_ssl_certificate_id_"** and other with this argument. (Notice aws_modules/elb and aws_modules/elb_https).
If you want to use a github repository as a source use this way:
<br>
<br>
`source="git::ssh://git@github.com/orelhinhas/terraform.git//aws_modules//name_of_module"`

ps1: If you use Azure, change "//aws_modules//name_of_module" to "//azure_modules//name_of_module"

ps2: The two "//" is necessary.

**Below an example using some modules at AWS.**

```terraform
provider "aws" {
  region = "sa-east-1"
}

variable "availability_zone" {
  default = "sa-east-1a,sa-east-1c"
}

module "vpc_orelhas" {
  source           = "./aws_modules/vpc"
  vpc_name         = "vpc_orelhas"
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"
  dns_support      = true
  dns_hostnames    = true
}

module "internet_gateway" {
  source   = "./aws_modules/internet_gateway"
  vpc_id   = "${module.vpc_orelhas.id}"
  igw_name = "gw_internet"
}

module "route_table" {
  source = "./aws_modules/route_table"
  vpc_id = "${module.vpc_orelhas.id}"
}

module "route" {
  source                 = "./aws_modules/route"
  route_table_id         = "${module.route_table.route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${module.internet_gateway.id}"
}

module "subnetA" {
  source            = "./aws_modules/subnet"
  subnet_name       = "sbA_orelhas"
  availability_zone = "${element(split(",", var.availability_zone),0)}"
  vpc_id            = "${module.vpc_orelhas.id}"
  cidr_block        = "10.10.1.0/24"
}

module "subnetC" {
  source            = "./aws_modules/subnet"
  subnet_name       = "sbC_orelhas"
  availability_zone = "${element(split(",", var.availability_zone),1)}"
  vpc_id            = "${module.vpc_orelhas.id}"
  cidr_block        = "10.10.2.0/24"
}

module "route_table_association" {
  source         = "./aws_modules/route_table_association"
  subnet_id      = "${module.subnetA.id}"
  route_table_id = "${module.route_table.route_table_id}"
}

module "elb_security_group" {
  source  = "./aws_modules/security_group"
  sg_name = "sg_elb_orelhas"
  vpc_id  = "${module.vpc_orelhas.id}"
}

module "elb_http_rule" {
  source            = "./aws_modules/security_group_rule"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${module.elb_security_group.id}"
}

module "sg_orelhas" {
  source  = "./aws_modules/security_group"
  sg_name = "orelhas"
  vpc_id  = "${module.vpc_orelhas.id}"
}

module "orelhas_ssh_rule" {
  source            = "./aws_modules/security_group_rule"
  type              = "ingress"
  to_port           = 22
  from_port         = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${module.sg_orelhas.id}"
}

module "orelhas_egress_rule" {
  source            = "./aws_modules/security_group_rule"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${module.sg_orelhas.id}"
}

module "elb_orelhas" {
  source                    = "./aws_modules/elb"
  elb_name                  = "elb-orelhas"
  subnets                   = ["${module.subnetA.id}", "${module.subnetC.id}"]
  internal                  = false
  security_groups           = ["${module.elb_security_group.id}"]
  instance_port             = 80
  instance_protocol         = "tcp"
  lb_port                   = 80
  lb_protocol               = "tcp"
  healthy_threshold         = 2
  unhealthy_threshold       = 2
  timeout                   = 3
  target                    = "TCP:80"
  interval                  = 30
  cross_zone_load_balancing = true
}

module "keypair_orelhas" {
  source     = "./aws_modules/key_pair"
  key_name   = "orelhas"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDlG4g+Lx4JFPmts0CK8XB+Vqct7lOCjqOlXQM+hlkULUlzVyaD5jL6v5kPZijZ5jQYe15r1CijwIi238rmn5yePIZCJPDP4qAFFkule7ZfjN/c7                       0LeCXwWSfEHXkMNEL3GAaQJG0DYLPinhDLSxasEqvTtS/g5mSQb3zGswPrGWZqHTp+wYwT91KC4wpN2VyLWrVJFcrBcUQQG8N3ISseVemxqKpdjsVx07a8Qr6amBFSG6pqQddgV3rv0g6R6rHtROTZKWTyatGMSahY+oV                       f4QYFsbIByb5KD14m3XvIRxCXfgNVcu7Y2Gv90h3LLcj+xUYC8ZpqeKcxwRYn0SJ1B"
}

module "vm_orelhas" {
  source                      = "./aws_modules/instance"
  ami                         = "ami-34afc458"
  availability_zone           = "${element(split(",", var.availability_zone),0)}"
  instance_type               = "t2.micro"
  monitoring                  = true
  ebs_optimized               = false
  associate_public_ip_address = true
  key_name                    = "${module.keypair_orelhas.key_name}"
  tenancy                     = "default"
  vpc_security_group_ids      = ["${module.sg_orelhas.id}"]
  subnet_id                   = "${module.subnetA.id}"
  instance_name               = "vm_orelhas"
  volume_size                 = "10"
  volume_type                 = "gp2"
  iops                        = "100"
  delete_on_termination       = true
}
```

Here an Azure example.
I didn't finish this modules, Feel free to update something if necessary.

```
variable "location" {
  description = "Region"
  default     = "Brazil South"
}

variable "vm_image" {
  description = "Vm Image"

  default = {
    publish = "MicrosoftSharePoint"
    offer   = "MicrosoftSharePointServer"
    sku     = "2016"
    version = "16.0.4357"
  }
}

provider "azurerm" {
  subscription_id = "${var.TF_VAR_subs_id}"
  client_id       = "${var.TF_VAR_cli_id}"
  tenant_id       = "${var.TF_VAR_ten_id}"
  client_secret   = "${var.TF_VAR_cli_secret}"
}

module "resource_group" {
  source   = "./azure_modules/resource_group"
  rg_name  = "rgMain"
  location = "${var.location}"
}

module "vnet" {
  source      = "./azure_modules/vnet/"
  vnet_name   = "vnetMain"
  vnet_cidr   = "10.10.0.0/16"
  dns_servers = ["8.8.8.8", "8.8.4.4"]
  location    = "${var.location}"
  rg_name     = "${module.resource_group.name}"
}

module "nsg_internal" {
  source   = "./azure_modules/nsg"
  nsg_name = "nsgInternal"
  location = "${var.location}"
  rg_name  = "${module.resource_group.name}"
}

module "nsg_internal_rule" {
  source                      = "./azure_modules/nsg_rule"
  nsg_rule_name               = "ssh"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  source_address_prefix       = "*"
  destination_port_range      = 22
  destination_address_prefix  = "*"
  resource_group_name         = "${module.resource_group.name}"
  network_security_group_name = "${module.nsg_internal.name}"
}

module "nsg_external" {
  source   = "./azure_modules/nsg"
  nsg_name = "nsgExternal"
  location = "${var.location}"
  rg_name  = "${module.resource_group.name}"
}

module "nsg_external_rule" {
  source                      = "./azure_modules/nsg_rule"
  nsg_rule_name               = "ssh"
  priority                    = 101
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  source_address_prefix       = "*"
  destination_port_range      = 80
  destination_address_prefix  = "*"
  resource_group_name         = "${module.resource_group.name}"
  network_security_group_name = "${module.nsg_external.name}"
}

module "subnet_internal" {
  source         = "./azure_modules/subnet"
  sb_name        = "sbInternal"
  sb_addr_prefix = "10.10.3.0/24"
  rg_name        = "${module.resource_group.name}"
  vnet_name      = "${module.vnet.vnet_name}"
  nsgId          = "${module.nsg_internal.id}"
}

module "subnet_external" {
  source         = "./azure_modules/subnet"
  sb_name        = "sbExternal"
  sb_addr_prefix = "10.10.4.0/24"
  rg_name        = "${module.resource_group.name}"
  vnet_name      = "${module.vnet.vnet_name}"
  nsgId          = "${module.nsg_external.id}"
}

module "route_table" {
  source   = "./azure_modules/route_table"
  rt_name  = "rtMain"
  location = "${var.location}"
  rg_name  = "${module.resource_group.name}"
}

module "route" {
  source           = "./azure_modules/route"
  r_name           = "externalRoute"
  r_address_prefix = "0.0.0.0/0"
  next_hop         = "Internet"
  rg_name          = "${module.resource_group.name}"
  rt_name          = "${module.route_table.name}"
}

module "public_ip" {
  source       = "./azure_modules/public_ip"
  pi_name      = "gw_pub_ip"
  pub_ip_alloc = "static"
  location     = "${var.location}"
  rg_name      = "${module.resource_group.name}"
}

module "gw_network_interface_int" {
  source            = "./azure_modules/network_interface"
  ni_name           = "gw_int"
  ni_ip_config_name = "gw_int"
  pvt_ip_addr_alloc = "dynamic"
  location          = "${var.location}"
  rg_name           = "${module.resource_group.name}"
  ni_subnet_id      = "${module.subnet_internal.id}"
  pub_ip_addr_id    = "${module.public_ip.id}"
  nsg_id            = "${module.nsg_external.id}"
}

module "gw_managed_disk" {
  source               = "./azure_modules/managed_disk"
  name                 = "gateway"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "15"
  location             = "${var.location}"
  rg_name              = "${module.resource_group.name}"
}

module "gw_availability_set" {
  source        = "./azure_modules/availability_set"
  avset_name    = "gateway"
  fault_domain  = 2
  update_domain = 5
  av_managed    = "true"
  location      = "${var.location}"
  rg_name       = "${module.resource_group.name}"
}

module "gw_virtual_machine" {
  source                       = "./azure_modules/virtual_machine"
  vm_name                      = "gateway"
  flavor                       = "Standard_DS1_v2"
  location                     = "${var.location}"
  rg_name                      = "${module.resource_group.name}"
  ni_ids                       = ["${module.gw_network_interface_int.id}"]
  availability_set_id          = "${module.gw_availability_set.id}"
  vm_image                     = "${var.vm_image}"
  storage_os_disk_name         = "gatewayosdsk"
  storage_os_caching           = "ReadWrite"
  storage_os_md_type           = "Standard_LRS"
  storage_os_create_option     = "FromImage"
  storage_data_disk_name       = "${module.gw_managed_disk.name}"
  storage_data_managed_disk_id = "${module.gw_managed_disk.id}"
  storage_data_create_option   = "Attach"
  storage_data_lun             = 0
  storage_data_disk_size_gb    = "20"
  computer_name                = "gateway"
  admin_username               = "orelhinhas"
  admin_password               = "h3ll0str4ng3r"
}
```
