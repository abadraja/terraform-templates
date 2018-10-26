resource "aws_key_pair" "mykey-tit" {
  key_name = "mykey-tit"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
