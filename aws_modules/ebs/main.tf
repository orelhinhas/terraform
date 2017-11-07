resource "aws_ebs_volume" "main" {
	availability_zone = "${var.availability_zone}"
	size = "${var.size}"
	iops = "${var.iops}"
	encrypted = "${var.encrypted}"
	type = "${var.type}"
	tags {
		Name = "${var.ebs_name}"
	}
}
