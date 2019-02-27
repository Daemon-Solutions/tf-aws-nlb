# Target group variables
variable "envname" {}

variable "service" {}

variable "is_enabled" {
  description = "This is used only when module is invoked from the main ALB module"
  default     = true
}

variable "target_name" {
  description = "(Required) The name of the target group."
}

variable "target_port" {
  description = "(Required) The port on which targets receive traffic, unless overridden when registering a specific target."
  default     = "80"
}

variable "vpc_id" {
  description = "(Required) The identifier of the VPC in which to create the target group."
}

variable "deregistration_delay" {
  description = "(Optional) The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. The range is 0-3600 seconds. The default value is 300 seconds."
  default     = "300"
}

## Stickiness variables
variable "stickiness" {
  description = "(Optional) If true, enables stickiness"
  default     = false
}

variable "stickiness_type" {
  description = "(Required) The type of sticky sessions. The only current possible value is lb_cookie."
  default     = "lb_cookie"
}

variable "stickiness_cookie_duration" {
  description = "(Optional) The time period, in seconds, during which requests from a client should be routed to the same target. After this time period expires, the load balancer-generated cookie is considered stale. The range is 1 second to 1 week (604800 seconds). The default value is 1 day (86400 seconds)."
  default     = "86400"
}

## Health check variables
variable "health_check_interval" {
  description = "(Optional) The approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds. Default 30 seconds."
  default     = "10"
}

variable "health_check_port" {
  description = "(Optional) The port to use to connect with the target. Valid values are either ports 1-65536, or traffic-port. Defaults to traffic-port."
  default     = "80"
}

variable "health_check_timeout" {
  description = "(Optional) The amount of time, in seconds, during which no response means a failed health check. Defaults to 5 seconds."
  default     = "3"
}

variable "health_check_healthy_threshold" {
  description = "(Optional) The number of consecutive health checks successes required before considering an unhealthy target healthy. Defaults to 5."
  default     = "2"
}

variable "health_check_unhealthy_threshold" {
  description = "(Optional) The number of consecutive health check failures required before considering the target unhealthy. Defaults to 2."
  default     = "2"
}
