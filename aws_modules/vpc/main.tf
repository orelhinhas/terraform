resource "aws_vpc" "main" {
  cidr_block           = "${var.cidr_block}"
  instance_tenancy     = "${var.instance_tenancy}"
  enable_dns_support   = "${var.dns_support}"
  enable_dns_hostnames = "${var.dns_hostnames}"

  tags {
    Name = "${var.vpc_name}"
  }
}
