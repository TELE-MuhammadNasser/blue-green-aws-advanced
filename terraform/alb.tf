resource "aws_lb" "main" {
   name                 = "${var.project}-alb"
   internal             = false
   load_balancer_type   = "application"
   security_groups      = [aws_security_group.alb.id]
   subnets              = [aws_subnet.public_1.id, aws_subnet.public_2.id]
}

resource "aws_lb_target_group" "blue" {
   name         = "${var.project}-blue-tg"
   port         = 3000
   protocol     = "HTTP"
   vpc_id       = aws_vpc.main.id
   target_type  = "ip"

   health_check {
     path                 = "/health"
     healthy_threshold    = 2
     unhealthy_threshold  = 2
  }
}

resource "aws_lb_target_group" "green" {
   name         = "${var.project}-green-tg"
   port         = 3000
   protocol     = "HTTP"
   vpc_id       = aws_vpc.main.id
   target_type  = "ip"

   health_check {
     path                 = "/health"
     healthy_threshold    = 2
     unhealthy_threshold  = 2
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    forward {
      target_group {
        arn    = aws_lb_target_group.blue.arn
        weight = 100
      }
      target_group {
        arn    = aws_lb_target_group.green.arn
        weight = 0
      }
    }
  }
}
