variable "is_enabled" {
  description = "This is used only when module is invoked from the main ALB module"
  default     = true
}

variable "load_balancer_arn" {
  description = "(Required, Forces New Resource) The ARN of the load balancer."
}

variable "listener_port" {
  description = "(Required) The port on which the load balancer is listening."
  default     = "80"
}

variable "target_group_arn" {
  description = "(Required) The ARN of the Target Group to which to route traffic."
}

variable "listener_action_type" {
  description = "(Required) The type of routing action. The only valid value is forward."
  default     = "forward"
}
