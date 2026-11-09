# Internet Gatewaction   
# Connect our VPC to the internet 

resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name        = "${var.vpc_name}-igw"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}
