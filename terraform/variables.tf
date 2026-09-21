variable "aws_region" {
  default     = "us-east-1"
  description = "AWS Region"
}

variable "ami_id" {
  default     = "ami-0261755bb28930970" # Ubuntu 22.04 LTS (us-east-1 x86_64)
  description = "Ubuntu 22.04 LTS AMI ID"
}

variable "key_name" {
  default     = "petclinic-key"
  description = "AWS EC2 Key Pair Name"
}