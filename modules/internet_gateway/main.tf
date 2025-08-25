resource "aws_internet_gateway" "brave_internet_gateway" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.internet_gateway_tag
  }
}

# Tester IGW
resource "aws_internet_gateway" "tester_internet_gateway" {

  vpc_id = data.aws_vpc.tester_vpc.id

  tags = {
    Name = var.tester_internet_gateway_tag
  }
}