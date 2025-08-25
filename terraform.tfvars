# AWS Region
aws_region = "us-east-1"

# VPC
vpc_cidr = "10.0.0.0/16"
vpc_tag  = "brave_vpc"

# Internet Gateway
internet_gateway_tag = "brave_internet_gateway"

# Subnets
subnet1_cidr = "10.0.1.0/24"
subnet1_az   = "us-east-1a"
subnet1_tag  = "brave_public_subnet_1_1a"

subnet2_cidr = "10.0.2.0/24"
subnet2_az   = "us-east-1a"
subnet2_tag  = "brave_public_subnet_2_1a"

subnet3_cidr = "10.0.3.0/24"
subnet3_az   = "us-east-1b"
subnet3_tag  = "brave_public_subnet_3_1b"

# Route Tables
route_table_cidr = "0.0.0.0/0"
route_table_tag  = "brave_public_route_table"

# Security Groups
security_group_tag = "brave_security_group"

# Tester
tester_internet_gateway_tag = "tester_internet_gateway"
