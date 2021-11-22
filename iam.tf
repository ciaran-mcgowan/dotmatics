resource "aws_iam_role" "hashiqube" {
  name = "hashiqube"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "hashiqube" {
  name = "hashiqube"
  role = aws_iam_role.hashiqube.name
}

resource "aws_iam_role_policy" "hashiqube" {
  name = "hashiqube"
  role = aws_iam_role.hashiqube.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}