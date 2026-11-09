# Public Subnets

resource "aws_subnet" "public" {
  count = 2

  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name                                        = "${var.vpc_name}-public-${count.index + 1}"
    Environment                                 = "dev"
    ManagedBy                                   = "Terraform"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

# private Subnets

resource "aws_subnet" "private" {
  count = 2

  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name                                        = "${var.vpc_name}-private-${count.index + 1}"
    Environment                                 = "dev"
    ManagedBy                                   = "Terraform"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}
