variable "elb_name" { 
	description = "Specifies the name of the LoadBalancer"
}
variable "location" {
	description = "Specifies the supported Azure location where the resource exists"
}
variable "rg_name" {
	description = "Resource Group Name"
}
variable "frontend_ip_config_name" {
	description = "Specifies the name of the frontend ip configuration"
}
variable "public_ip_address_id" {
	description = "Reference to Public IP address to be associated with the Load Balancer."
}
