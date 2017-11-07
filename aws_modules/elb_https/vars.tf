variable "elb_name" {
  description = "Elastic LoadBalancer Name"
}

variable "subnets" {
  type        = "list"
  description = "A list of subnet IDs to attach to the ELB"
}

variable "internal" {
  description = "If true, ELB will be an internal ELB"
}

variable "security_groups" {
  type        = "list"
  description = "A list of security group IDs to assign to the ELB. Only valid if creating an ELB within a VPC"
}

variable "instance_port" {
  description = "The port on the instance to route to"
}

variable "instance_protocol" {
  description = "The protocol to use to the instance. Valid values are HTTP, HTTPS, TCP, or SSL"
}

variable "lb_port" {
  description = "The port to listen on for the load balancers"
}

variable "lb_protocol" {
  description = "The protocol to listen on. Valid values are HTTP, HTTPS, TCP, or SSL"
}

variable "healthy_threshold" {
  description = "The number of checks before the instance is declared healthy."
}

variable "unhealthy_threshold" {
  description = "The number of checks before the instance is declared unhealthy."
}

variable "timeout" {
  description = "The length of time before the check times out"
}

variable "target" {
  description = "The target of the check"
}

variable "interval" {
  description = "The interval between checks"
}

variable "cross_zone_load_balancing" {
  description = "Enable cross-zone load balancing"
}

variable "ssl_certificate_id" {
	description = "The ARN of an SSL certificate you have uploaded to AWS IAM"
}

