variable "vpc_id" {
  description = "The ID of the VPC in which the endpoint will be used."
}

variable "service_name" {
	description = "The AWS service name, in the form com.amazonaws.region.service."
}

variable "route_table_ids" {
	type = "list"
	description = "One or more route table IDs."
}
