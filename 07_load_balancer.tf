########### ALB ###########

resource "aws_lb" "Final_alb" {
  name               = "Final-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Final_alb_sg.id]
  subnets            = aws_subnet.Final_pub_subnet.*.id
}


# alb tg

resource "aws_lb_target_group" "Final_alb_tg" {
  name        = "Final-alb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id


    health_check {
      enabled             = true
      healthy_threshold   = 3
      interval            = 5
      matcher             = "200" 
      path                = "/"
      port                = "traffic-port"
      protocol            = "HTTP"
      timeout             = 2
      unhealthy_threshold = 2
    }
}


# alb listener

resource "aws_lb_listener" "Final_alb_listener" {
  load_balancer_arn = aws_lb.Final_alb.arn
  port              = "80"
  protocol          = "HTTP"
 # certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
 # alpn_policy       = "HTTP2Preferred"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Final_alb_tg.arn
  }
}


# resource "aws_lb_listener" "web_alb_listener_https"{
#     load_balancer_arn = aws_lb.web_elb.arn
#     port = "443"
#     protocol = "HTTPS"
#     ssl_policy        = "ELBSecurityPolicy-2016-08"
#     certificate_arn   = "arn:aws:acm:ap-northeast-2:533616270150:certificate/ad70a98d-9d5d-4571-be33-b83a4a5364ec"

#     default_action {
#       type = "forward"
#       target_group_arn = aws_lb_target_group.ec2_web_target_group.arn
#     }
# }









########### NLB ###########

resource "aws_lb" "Final_nlb" {
  name               = "Final-nlb"
  internal           = true
  load_balancer_type = "network"
  subnets            = aws_subnet.Final_web_subnet.*.id
}


# nlb tg

resource "aws_lb_target_group" "Final_nlb_tg" {
    name = "Final-nlb-tg"
    port = 8080
    protocol = "TCP"
    vpc_id = var.vpc_id
}


# nlb listener

resource "aws_lb_listener" "Final_nlb_listener" {
    load_balancer_arn = aws_lb.Final_nlb.arn
    port = "8080"
    protocol = "TCP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.Final_nlb_tg.arn
    }
  
}