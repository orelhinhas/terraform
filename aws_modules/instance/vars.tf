variable "ami" {
  description = "The id of the AMI"
}

variable "availability_zone" {
  description = "The availability zone of the Instance."
}

variable "instance_type" {
  description = "Type of the instance"
}

variable "monitoring" {
  description = "Monitoring with CloudWatch"
}

variable "ebs_optimized" {
  description = "Whether the Instance is EBS optimized or not"
}

variable "associate_public_ip_address" {
  description = "Whether or not the Instance is associated with a public IP address or not"
}

variable "key_name" {
  description = "Name of keypair to instance"
}

variable "tenancy" {
  description = "The tenancy of the instance: dedicate"
}

variable "vpc_security_group_ids" {
  type        = "list"
  description = "The associated security groups in a non-default VPC"
}

variable "subnet_id" {
  description = "The VPC subnet ID"
}

variable "instance_name" {
  description = "The name of the instance"
}

variable "volume_type" {
  description = "The type of volume. Can be 'standard', 'gp2', or 'io1'"
}

variable "volume_size" {
  description = "The size of the volume in gigabytes"
}

variable "iops" {
  description = "The amount of provisioned IOPS. This is only valid for volume_type of 'io1', and must be specified if using that type"
}

variable "delete_on_termination" {
  description = "Whether the volume should be destroyed on instance termination"
}
