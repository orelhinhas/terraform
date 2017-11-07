variable "availability_zones" {
	type = "list"
	description = "A list of AZs to launch resources in"
}

variable "asg_name" {
	description = "Auto Scaling Group name"
}

variable "instance_name" {
	description = "Name of that ASG will associate to instance"
}

variable "max_size" {
	description = "The maximum size of the auto scale group"
}

variable "min_size" {
	description = "The minimum size of the auto scale group"
}

variable "health_check_grace_period" {
	description = "Time (in seconds) after instance comes into service before checking health"
}

variable "health_check_type" {
	description = "EC2 or ELB. Controls how health checking is done"
}

variable "desired_capacity" {
	description = "The number of Amazon EC2 instances that should be running in the group"
}

variable "force_delete" {
	description = "Allows deleting the autoscaling group without waiting for all instances in the pool to terminate. You can force an autoscaling group to delete even if it's in the process of scaling a resource. Normally, Terraform drains all the instances before deleting the group. This bypasses that behavior and potentially leaves resources dangling."
}

variable "launch_configuration" {
	description = "The launch configuration of the autoscale group"
}

variable "vpc_zone_identifier" {
	type = "list"
	description = "A list of subnet IDs to launch resources in."
}

variable "load_balancers" {
	type = "list"
	description = "The load balancer names associated with the autoscaling group"
}
