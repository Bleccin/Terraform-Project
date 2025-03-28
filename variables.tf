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

variable "load_balancer_cidr" {
  description = "Load Balancer CIDR Block"
  type        = string
}

variable "port_lb_ingress_1" {
  description = "first port for ingress traffic to LB"
  type        = number
}

variable "port_lb_ingress_2" {
  description = "second port for ingress traffic to LB"
  type        = number
}

variable "port_lb_egress" {
  description = "port for egress traffic to LB"
  type        = number
}

variable "ec2_port" {
  description = "port for egress traffic to LB"
  type        = number
}

variable "ec2_egress_cidr" {
  description = "port for egress traffic to LB"
  type        = string
}

variable "instance_type" {
  description = "Type of Ec2 Instance"
  type        = string
}

variable "asg_max_size" {
  description = "maximum size of auto scaling group"
  type        = number
}

variable "asg_min_size" {
  description = "minimum size of auto scaling group"
  type        = number
}

variable "asg_desired_capacity" {
  description = "desired size of auto scaling group"
  type        = number
}

variable "alb_target_group_port" {
  description = "Target group port for ALB"
  type = number
}

variable "alb_port" {
  description = "Target port for ALB"
  type = number
}