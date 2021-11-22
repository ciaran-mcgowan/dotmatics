terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "sa-aws"

    workspaces {
      name = "aws-hashiqube-eu-west-2"
    }
  }
  required_providers {
    aws = {
      version = "~> 3.0 "
      source  = "hashicorp/aws"
    }
  }
}
