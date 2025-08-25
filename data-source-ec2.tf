data "aws_subnet" "brave_public_subnet_1_1a" {
  id = "subnet-0f0d162d3f16890c8"
}

data "aws_security_group" "brave_security_group" {
  id = "sg-0e618742a8f4ead03"
}
