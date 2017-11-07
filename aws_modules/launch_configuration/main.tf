resource "aws_launch_configuration" "main" {
  name = "${var.lc_name}"
  image_id = "${var.image_id}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  security_groups = ["${var.security_groups}"]
  user_data = "${file(var.user_data)}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
}

