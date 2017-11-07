variable "avset_name" {
  description = "Availability Set Name"
}

variable "location" {
  description = "Region"
}

variable "rg_name" {
  description = "Resource Group Name"
}

variable "av_managed" {
  description = "Specifies whether the availability set is managed or not"
}

variable "fault_domain" {
  description = "Number of fault domains"
}

variable "update_domain" {
  description = "Number of update domains"
}
