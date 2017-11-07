variable "ni_name" {
  description = "Network Interface Name"
}

variable "location" {
  description = "Region"
}

variable "rg_name" {
  description = "Resource Group Name"
}

variable "ni_ip_config_name" {
  description = "Ip Configuration Name"
}

variable "ni_subnet_id" {
  description = "Subnet Id"
}

variable "pvt_ip_addr_alloc" {
  description = "Private Ip Address Allocation"
}

variable "pub_ip_addr_id" {
  description = "Public IP address ID"
}

variable "nsg_id" {
  description = "Network Security Group Id"
}
