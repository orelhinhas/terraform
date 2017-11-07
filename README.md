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
