variable "route_table_id" {
  description = "The ID of the routing table"
}

variable "destination_cidr_block" {
  description = "The destination CIDR block"
}

variable "gateway_id" {
  description = "An ID of a VPC internet gateway or a virtual private gateway."
}
