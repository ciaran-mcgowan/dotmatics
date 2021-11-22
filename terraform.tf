terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "dotmatics"

    workspaces {
      name = "aws-instance"
    }
  }
  required_providers {
    aws = {
      version = "~> 3.0 "
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {}

provider "aws" {
  alias      = "sandbox"
}