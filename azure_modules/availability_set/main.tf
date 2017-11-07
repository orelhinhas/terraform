resource "azurerm_availability_set" "main" {
  name                         = "${var.avset_name}"
  location                     = "${var.location}"
  managed                      = "${var.av_managed}"
  resource_group_name          = "${var.rg_name}"
  platform_fault_domain_count  = "${var.fault_domain}"
  platform_update_domain_count = "${var.update_domain}"
}
