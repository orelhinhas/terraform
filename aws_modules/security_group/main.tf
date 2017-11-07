resource "aws_security_group" "main" {
  name        = "${var.sg_name}"
  description = "${var.sg_name} - Security Group"
  vpc_id      = "${var.vpc_id}"
}
