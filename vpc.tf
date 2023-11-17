resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = "helloworldvpc"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "igwmain"
  }
}

resource "aws_eip" "elastic_ip" {
  tags = {
    Name = "hweip"
  }
}

resource "aws_subnet" "private_zonea" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_zonea
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "Private_zonea"
  }
}

resource "aws_subnet" "private_zoneb" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_zoneb
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "Private_zoneB"
  }
}

resource "aws_subnet" "public_zonea" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr_zonea
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "Public_zoneA"
  }
}

resource "aws_subnet" "public_zoneb" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr_zoneb
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "Public_zoneB"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.public_route
    gateway_id = aws_internet_gateway.this.id
  }
  tags = {
    Name = "public"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id     = aws_eip.elastic_ip.id
  connectivity_type = "public"
  subnet_id         = aws_subnet.public_zonea.id

  tags = {
    Name = "hwnat"
  }

  depends_on = [aws_internet_gateway.this]
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.public_route
    gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = {
    Name = "privatert"
  }
}


resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private_zonea.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private_zoneb.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_zonea.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public1" {
  subnet_id      =  aws_subnet.public_zoneb.id
  route_table_id = aws_route_table.public.id
}


/* resource "aws_subnet" "natgw_zonea" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.nat_subnet_cidr_zonea
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "natgw_zonea"
  }
}

resource "aws_subnet" "natgw_zoneb" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.nat_subnet_cidr_zoneb
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "natgw_zoneb"
  }
} */


/* resource "aws_eip" "zonea" {
  domain = "vpc"
  tags = {
    Name = "zonea"
  }
}

resource "aws_eip" "zoneb" {
  domain = "vpc"
  tags = {
    Name = "zoneb"
  }
} */

/* resource "aws_nat_gateway" "zonea" {
  allocation_id = aws_eip.zonea.id
  subnet_id     = aws_subnet.natgw_zonea.id

  tags = {
    Name = "main"
  }

  depends_on = [aws_internet_gateway.this]
}


resource "aws_nat_gateway" "zoneb" {
  allocation_id = aws_eip.zoneb.id
  subnet_id     = aws_subnet.natgw_zoneb.id

  tags = {
    Name = "main"
  }

  depends_on = [aws_internet_gateway.this]
}

resource "aws_security_group" "this" {
  name        = "http"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block, var.public_route]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.public_route]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "allow_HTTP"
  }
} */

