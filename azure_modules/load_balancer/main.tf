resource "azurerm_lb" "main" {
	name = "${var.elb_name}"
	location = "${var.location}"
	resource_group_name = "${var.rg_name}"

	frontend_ip_configuration {
		name = "${var.frontend_ip_config_name}"
		public_ip_address_id = "${var.public_ip_address_id}"
	}
}

