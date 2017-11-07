variable "availability_zone" {
	description = "The AZ where the EBS volume will exist"
}

variable "size" {
	description = "The size of the drive in GiBs"
}

variable "ebs_name" {
	description = "The name of EBS Volume"
}

variable "encrypted" {
	description = "If true, the disk will be encrypted"
}

variable "type" {
	description = "The type of EBS volume. Can be 'standard', 'gp2', 'io1', 'sc1' or 'st1' (Default: 'standard')."
}

variable "iops" {
	description = "The amount of IOPS to provision for the disk"
}
