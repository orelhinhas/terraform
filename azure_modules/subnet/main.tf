resource "azurerm_subnet" "main" {
  name                      = "${var.sb_name}"
  resource_group_name       = "${var.rg_name}"
  virtual_network_name      = "${var.vnet_name}"
  address_prefix            = "${var.sb_addr_prefix}"
  network_security_group_id = "${var.nsgId}"
}
