# Outputs

// The ARN of the load balancer (matches arn).
output "nlb_id" {
  value = "${aws_lb.nlb.id}"
}

// The ARN of the load balancer (matches id).
output "nlb_arn" {
  value = "${aws_lb.nlb.arn}"
}

// The ARN suffix for use with CloudWatch Metrics.
output "nlb_arn_suffix" {
  value = "${aws_lb.nlb.arn_suffix}"
}

// The DNS name of the load balancer.
output "nlb_dns_name" {
  value = "${aws_lb.nlb.dns_name}"
}

// The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record).
output "nlb_zone_id" {
  value = "${aws_lb.nlb.zone_id}"
}

// ARN for the default target group
output "default_target_group_arn" {
  value = "${module.http_target_group.nlb_target_group_arn}"
}

// ARN for the default HTTP listener
output "default_http_listener_arn" {
  value = "${module.http_listener.nlb_listener_arn}"
}

// ARN for the default HTTPS listener
output "default_https_listener_arn" {
  value = "${module.https_listener.nlb_listener_arn}"
}
