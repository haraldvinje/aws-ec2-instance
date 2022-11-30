resource "aws_default_vpc" "default" {}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "SSH from everywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "tls_private_key" "ubuntu_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ubuntu_key_pair" {
  key_name   = var.generated_key_name
  public_key = tls_private_key.ubuntu_ssh_key.public_key_openssh

  provisioner "local-exec" {
    command = <<-EOT
      echo '${tls_private_key.ubuntu_ssh_key.private_key_pem}' > ./'${self.key_name}'.pem
      chmod 400 ./'${self.key_name}'.pem
    EOT
  }

  provisioner "local-exec" {
    when    = destroy
    command = <<-EOT
      chmod 600 ./'${self.key_name}'.pem
      rm ./'${self.key_name}'.pem
    EOT
  }
}

resource "aws_instance" "ubuntu_server" {
  ami           = "ami-096800910c1b781ba"
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  key_name               = aws_key_pair.ubuntu_key_pair.key_name

  tags = {
    Name = "UbuntuServer"
  }
}
