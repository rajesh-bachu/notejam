resource "aws_lb" "api" {
  name               = "${local.prefix}-main"
  load_balancer_type = "application"
  subnets = [
    "subnet-5a5fe116",
    "subnet-6ab41f16"
  ]

  security_groups = [aws_security_group.lb.id]

  tags = local.common_tags
}

resource "aws_lb_target_group" "api" {
  name        = "${local.prefix}-api"
  protocol    = "HTTP"
  vpc_id      = "vpc-e84dd882"
  target_type = "ip"
  port        = 80

  health_check {
    path = "/"
  }
}

resource "aws_lb_listener" "api" {
  load_balancer_arn = aws_lb.api.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.api.arn
  }
}

resource "aws_security_group" "lb" {
  description = "Allow access to Application Load Balancer"
  name        = "${local.prefix}-lb"
  vpc_id      = "vpc-e84dd882"

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol  = "tcp"
    from_port = 0
    to_port   = 0

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags
}
