resource "aws_route_table" "brave_public_route_table" {

  vpc_id = var.vpc_id

  route {
    cidr_block = var.route_table_cidr
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = var.route_table_tag
  }
}