resource "aws_security_group_rule" "main" {
  type              = "${var.type}"
  from_port         = "${var.from_port}"
  to_port           = "${var.to_port}"
  protocol          = "${var.protocol}"
  security_group_id = "${var.security_group_id}"
	self							=	"${var.self}"
}
