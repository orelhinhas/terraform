resource "azurerm_virtual_network" "main" {
  name                = "${var.vnet_name}"
  address_space       = ["${var.vnet_cidr}"]
  location            = "${var.location}"
  resource_group_name = "${var.rg_name}"
  dns_servers         = "${var.dns_servers}"
}
