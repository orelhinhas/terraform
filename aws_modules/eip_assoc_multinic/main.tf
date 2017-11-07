resource "aws_eip_association" "main" {
  allocation_id = "${var.allocation_id}"
	network_interface_id  = "${var.network_interface_id}"
}
