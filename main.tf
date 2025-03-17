#configure provider
provider "aws" {
  region = var.region
}

module "vpc and networking" {
  source = "./VPC and Networking"
  region = var.region
  vpc_cidr = var.vpc_cidr
  public_subnet1_cidr = var.public_subnet1_cidr
  availability_zone1 = var.availability_zone1
  public_subnet2_cidr = var.public_subnet2_cidr
  availability_zone2 = var.availability_zone2
  private_subnet1_cidr = var.private_subnet1_cidr
  private_subnet2_cidr = var.private_subnet2_cidr
  public_subnet_rt_cidr = var.public_subnet_rt_cidr
  private_subnet_rt_cidr = var.private_subnet_rt_cidr

}