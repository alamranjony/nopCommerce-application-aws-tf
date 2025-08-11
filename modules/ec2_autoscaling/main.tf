resource "aws_launch_template" "app" {
  name_prefix   = "${var.name_prefix}-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  update_default_version = true

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = var.security_group_ids
  }

  user_data = base64encode(
    templatefile("${path.module}/scripts/user-data.tpl", {})
  )


  # Tags applied to the launched EC2 instances
  tag_specifications {
    resource_type = "instance"
    tags = merge(
      var.default_tags,
      {
        Name = "${var.name_prefix}-instance"
      }
    )
  }

  # Optional: tags for EBS volumes created with instances
  tag_specifications {
    resource_type = "volume"
    tags = merge(
      var.default_tags,
      {
        Name = "${var.name_prefix}-volume"
      }
    )
  }
}

resource "aws_autoscaling_group" "app" {
  name                      = "${var.name_prefix}-asg"
  desired_capacity          = var.desired_capacity
  min_size                  = var.min_size
  max_size                  = var.max_size
  vpc_zone_identifier       = var.private_subnet_ids
  health_check_type         = "EC2"

  launch_template {
    id      = aws_launch_template.app.id
    version = aws_launch_template.app.latest_version
  }

  tag {
    key                 = "Name"
    value               = "${var.name_prefix}-instance"
    propagate_at_launch = true
  }

  dynamic "tag" {
    for_each = var.default_tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

  target_group_arns = var.target_group_arns
}
