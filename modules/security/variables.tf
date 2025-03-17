variable "region" {
  description = "AWS region"
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
