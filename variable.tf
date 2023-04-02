variable "AWS_ACCESS_KEY" {
 description = "AWS ACCESS KEY"
}

variable "AWS_SECRET_KEY" {
  description = "AWS SECRET KEY"
}

variable "AWS_REGION" {
  description = "AWS REGION"
}

variable "vpc_cidr_block" {
  description = "vpc cidr block"
}

variable "subnet_cidr_block" {
  description = "subnet cidr block"
}

variable "default_subnet_cidr_block" {
  description = "default subnet cidr block"
}

variable "environment_VPC" {
  description = "vpc environment"
}

variable "environment_subnet" {
  description = "subnet environment"
}

variable "environment_def_subnet" {
  description = "default subnet environment"
}

variable "instance_type" {
  description = "instance type"
}

variable "instance_name" {
  description = "instance name"
}