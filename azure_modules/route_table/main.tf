resource "azurerm_route_table" "main" {
  name                = "${var.rt_name}"
  location            = "${var.location}"
  resource_group_name = "${var.rg_name}"
}
