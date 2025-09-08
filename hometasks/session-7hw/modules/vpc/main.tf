resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr_block
    instance_tenancy = var.instance_tenancy

    tags = {
        Name = "${var.name_vpc}"
        Enviroment = "${var.env}"
    }
    }

resource "aws_subnet" "pub" {
    count = lenght(var.pub-sub)
    availability_zone = var.az[count.index]
    vpc_id = aws_vpc.main.id 
    cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index) 

    tags = {
        Name = var.pub-sub[count.index]
        Enviroment = var.env
    }
}


resource "aws_subnet" "priv" {
    count = lenght(var.priv-sub)
    availability_zone = var.az[count.index]
    vpc_id = aws_vpc.main.id 
    cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index +10) 

    tags = {
        Name = var.priv-sub[count.index]
        Enviroment = var.env
    }
}

resource "aws_route_table" "pub" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.route_cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.priv_route_table_name
    Environment = var.env 
  }
}

resource "aws_route_table" "priv" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.route_cidr_block
    gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = var.priv_route_table_name
    Environment = var.env
  }
}

resource "aws_route_table_association" "pub" {
  count          = length(var.pub-sub)
  subnet_id      = aws_subnet.pub[count.index].id
  route_table_id = aws_route_table.pub.id
}

resource "aws_route_table_association" "priv1" {
  count          = length(var.priv-sub)
  subnet_id      = aws_subnet.priv[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = var.igw_name
        Environment = var.env
}
}
resource "aws_eip" "nat_eip" {
      domain = var.eip_domain
      tags = {
        Name = var.ngw_name
      }
    }
resource "aws_nat_gateway" "ngw" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id         = aws_subnet.pub[1].id

    tags = {
        Name = var.ngw_name
        Environment = var.env
    }
}