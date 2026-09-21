output "devops_tools_public_ip" {
  value       = aws_instance.devops_tools_host.public_ip
  description = "Public IP address of the DevOps Tools EC2 instance"
}

output "vpc_id" {
  value       = aws_vpc.petclinic_vpc.id
  description = "ID of the provisioned PetClinic VPC"
}

output "public_subnet_id" {
  value       = aws_subnet.public_subnet.id
  description = "ID of the public subnet"
}