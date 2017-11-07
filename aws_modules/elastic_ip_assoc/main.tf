resource "aws_eip_association" "main" {
  instance_id   = "${var.instance_id}"
  allocation_id = "${var.allocation_id}"
}
