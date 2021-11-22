variable "deploy_to_aws" {
  type        = bool
  default     = true
  description = "Deploy Hashiqube on AWS"
}

variable "whitelist_cidr" {
  description = "Additional CIDR to whitelist"
  type        = string
  default     = "0.0.0.0/0"
}

variable "ssh_public_key" {
  type        = string
  default     = "~/.ssh/devops.pub"
  description = "SSH public key"
}

variable "aws_profile" {
  type        = string
  default     = "default"
  description = "AWS profile"
}

variable "aws_region" {
  type        = string
  default     = "eu-west-2"
  description = "The region in which all AWS resources will be launched"
}

variable "aws_instance_type" {
  type        = string
  default     = "t2.medium"
  description = "AWS instance type"
}

variable "number_of_instances" {
  type    = string
  default = "1"
}

variable "region" {
  type    = string
  default = "eu-west-1"
}



