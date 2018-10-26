output "ss" {
    value = "${aws_instance.example.public_ip}"
    # value = "${var.AWS_ACCESS_KEY}"
}
