resource "azurerm_route" "main" {
  name                = "${var.r_name}"
  resource_group_name = "${var.rg_name}"
  route_table_name    = "${var.rt_name}"
  address_prefix      = "${var.r_address_prefix}"
  next_hop_type       = "${var.next_hop}"
}
