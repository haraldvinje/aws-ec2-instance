output "ec2_public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = try(aws_instance.ubuntu_server.public_dns)
}
