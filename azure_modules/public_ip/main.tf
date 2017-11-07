resource "azurerm_public_ip" "main" {
  name                         = "${var.pi_name}"
  location                     = "${var.location}"
  resource_group_name          = "${var.rg_name}"
  public_ip_address_allocation = "${var.pub_ip_alloc}"
}
