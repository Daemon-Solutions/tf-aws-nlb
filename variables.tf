variable "envname" {}
variable "service" {}

variable "name" {
  description = "The name of the ALB. This name must be unique within your AWS account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen. If not specified, Terraform will autogenerate a name beginning with tf-lb."
}

variable "enable_http_listener" {
  description = "If true, enable default HTTP target group and listener"
  default     = false
}

variable "enable_https_listener" {
  description = "If true, enable default HTTPS target group and listener"
  default     = false
}

variable "internal" {
  description = "If true, the ALB will be internal"
  default     = false
}

variable "subnets" {
  description = "A list of subnet IDs to attach to the LB"
  default     = []
}

variable "enable_deletion_protection" {
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer."
  default     = false
}

# Below variables are used to configure default target group and listeners

variable "vpc_id" {
  description = "(Required) The identifier of the VPC in which to create the target group."
  default     = ""
}

variable "target_port" {
  description = "The port on which targets receive traffic, unless overridden when registering a specific target"
  default     = 80
}

variable "target_health_check_port" {
  description = "The port to use to connect with the target. Valid values are either ports 1-65536, or traffic-port."
  default     = "80"
}

# Stickiness for the default HTTP listener's target group
variable "http_stickiness" {
  description = "(Optional) If true, enables stickiness"
  default     = false
}

variable "http_stickiness_type" {
  description = "(Required) The type of sticky sessions. The only current possible value is lb_cookie."
  default     = "lb_cookie"
}

variable "http_stickiness_cookie_duration" {
  description = "(Optional) The time period, in seconds, during which requests from a client should be routed to the same target. After this time period expires, the load balancer-generated cookie is considered stale. The range is 1 second to 1 week (604800 seconds)."
  default     = "86400"
}

variable "deregistration_delay" {
  description = "(Optional) The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. The range is 0-3600 seconds."
  default     = "300"
}

variable "health_check_interval" {
  description = "(Optional) The approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds."
  default     = "10"
}

variable "health_check_healthy_threshold" {
  description = "(Optional) The number of consecutive health checks successes required before considering an unhealthy target healthy."
  default     = "2"
}

variable "health_check_unhealthy_threshold" {
  description = "(Optional) The number of consecutive health check failures required before considering the target unhealthy."
  default     = "2"
}
