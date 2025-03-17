variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR bloack for the VPC"
  type        = string
}

variable "public_subnet1_cidr" {
  description = "The CIDR block for the public-subnet1"
  type        = list()
}

variable "availability_zone1" {
  description = "The first availaibility zone"
  type        = string
}

variable "public_subnet2_cidr" {
  description = "The CIDR block for the public-subnet2"
  type        = list()
}

variable "availability_zone2" {
  description = "The second availaibility zone"
  type        = string
}

variable "private_subnet1_cidr" {
  description = "The CIDR block for the private-subnet1"
  type        = list()
}

variable "private_subnet2_cidr" {
  description = "The CIDR block for the private-subnet2"
  type        = list()
}

variable "public_subnet_rt_cidr" {
  description = "The CIDR block for the public-subnets"
  type        = string
}

variable "private_subnet_rt_cidr" {
  description = "The CIDR block for the private-subnets"
  type        = string
}


