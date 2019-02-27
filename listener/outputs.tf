# Outputs
# id - The ARN of the listener (matches arn)
# arn - The ARN of the listener (matches id)

output "nlb_listener_id" {
  value = "${element(concat(aws_lb_listener.nlb_listener.*.id, list("")), 0)}"
}

output "nlb_listener_arn" {
  value = "${element(concat(aws_lb_listener.nlb_listener.*.arn, list("")), 0)}"
}
