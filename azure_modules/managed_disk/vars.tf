variable "name" {
  description = "Managed Disk Name"
}

variable "location" {
  description = "Region"
}

variable "rg_name" {
  description = "Resource Group Name"
}

variable "storage_account_type" {
  description = "The type of storage to use for the managed disk."
}

variable "create_option" {
  description = "The method to use when creating the managed disk."
}

variable "disk_size_gb" {
  description = "Size of the managed disk"
}
