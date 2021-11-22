output "aab_instructions" {
  value = <<INSTRUCTIONS
Use the Hashiqube SSH output below to login to your instance
To get Vault Shamir keys and Root token do "sudo cat /etc/vault/init.file"
INSTRUCTIONS
  description = <<INSTRUCTIONS
Use the Hashiqube SSH output below to login to your instance
To get Vault Shamir keys and Root token do "sudo cat /etc/vault/init.file"
INSTRUCTIONS
}

output "hashiqube_ip" {
  value = aws_eip.hashiqube.public_ip
}

output "aws_hashiqube-ssh" {
  value = try("ssh ubuntu@${aws_eip.hashiqube.public_ip}", null)
}

output "aws_hashiqube-nomad" {
  value = try("http://${aws_eip.hashiqube.public_ip}:4646", null)
}

output "aws_hashiqube-consul" {
  value = try("http://${aws_eip.hashiqube.public_ip}:8500", null)
}

output "aws_hashiqube-vault" {
  value = try("http://${aws_eip.hashiqube.public_ip}:8200", null)
}

output "aws_hashiqube-fabio-ui" {
  value = try("http://${aws_eip.hashiqube.public_ip}:9998", null)
}

output "aws_hashiqube-fabio-lb" {
  value = try("http://${aws_eip.hashiqube.public_ip}:9999", null)
}