resource "aws_network_acl" "main" {
  vpc_id      = "${var.vpc_id}"
	subnet_ids	= ["${var.subnet_ids}"]
}
