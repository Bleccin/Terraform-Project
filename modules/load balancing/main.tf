#create target group for the Application Load Balancer
resource "aws_lb_target_group" "alb_target_group" {
  name        = "Application Load Balancer Target Group"
  target_type = "alb"
  port        = var.alb_target_group_port
  protocol    = "TCP"
  vpc_id      = aws_vpc.main-vpc.id

  tags = {
    Name        = "ALB-Target group"
    Environment = "Prod"
  }
}

#create a target group attachment for the Application Load Balancer targeting the EC2 instances on port 8080
resource "aws_lb_target_group_attachment" "alb_target_group_attachment" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = aws_lb.alb.id
  port             = var.alb_target_group_port
}

#create an Application Load Balancer (ALB) that distributes traffic to the EC2 instances in the ASG.
resource "aws_lb" "alb" {
  name               = "Ec2-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security_group_lb.id]
  subnets            = [aws_subnet.private-subnet1.id, aws_subnet.private-subnet2.id]

  enable_deletion_protection = true

  tags = {
    Name        = "Application Load Balancer"
    Environment = "production"
  }
}

#An ALB Listener that listens on port 80 and forwards traffic to the Target Group.
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.alb_port
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
  tags = {
    Name        = "ALB Listener"
    Environment = "Prod"
  }
}
