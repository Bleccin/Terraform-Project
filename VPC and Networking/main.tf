#provisioning a VPC
resource "aws_vpc" "main-vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "prod-vpc"
  }
}

#create the first public subnet in the first availability zone
resource "aws_subnet" "public-subnet1" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.public_subnet1_cidr
  availability_zone = var.availability_zone1
  map_public_ip_on_launch = true

  tags = {
    Name = "prod-public-subnet1"
  }
}

#create the second public subnet in the second availability zone
resource "aws_subnet" "public-subnet2" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.public_subnet2_cidr
  availability_zone = var.availability_zone2
  map_public_ip_on_launch = true

  tags = {
    Name = "prod-public-subnet2"
  }
}

#create the first private subnet in the first availability zone
resource "aws_subnet" "private-subnet1" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.private_subnet1_cidr
  availability_zone = var.availability_zone1
  map_public_ip_on_launch = false

  tags = {
    Name = "prod-private-subnet1"
  }
}

#create the second private subnet in the second availability zone
resource "aws_subnet" "private-subnet1" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.private_subnet2_cidr
  availability_zone = var.availability_zone2
  map_public_ip_on_launch = false

  tags = {
    Name = "prod-private-subnet2"
  }
}

#create an Internet Gateway for the VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "prod-igw"
  }
}

#create Route table for public subnets
resource "aws_route_table" "public_subnets_rt" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = var.public_subnet_rt_cidr
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "prod-public-subnets-RT"
  }
}

#create Route table association for public subnet1
resource "aws_route_table_association" "subnet1_rt_association" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.public_subnets_rt.id
}

#create Route table association for public subnet2
resource "aws_route_table_association" "subnet2_rt_association" {
  subnet_id      = aws_subnet.public-subnet2.id
  route_table_id = aws_route_table.public_subnets_rt.id
}

#create an Elastic IP
resource "aws_eip" "elastic_ip" {
  domain   = true
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "prod-elastic-ip"
  }
}

#create a public NAT Gateway
resource "aws_nat_gateway" "public_nat" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public-subnet1.id

  tags = {
    Name = "prod-public-NAT-Gateway"
  }
  depends_on = [aws_internet_gateway.igw]
}

#create a private NAT Gateway
resource "aws_nat_gateway" "private_nat" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.private-subnet1.id
}

#create Route table for private subnets
resource "aws_route_table" "private_subnets_rt" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = var.private_subnet_rt_cidr
    gateway_id = aws_nat_gateway.private_nat.id
  }
  tags = {
    Name = "prod-private-subnets-RT"
  }
}

#create Route table association for private subnet1
resource "aws_route_table_association" "private_subnet1_rt_association" {
  subnet_id      = aws_subnet.private-subnet1.id
  route_table_id = aws_route_table.private_subnets_rt.id
}

#create Route table association for private subnet2
resource "aws_route_table_association" "private_subnet2_rt_association" {
  subnet_id      = aws_subnet.private-subnet2.id
  route_table_id = aws_route_table.private_subnets_rt.id
}


