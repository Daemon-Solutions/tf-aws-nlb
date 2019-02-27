# tf-aws-nlb

AWS Network Load-Balancer (NLB) - Terraform Module

## Usage

### Basic Usage

```js
provider "aws" {
 region = "eu-west-2"
}

module "nlb" {
   source                   = "../modules/tf-aws-nlb"
   envname                  = "dev"
   service                  = "test"
   name                     = "test"
   subnets                  = ["subnet-51353829", "subnet-e65d70ac"]
   enable_http_listener     = true
   enable_https_listener    = true
   vpc_id                   = "${var.vpc_id}"
   target_health_check_port = "80"
}
```

### Advanced Usage

If you need to use custom ports, you can call the listener and target_group submodules within this module directly.

## Modifying variables

If you have modified variables or this README you should generate by running `terraform-docs md . > README.md`



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| deregistration_delay | (Optional) The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. The range is 0-3600 seconds. | string | `300` | no |
| enable_deletion_protection | If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. | string | `false` | no |
| enable_http_listener | If true, enable default HTTP target group and listener | string | `false` | no |
| enable_https_listener | If true, enable default HTTPS target group and listener | string | `false` | no |
| envname |  | string | - | yes |
| health_check_healthy_threshold | (Optional) The number of consecutive health checks successes required before considering an unhealthy target healthy. | string | `2` | no |
| health_check_interval | (Optional) The approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds. | string | `5` | no |
| health_check_unhealthy_threshold | (Optional) The number of consecutive health check failures required before considering the target unhealthy. | string | `2` | no |
| http_stickiness | (Optional) If true, enables stickiness | string | `false` | no |
| http_stickiness_cookie_duration | (Optional) The time period, in seconds, during which requests from a client should be routed to the same target. After this time period expires, the load balancer-generated cookie is considered stale. The range is 1 second to 1 week (604800 seconds). | string | `86400` | no |
| http_stickiness_type | (Required) The type of sticky sessions. The only current possible value is lb_cookie. | string | `lb_cookie` | no |
| internal | If true, the ALB will be internal | string | `false` | no |
| name | The name of the ALB. This name must be unique within your AWS account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen. If not specified, Terraform will autogenerate a name beginning with tf-lb. | string | - | yes |
| service |  | string | - | yes |
| subnets | A list of subnet IDs to attach to the LB | string | `<list>` | no |
| target_health_check_port | The port to use to connect with the target. Valid values are either ports 1-65536, or traffic-port. | string | `80` | no |
| target_port | The port on which targets receive traffic, unless overridden when registering a specific target | string | `80` | no |
| vpc_id | (Required) The identifier of the VPC in which to create the target group. | string | `` | no |

## Outputs

| Name | Description |
|------|-------------|
| default_http_listener_arn | ARN for the default HTTP listener |
| default_https_listener_arn | ARN for the default HTTPS listener |
| default_target_group_arn | ARN for the default target group |
| nlb_arn | The ARN of the load balancer (matches id). |
| nlb_arn_suffix | The ARN suffix for use with CloudWatch Metrics. |
| nlb_dns_name | The DNS name of the load balancer. |
| nlb_id | The ARN of the load balancer (matches arn). |
| nlb_zone_id | The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record). |

