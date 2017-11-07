resource "aws_autoscaling_group" "main" {
	availability_zones = ["${split(",", var.availability_zones)}"]
	name = "${var.asg_name}"
	max_size = "${var.max_size}"
	min_size = "${var.min_size}"
	health_check_grace_period = "${var.health_check_grace_period}"
	health_check_type = "${var.health_check_type}"
	desired_capacity = "${var.desired_capacity}"
	force_delete = "${var.force_delete}"
	launch_configuration = "${var.launch_configuration}"
	vpc_zone_identifier = ["${var.vpc_zone_identifier}"]
	load_balancers = ["${var.load_balancers}"]
	tag {
		key = "Name"
		value = "${var.instance_name}"
		propagate_at_launch = true
	}
}
