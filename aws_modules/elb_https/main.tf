resource "aws_elb" "main" {
  name            = "${var.elb_name}"
  subnets         = ["${var.subnets}"]
  internal        = "${var.internal}"
  security_groups = ["${var.security_groups}"]

  listener {
    instance_port     = "${var.instance_port}"
    instance_protocol = "${var.instance_protocol}"
    lb_port           = "${var.lb_port}"
    lb_protocol       = "${var.lb_protocol}"
		ssl_certificate_id = "${var.ssl_certificate_id}"
  }

  health_check {
    healthy_threshold   = "${var.healthy_threshold}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
    timeout             = "${var.timeout}"
    target              = "${var.target}"
    interval            = "${var.interval}"
  }

  cross_zone_load_balancing = "${var.cross_zone_load_balancing}"
}
