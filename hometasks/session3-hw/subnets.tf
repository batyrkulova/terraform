resource "aws_subnet" "pub-a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "Pub.sub-a"
  }
}

resource "aws_subnet" "pub-b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "Pub.sub-b"
  }
}

resource "aws_subnet" "pub-c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-2c"
  tags = {
    Name = "Pub.sub-c"
  }
}


resource "aws_subnet" "priv-a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "Priv.sub-a"
  }
}

resource "aws_subnet" "priv-b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "Priv.sub-b"
  }
}

resource "aws_subnet" "priv-c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "Priv.sub-c"
  }
}