resource "aws_lb_listener" "nlb_listener" {
  count             = "${var.is_enabled}"
  load_balancer_arn = "${var.load_balancer_arn}"
  port              = "${var.listener_port}"
  protocol          = "TCP"

  default_action {
    target_group_arn = "${var.target_group_arn}"
    type             = "${var.listener_action_type}"
  }
}
