resource "aws_instance" "example" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  
  root_block_device {
      volume_size = 10
  }

  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"
  tags {
      Name = "${var.INSTANCE_DEVICE_NAME}"
  }
  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
  
  # the public SSH key
  key_name = "${aws_key_pair.mykey-tit.key_name}"

    # provisioner "remote-exec" {
    # inline = [
    #   "echo 'Hello, example execute after init'"
    # ]
  # } 
}

resource "aws_ebs_volume" "ebs-volume-1" {
    availability_zone = "eu-west-1a"
    size = 10
    type = "gp2" 
    tags {
        Name = "extra volume data"
    }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id = "${aws_ebs_volume.ebs-volume-1.id}"
  instance_id = "${aws_instance.example.id}"
}
