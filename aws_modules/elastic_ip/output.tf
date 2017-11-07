output "id" {
  value = "${aws_eip.main.id}"
}

output "private_ip" {
  value = "${aws_eip.main.private_ip}"
}

output "associate_with_private_ip" {
  value = "${aws_eip.main.private_ip}"
}

output "public_ip" {
  value = "${aws_eip.main.public_ip}"
}

output "instance" {
  value = "${aws_eip.main.instance}"
}

output "network_interface" {
  value = "${aws_eip.main.network_interface}"
}
