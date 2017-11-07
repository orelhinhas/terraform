output "id" {
	value = "${aws_vpc_endpoint.main.id}"
}


output "default_route_table_id" {
	value = "${aws_vpc_endpoint.main.default_route_table_id}"
}
