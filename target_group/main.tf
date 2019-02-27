resource "aws_lb_target_group" "nlb_target_group" {
  count    = "${var.is_enabled}"
  name     = "${var.target_name}"
  port     = "${var.target_port}"
  protocol = "TCP"
  vpc_id   = "${var.vpc_id}"

  deregistration_delay = "${var.deregistration_delay}"

  health_check {
    interval            = "${var.health_check_interval}"
    port                = "${var.health_check_port}"
    protocol            = "TCP"
    healthy_threshold   = "${var.health_check_healthy_threshold}"
    unhealthy_threshold = "${var.health_check_unhealthy_threshold}"
  }

  stickiness {
    enabled         = "${var.stickiness}"
    type            = "${var.stickiness_type}"
    cookie_duration = "${var.stickiness_cookie_duration}"
  }

  tags {
    Name        = "${var.target_name}"
    Environment = "${var.envname}"
    Service     = "${var.service}"
  }
}
