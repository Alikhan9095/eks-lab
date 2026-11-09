# define the variables for each blockaction 
# Project and AWS configuration 

variable "aws_region" {
  description = "AWS region where EKS infra will be created"
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "Name of EKS cluster"
  type        = string
  default     = "eks-lab-dev"
}


# VPC configuration 
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "eks-lab-vpc"
}

# Define the CIDR
variable "vpc_cidr" {
  description = "IPv4 CIDR range for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# subnet configuration 
# Public Subnet CIDR range 

variable "public_subnet_cidrs" {
  description = "CIDR range for public subnets"
  type        = list(string)

  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

# private subnet CIDR rangephemeral 
variable "private_subnet_cidrs" {
  description = "CIDR range for private subnets"
  type        = list(string)

  default = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]
}

# EKS Managed Node Group configuration 
variable "node_instance_type" {
  description = "EC2 instance type for EKS worker nodes"
  type        = string
  default     = "t3.medium"
}

variable "node_desired_size" {
  description = "Desired number of worker node"
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}
