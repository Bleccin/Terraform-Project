variable "region" {
  description = "AWS region"
  type        = string
}

variable "alb_target_group_port" {
  description = "Target group port for ALB"
  type        = number
}

variable "alb_port" {
  description = "Target port for ALB"
  type        = number
}
