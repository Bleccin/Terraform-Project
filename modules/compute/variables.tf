variable "region" {
  description = "AWS region"
  type        = string
}

variable "instance_type" {
  description = "Type of Ec2 Instance"
  type        = string
  default     = "t2.micro"
}

variable "asg_max_size" {
  description = "maximum size of auto scaling group"
  type        = number
  default     = 4
}

variable "asg_min_size" {
  description = "minimum size of auto scaling group"
  type        = number
  default     = 2
}

variable "asg_desired_capacity" {
  description = "desired size of auto scaling group"
  type        = number
  default     = 2
}
