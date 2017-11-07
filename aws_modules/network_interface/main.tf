resource "aws_network_interface" "main" {
  subnet_id       = "${var.subnet_id}"
  security_groups = ["${var.security_groups}"]
  source_dest_check = "${var.source_dest_check}"
}
