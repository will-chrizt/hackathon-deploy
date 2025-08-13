provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "k8s_master_sg" {
  name        = "k8s-master-sg"
  description = "Allow SSH and Kubernetes API"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Kubernetes API"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "k8s_master" {
  ami                    = var.master_ami
  instance_type          = var.instance_type
  key_name               = var.ssh_key_name
  vpc_security_group_ids = [aws_security_group.k8s_master_sg.id]
  associate_public_ip_address = true

  user_data = file("${path.module}/bootstrap.sh")

  tags = {
    Name = "k8s-master"
  }
}
