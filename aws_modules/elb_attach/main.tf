resource "aws_elb_attachment" "main" {
  count    = "${var.attach_count}"
  elb      = "${var.elb}"
  instance = "${var.instances_id[count.index]}"
}
