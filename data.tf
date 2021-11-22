data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

data "template_file" "hashiqube" {
  template = file("${path.module}/scripts/startup_script")
  vars = {
    HASHIQUBE_AWS_IP   = aws_eip.hashiqube.public_ip
    VAULT_ENABLED      = true
  }
}

data "terraform_remote_state" "aws_sandbox" {
  backend = "remote"
  config = {
    hostname     = "app.terraform.io"
    organization = "sa-aws"
    workspaces = {
      name = "aws-networking-sandbox-eu-west-2"
    }
  }
}