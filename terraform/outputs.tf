output "master_public_ip" {
  description = "Public IP of the Kubernetes master node"
  value       = aws_instance.k8s_master.public_ip
}
