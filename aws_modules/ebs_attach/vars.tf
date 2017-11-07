variable "device_name" {
	description = "The device name to expose to the instance (for example, /dev/sdh or xvdh)"
}

variable "volume_id" {
	description = "ID of the Volume to be attached"
}

variable "instance_id" {
	description = "ID of the Instance to attach to"
}

variable "force_detach" {
	description = "set to true if you want to force the volume to detach. Useful if previous attempts failed, but use this option only as a last resort, as this can result in data loss"
}

variable "skip_destroy" {
	description = "Set this to true if you do not wish to detach the volume from the instance to which it is attached at destroy time, and instead just remove the attachment from Terraform state. This is useful when destroying an instance which has volumes created by some other means attached"
}

