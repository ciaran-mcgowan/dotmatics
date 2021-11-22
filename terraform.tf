terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "dotmatics"

    workspaces {
      name = "demo"
    }
  }
  required_providers {
    aws = {
      version = "~> 3.0 "
      source  = "hashicorp/aws"
    }
  }
}
