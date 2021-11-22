resource "aws_security_group" "hashiqube" {
  name   = "hashiqube"
  vpc_id = data.terraform_remote_state.aws_sandbox.outputs.vpc_id
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "whitelist_cidr" {
  count             = var.whitelist_cidr != "" ? 1 : 0
  type              = "ingress"
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = [var.whitelist_cidr]
  from_port         = 0
  security_group_id = aws_security_group.hashiqube.id
}