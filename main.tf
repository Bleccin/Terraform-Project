#configure provider
provider "aws" {
  region = var.region
}

module "vpc and networking" {
  source                 = "./modules/VPC and Networking"
  region                 = var.region
  vpc_cidr               = var.vpc_cidr
  public_subnet1_cidr    = var.public_subnet1_cidr
  availability_zone1     = var.availability_zone1
  public_subnet2_cidr    = var.public_subnet2_cidr
  availability_zone2     = var.availability_zone2
  private_subnet1_cidr   = var.private_subnet1_cidr
  private_subnet2_cidr   = var.private_subnet2_cidr
  public_subnet_rt_cidr  = var.public_subnet_rt_cidr
  private_subnet_rt_cidr = var.private_subnet_rt_cidr

}

module "security" {
  source             = "./modules/security"
  region             = var.region
  load_balancer_cidr = var.load_balancer_cidr
  port_lb_ingress_1  = var.port_lb_ingress_1
  port_lb_ingress_2  = var.port_lb_ingress_2
  port_lb_egress     = var.port_lb_egress
  ec2_port           = var.ec2_port
  ec2_egress_cidr    = var.ec2_egress_cidr
}

module "compute" {
  source               = "./modules/compute"
  region               = var.region
  instance_type        = var.instance_type
  asg_max_size         = var.asg_max_size
  asg_min_size         = var.asg_min_size
  asg_desired_capacity = var.asg_desired_capacity
}
