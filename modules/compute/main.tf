#Retrieve the AMI ID using a data source
data "aws_ami" "latest_ami" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}

# create a lunch template for the Ec2 instances that would be using ASG.
resource "aws_launch_template" "ec2_instance_template" {
  name                                 = "EC2 instance template"
  image_id                             = data.aws_ami.latest_ami.id
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = var.instance_type
  vpc_security_group_ids               = [aws_security_group.security_group_lb.id]

  tags = {
    Name        = "ec2-instance lunch template"
    Environment = "prod"
  }
  user_data = filebase64("${path.module}/example.sh")
}


#create an Auto Scaling Group (ASG) that launches EC2 instances.
resource "aws_autoscaling_group" "ec2-auto-Scaling-group" {
  name                = "EC2 Autoscaling group"
  max_size            = var.asg_max_size
  min_size            = var.asg_min_size
  health_check_type   = "ELB"
  desired_capacity    = var.asg_desired_capacity
  vpc_zone_identifier = [aws_subnet.private-subnet1.id, aws_subnet.private-subnet2.id]
  launch_template {
    id      = aws_launch_template.ec2_instance_template.id
    version = aws_launch_template.ec2_instance_template.latest_version
  }
}
