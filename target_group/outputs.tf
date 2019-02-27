# Outputs
#   id - The ARN of the Target Group (matches arn)
#   arn - The ARN of the Target Group (matches id)
#   arn_suffix - The ARN suffix for use with CloudWatch Metrics.

output "nlb_target_group_id" {
  value = "${element(concat(aws_lb_target_group.nlb_target_group.*.id, list("")), 0)}"
}

output "nlb_target_group_arn" {
  value = "${element(concat(aws_lb_target_group.nlb_target_group.*.arn, list("")), 0)}"
}

output "nlb_target_group_arn_suffix" {
  value = "${element(concat(aws_lb_target_group.nlb_target_group.*.arn_suffix, list("")), 0)}"
}
