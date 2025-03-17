# create a security group for the Load Balancer

resource "aws_security_group" "security_group_lb" {
  name        = "Load-Balancer-security-group"
  description = "Allow inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main-vpc.id

  tags = {
    Name = "prod-Load Balancer security group"
  }
}

# rule allowing inbound traffic on ports 443 from anywhere
resource "aws_vpc_security_group_ingress_rule" "lb_ingress_1" {
  security_group_id = aws_security_group.security_group_lb.id
  cidr_ipv4         = var.load_balancer_cidr
  from_port         = var.port_lb_ingress_1
  ip_protocol       = "tcp"
  to_port           = var.port_lb_ingress_1
  
  tags = {
    Name = "prod-Load Balancer ingress first port"
  }
  
}

# rule allowing inbound traffic on ports 80 from anywhere
resource "aws_vpc_security_group_ingress_rule" "lb_ingress_2" {
  security_group_id = aws_security_group.security_group_lb.id
  cidr_ipv4         = var.load_balancer_cidr
  from_port         = var.port_lb_ingress_2
  ip_protocol       = "tcp"
  to_port           = var.port_lb_ingress_2

  tags = {
    Name = "prod-Load Balancer ingress second port"
  }
}

# rule allowing outbound traffic to the EC2 instances on port 8080
resource "aws_vpc_security_group_egress_rule" "lb_egress" {
  security_group_id = aws_security_group.security_group_lb.id
  ip_protocol       = "tcp" 
  from_port = var.port_lb_egress
  to_port = var.port_lb_egress
  
  tags = {
    Name = "prod-Load Balancer egress port"
  }
}

# A Security Group for the EC2 instances 
resource "aws_security_group" "security_group_ec2" {
  name        = "Ec2-instance-security-group"
  description = "Allow inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main-vpc.id

  tags = {
    Name = "prod-Ec2 instance security group"
  }
}

# rule allowing inbound traffic on ports 8080 from the Load Balancer's Security Groupnywhere
resource "aws_vpc_security_group_ingress_rule" "ec2_ingress" {
  security_group_id = aws_security_group.security_group_lb.id
  from_port         = var.port_lb_egress
  ip_protocol       = "tcp"
  to_port           = var.port_lb_egress
  
  tags = {
    Name = "prod-Ec2 instance ingress port"
  }
}

# rule allowing outbound traffic to anywhere
resource "aws_vpc_security_group_egress_rule" "ec2_egress" {
  security_group_id = aws_security_group.security_group_lb.id
  ip_protocol       = "-1" 
  cidr_ipv4 = var.ec2_egress_cidr
  
  tags = {
    Name = "prod-Ec2 instance egress traffic"
  }
}