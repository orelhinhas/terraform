variable "lc_name" {
  description = "Launch Configuration name"
}

variable "image_id" {
  description = "The EC2 image ID to launch"
}

variable "key_name" {
  description = "The key name that should be used for the instance"
}

variable "security_groups" {
  type = "list"
  description = "A list of associated security group IDS."
}

variable "user_data" {
  description = "The path to a file with user_data for the instances"
}

variable "associate_public_ip_address" {
  description = "Add or not an IP public to asg's instance"
}

variable "instance_type" {
	description = "Type of the instance"
}
