resource "aws_vpc_endpoint" "main" {
 vpc_id          = "${var.vpc_id}"
 service_name		 = "${var.service_name}"
 route_table_ids = ["${var.route_table_ids}"]
}
