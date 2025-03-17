variable "region" {
  description = "AWS region"
  type = string
  default = "us-east-2"
}

variable "vpc_cidr" {
  description = "The CIDR bloack for the VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnet1_cidr" {
  description = "The CIDR block for the public-subnet1"
  type = string
  default = "10.0.1.0/24"
}

variable "availability_zone1" {
  description = "The first availaibility zone"
  type = string
  default = "us-east-2a"
}

variable "public_subnet2_cidr" {
  description = "The CIDR block for the public-subnet2"
  type = string
  default = "10.0.2.0/24"
}

variable "availability_zone2" {
  description = "The second availaibility zone"
  type = string
  default = "us-east-2b"
}

variable "private_subnet1_cidr" {
  description = "The CIDR block for the private-subnet1"
  type = string
  default = "10.0.3.0/24"
}

variable "private_subnet2_cidr" {
  description = "The CIDR block for the private-subnet2"
  type = string
  default = "10.0.4.0/24"
}

variable "public_subnet_rt_cidr" {
  description = "The CIDR block for the public-subnets"
  type = string
  default = "0.0.0.0/0"
}

variable "private_subnet_rt_cidr" {
  description = "The CIDR block for the private-subnets"
  type = string
  default = "0.0.0.0/0"
}