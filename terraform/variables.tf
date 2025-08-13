variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "master_ami" {
  description = "AMI ID with pre-installed Docker and kubeadm"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the master node"
  type        = string
  default     = "t2.large"
}

variable "ssh_key_name" {
  description = "Name of the AWS key pair for SSH access"
  type        = string
  default     ="willchristnv"
}

variable "ssh_user" {
  description = "SSH user for the AMI (not used in user_data but for reference)"
  type        = string
  default     = "ubuntu"
}
