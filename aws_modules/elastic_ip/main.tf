resource "aws_eip" "main" {
  instance = "${var.instance}"
  vpc      = "${var.vpc}"
}
