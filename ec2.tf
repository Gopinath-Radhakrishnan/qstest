resource "aws_launch_template" "hwapp" {
  name_prefix = "hello_world"
  network_interfaces {
    device_index    = 0
    security_groups = [aws_security_group.asg.id]
  }
  ebs_optimized = true
  iam_instance_profile {
    name = ""
  }
  image_id                             = var.ami
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = var.instance_type
  key_name                             = var.keyname
  monitoring {
    enabled = true
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "helloWorld"
    }
  }
  user_data = filebase64("${path.module}/script.sh")
}


##### AutoScaling Group ####

resource "aws_autoscaling_group" "this" {
  #availability_zones  = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1]]
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  target_group_arns   = [aws_lb_target_group.target_group.arn]
  vpc_zone_identifier = [aws_subnet.private_zonea.id, aws_subnet.private_zoneb.id]

  launch_template {
    id      = aws_launch_template.hwapp.id
    version = aws_launch_template.hwapp.latest_version
  }
}

