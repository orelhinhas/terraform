resource "aws_eip" "main" {
  vpc      = "${var.vpc}"
	network_interface = "${var.network_interface}"
}
