resource "aws_subnet" "web_public_subnets" {
  count                   = length(var.web_public_subnet_cidr)
  vpc_id                  = aws_vpc.jsr_vpc.id
  cidr_block              = element(var.web_public_subnet_cidr, count.index)
  availability_zone       = element(var.availability_zone, count.index)
  map_public_ip_on_launch = true
  tags = {
           Name = "${var.platform_name}-${var.application_name}-${var.Environment}-${element(var.web_public_subnet_names, count.index)}"
    }
  depends_on = [aws_vpc.jsr_vpc]
}

resource "aws_subnet" "app_private_subnets" {
  count                   = length(var.app_private_subnet_cidr)
  vpc_id                  = aws_vpc.jsr_vpc.id
  cidr_block              = element(var.app_private_subnet_cidr, count.index)
  availability_zone       = element(var.availability_zone, count.index)
  map_public_ip_on_launch = true
  tags = { 
           Name = "${var.platform_name}-${var.application_name}-${var.Environment}-${element(var.app_private_subnet_names, count.index)}"
    }
  depends_on = [aws_vpc.jsr_vpc]
}

