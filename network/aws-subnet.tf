resource "aws_subnet" "public-subnet-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_1_cider
    availability_zone = var.az_1
    map_public_ip_on_launch  = true
  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_1_cider
  availability_zone = var.az_1

  tags = {
    Name = "private-subnet-1"
  }
}



resource "aws_subnet" "public-subnet-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_2_cider
  availability_zone = var.az_2
map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-2"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_2_cider
  availability_zone = var.az_2

  tags = {
    Name = "private-subnet-2"
  }
}

resource "aws_subnet" "public-subnet-3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_3_cider
  availability_zone = var.az_3
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-3"
  }
}

resource "aws_subnet" "private-subnet-3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_3_cider
  availability_zone = var.az_3

  tags = {
    Name = "private-subnet-3"
  }
}