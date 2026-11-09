# Elastic Iprovider 
# Static public IP address for the NAT gatewaction "action "" "name" {

resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name        = "${var.vpc_name}-nat-eip"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

# NAT Gatewayaction 
# Allows private subnets to access the internetaction "action "" "name" {

resource "aws_nat_gateway" "eks_nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name        = "${var.vpc_name}-nat"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }

  depends_on = [
    aws_internet_gateway.eks_igw
  ]
}
