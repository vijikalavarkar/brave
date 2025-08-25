terraform {
  backend "s3" {
    bucket = "brave-state-bucket-001"
    key    = "brave_support.tfstate"
    region = "us-east-1"
  }
}


resource "aws_instance" "brave_ec2" {
  ami                         = "ami-0bbdd8c17ed981ef9"
  instance_type               = "t2.micro"
  key_name                    = "TKey"
  subnet_id                   = data.aws_subnet.brave_public_subnet_1_1a.id
  vpc_security_group_ids      = [data.aws_security_group.brave_security_group.id]
  associate_public_ip_address = true

  tags = {
    Name = "brave_ec2"
  }
}