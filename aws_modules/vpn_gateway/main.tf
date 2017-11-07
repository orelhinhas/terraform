resource "aws_vpn_gateway" "main" {
	vpc_id = "${var.vpc_id}"
	availability_zone = "${var.availability_zone}"
	tags {
		Name = "${var.vpn_gateway_name}"
	}
}
