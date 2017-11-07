variable "vm_name" {
  description = "Virtual Machine Name"
}

variable "location" {
  description = "Region"
}

variable "rg_name" {
  description = "Resource Group Name"
}

variable "ni_ids" {
  description = "Network Interface Ids"
  type        = "list"
}

variable "flavor" {
  description = "Size of Virtual machine"
}

variable "availability_set_id" {
  description = "Availability Set Id"
}

variable "vm_image" {
  description = "Virtual Machine Image"
  type        = "map"
}

variable "storage_os_disk_name" {
  description = "Storage OS Disk"
}

variable "storage_os_caching" {
  description = "Caching requirements"
}

variable "storage_os_md_type" {
  description = "Specifies the type of managed disk to create"
}

variable "storage_os_create_option" {
  description = "Specifies how the virtual machine should be created"
}

variable "storage_data_disk_name" {
  description = "A list of Storage Data disk"
}

variable "storage_data_managed_disk_id" {
  description = "Specifies an existing managed disk to use by id"
}

variable "storage_data_create_option" {
  description = "Specifies how the data disk should be created"
}

variable "storage_data_lun" {
  description = "Specifies the logical unit number of the data disk"
}

variable "storage_data_disk_size_gb" {
  description = "Specifies the size of the data disk in gigabytes"
}

variable "computer_name" {
  description = "Name of virtual machine"
}

variable "admin_username" {
  description = "Specifies the name of the administrator account"
}

variable "admin_password" {
  description = "Specifies the password of the administrator account"
}

variable "backup" {
  description = "A boolean value to enable or disable Azure Backup"
}
