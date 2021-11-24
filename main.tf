resource "aws_instance" "hashiqube" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.aws_instance_type
  vpc_security_group_ids = [aws_security_group.hashiqube.id]
  key_name               = aws_key_pair.hashiqube.key_name
  subnet_id              = var.subnet_id
  #user_data_base64    = base64gzip(data.template_file.hashiqube.rendered)
  iam_instance_profile = aws_iam_instance_profile.hashiqube.name
  tags = {
    Name = "hashiqube"
    Department = "IT"
    Billable = "yes"
  }
}

resource "aws_key_pair" "hashiqube" {
  key_name   = "hashiqube"
  public_key = file("${path.module}/scripts/devops.pub")
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.hashiqube.id
  allocation_id = aws_eip.hashiqube.id
}

resource "aws_eip" "hashiqube" {
  vpc = true
}
