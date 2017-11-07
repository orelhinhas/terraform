resource "azurerm_network_interface" "main" {
  name                      = "${var.ni_name}"
  location                  = "${var.location}"
  resource_group_name       = "${var.rg_name}"
  network_security_group_id = "${var.nsg_id}"

  ip_configuration {
    name                          = "${var.ni_ip_config_name}"
    subnet_id                     = "${var.ni_subnet_id}"
    private_ip_address_allocation = "${var.pvt_ip_addr_alloc}"
    public_ip_address_id          = "${var.pub_ip_addr_id}"
  }
}
