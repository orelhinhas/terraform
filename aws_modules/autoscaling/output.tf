output "id" {
	value = "${aws_autoscaling_group.main.id}"
}
output "arn" {
	value = "${aws_autoscaling_group.main.arn}"
}
output "availability_zones" {
	value = "${aws_autoscaling_group.main.availability_zones}"
}
output "min_size" {
	value = "${aws_autoscaling_group.main.min_size}"
}
output "max_size" {
	value = "${aws_autoscaling_group.main.max_size}"
}
output "default_cooldown" {
	value = "${aws_autoscaling_group.main.default_cooldown}"
}
output "name" {
	value = "${aws_autoscaling_group.main.name}"
}
output "health_check_grace_period" {
	value = "${aws_autoscaling_group.main.health_check_grace_period}"
}
output "health_check_type" {
	value = "${aws_autoscaling_group.main.health_check_type}"
}
output "desired_capacity" {
	value = "${aws_autoscaling_group.main.desired_capacity}"
}
output "launch_configuration" {
	value = "${aws_autoscaling_group.main.launch_configuration}"
}
output "vpc_zone_identifier" {
	value = "${aws_autoscaling_group.main.vpc_zone_identifier}"
}
output "load_balancers" {
	value = "${aws_autoscaling_group.main.load_balancers}"
}
output "target_group_arns" {
	value = "${aws_autoscaling_group.main.target_group_arns}"
}
