resource "aws_instance" "main" {
  ami                         = "${var.ami}"
  availability_zone           = "${var.availability_zone}"
  instance_type               = "${var.instance_type}"
  monitoring                  = "${var.monitoring}"
#	user_data										=	 "${var.user_data}"
  ebs_optimized               = "${var.ebs_optimized}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  key_name                    = "${var.key_name}"
  tenancy                     = "${var.tenancy}"
  vpc_security_group_ids      = ["${var.vpc_security_group_ids}"]
  subnet_id                   = "${var.subnet_id}"

  tags {
    Name   = "${var.instance_name}"
  }

  root_block_device {
    volume_type           = "${var.volume_type}"
    volume_size           = "${var.volume_size}"
    iops                  = "${var.iops}"
    delete_on_termination = "${var.delete_on_termination}"
  }
}
