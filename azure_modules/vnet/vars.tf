variable "location" {
  description = "Region"
}

variable "vnet_name" {
  description = "VNet name"
}

variable "vnet_cidr" {
  description = "VNET cidr"
}

variable "dns_servers" {
  type        = "list"
  description = "List of DNS servers"
}

variable "rg_name" {
  description = "Resource Group name"
}
