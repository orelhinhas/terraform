variable "vpc_id" {
  description = "Enter VPC id to NACL"
}

variable "subnet_ids" {
	type				= "list"
	description = "Enter Subnet id to NACL"
}
