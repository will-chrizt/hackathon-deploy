provider "aws" {
  region = var.aws_region
}


resource "aws_instance" "k8s_master" {
  ami                    = "ami-04f59c565deeb2199"
  instance_type          = var.instance_type
  key_name               = var.ssh_key_name

  associate_public_ip_address = true

  user_data = file("./bootstrap.sh")

  tags = {
    Name = "k8s-master"
  }
}
