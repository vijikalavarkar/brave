terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "brave-state-bucket-001"
    key    = "brave.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_tag  = var.vpc_tag
}

module "internet_gateway" {
  source               = "./modules/internet_gateway"
  vpc_id               = module.vpc.vpc_id
  internet_gateway_tag = var.internet_gateway_tag
}

module "subnets" {
  source       = "./modules/subnets"
  vpc_id       = module.vpc.vpc_id
  subnet1_cidr = var.subnet1_cidr
  subnet1_az   = var.subnet1_az
  subnet1_tag  = var.subnet1_tag
  subnet2_cidr = var.subnet2_cidr
  subnet2_az   = var.subnet2_az
  subnet2_tag  = var.subnet2_tag
  subnet3_cidr = var.subnet3_cidr
  subnet3_az   = var.subnet3_az
  subnet3_tag  = var.subnet3_tag
}

module "route_tables" {
  source              = "./modules/route_tables"
  vpc_id              = module.vpc.vpc_id
  route_table_cidr    = var.route_table_cidr
  route_table_tag     = var.route_table_tag
  internet_gateway_id = module.internet_gateway.internet_gateway_id
}

module "route_table_association" {
  source         = "./modules/route_table_association"
  subnet1_id     = module.subnets.subnet1_id
  subnet2_id     = module.subnets.subnet2_id
  subnet3_id     = module.subnets.subnet3_id
  route_table_id = module.route_tables.route_table_id
}

module "security_groups" {
  source             = "./modules/security_groups"
  vpc_id             = module.vpc.vpc_id
  security_group_tag = var.security_group_tag
}

module "ec2" {
  source            = "./modules/ec2"
  subnet1_id        = module.subnets.subnet1_id
  security_group_id = module.security_groups.security_group_id
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  instance_tag      = var.instance_tag
}

module "dynamodb" {
  source            = "./modules/dynamodb"
  dynamodb_table_name = var.dynamodb_table_name
  billing_mode = var.billing_mode
  hash_key = var.hash_key
}
