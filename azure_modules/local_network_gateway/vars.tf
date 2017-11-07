variable "lng_name" {
	description = "The name of the local network gateway"
}

variable "resource_group_name" { 
	description = " The name of the resource group in which to create the local network gateway"
}

variable "location" {
	description = "The location/region where the local network gatway is created."
}

variable "gateway_address" {
	description = "The IP address of the gateway to which to connect"
}

variable "address_space" {
	type = "list"
	description = "The list of string CIDRs representing the address spaces the gateway exposes"
}

