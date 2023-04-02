provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region     = var.AWS_REGION
}

resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name : var.environment_VPC
    vpc_env : "dev"
  }
}

resource "aws_subnet" "my-subnet-1" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = "us-east-2a"

  tags = {
    Name : var.environment_subnet
  }
}

data "aws_vpc" "existing-vpc" {
  default = true
}

resource "aws_subnet" "my-subnet-4" {
  vpc_id            = data.aws_vpc.existing-vpc.id
  cidr_block        = var.default_subnet_cidr_block
  availability_zone = "us-east-2a"

  tags = {
    Name : var.environment_def_subnet
  }
}

resource "aws_instance" "my_instance" {
  ami           = "ami-02f97949d306b597a"
  instance_type = var.instance_type

  tags = {
    name = var.instance_name
  }
}

output "dev-vpc-id" {
  value = aws_vpc.my-vpc.id
}

output "dev-subnet-id" {
  value = aws_subnet.my-subnet-4.id
}

output "public-ip" {
  value = aws_instance.my_instance.public_ip
}

output "private_ip" {
  value = aws_instance.my_instance.private_ip
}
