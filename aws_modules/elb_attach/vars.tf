variable "attach_count" {
  description = "Number of instances to attach"
}

variable "elb" {
  description = "The ELB ID"
}

variable "instances_id" {
  type        = "list"
  description = "The instance ID"
}
