# public Route Table 
# Route internet traffic the Internet gatewayaction "action "" "name" {

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }
  tags = {
    Name        = "${var.vpc_name}-public-rt"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

# public Route Table Associationsaction 
# Connection both public subnets to the public route tableaction 

resource "aws_route_table_association" "public" {
  count = 2

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# private Route Tableaction 
# Route internet traffic through the NAT Gatewaction

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_nat.id
  }

  tags = {
    Name        = "${var.vpc_name}-private-rt"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

# Private Route Table associationaction
# Connect both private subnet to the private route tableaction "action "" "name" {

resource "aws_route_table_association" "private" {
  count = 2

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}