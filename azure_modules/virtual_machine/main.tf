resource "azurerm_virtual_machine" "main" {
  name                  = "${var.vm_name}"
  location              = "${var.location}"
  resource_group_name   = "${var.rg_name}"
  network_interface_ids = ["${var.ni_ids}"]
  vm_size               = "${var.flavor}"
  availability_set_id   = "${var.availability_set_id}"

  storage_image_reference {
    publisher = "${var.vm_image["publish"]}"
    offer     = "${var.vm_image["offer"]}"
    sku       = "${var.vm_image["sku"]}"
    version   = "${var.vm_image["version"]}"
  }

  storage_os_disk {
    name              = "${var.storage_os_disk_name}"
    caching           = "${var.storage_os_caching}"
    managed_disk_type = "${var.storage_os_md_type}"
    create_option     = "${var.storage_os_create_option}"
  }

  storage_data_disk {
    name            = "${var.storage_data_disk_name}"
    managed_disk_id = "${var.storage_data_managed_disk_id}"
    create_option   = "${var.storage_data_create_option}"
    lun             = "${var.storage_data_lun}"
    disk_size_gb    = "${var.storage_data_disk_size_gb}"
  }

  os_profile {
    computer_name  = "${var.computer_name}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
  }
}
