resource "aws_iam_policy" "iam_for_kops" {
  name        = "iam_for_kops"
  path        = "/"
  description = "Policy for Kops"

  policy = "${file("policy.json")}"
}
