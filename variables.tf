variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "Base CIDR for the VPC"
  default     = "10.0.0.0/16"
}

variable "instance_type_web" {
  default = "t3.micro"
}

variable "instance_type_db" {
  default = "t3.small"
}

variable "my_ip" {
  description = "Your public IP for SSH access (e.g., 1.2.3.4/32)"
}

variable "key_name" {
  description = "Name of the existing AWS Key Pair"
}
