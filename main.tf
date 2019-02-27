/**
  * # tf-aws-nlb
  *
  * AWS Network Load-Balancer (NLB) - Terraform Module
  *
  * ## Usage
  *
  * ### Basic Usage
  *
  * ```js
  * provider "aws" {
  *  region     = "eu-west-2"
  * }
  *
  * module "nlb" {
  *    source = "../modules/tf-aws-nlb"
  *    envname = "dev"
  *    service = "test"
  *    name = "test"
  *    subnets = ["subnet-51353829", "subnet-e65d70ac"]
  *    enable_http_listener = true
  *    enable_https_listener = true
  *    vpc_id = "${var.vpc_id}"
  *    target_health_check_port = "80"
  * }
  * ```
  *
  * ### Advanced Usage
  *
  * If you need to use custom ports, you can call the listener and target_group submodules within this module directly.
  *
  * ## Modifying variables
  *
  * If you have modified variables or this README you should generate by running `terraform-docs md . > README.md`
  *
  */

resource "aws_lb" "nlb" {
  name                       = "${var.name}-anlb"
  internal                   = "${var.internal}"
  subnets                    = ["${var.subnets}"]
  enable_deletion_protection = "${var.enable_deletion_protection}"
  load_balancer_type = "network"

  tags {
    Name        = "${var.name}"
    Environment = "${var.envname}"
    Service     = "${var.service}"
  }
}

module "http_target_group" {
  is_enabled                       = "${var.enable_http_listener == 1 || var.enable_https_listener == 1 ? 1 : 0 }"
  source                           = "./target_group"
  envname                          = "${var.envname}"
  service                          = "${var.service}"
  target_name                      = "${var.envname}-${var.service}-http-tg"
  vpc_id                           = "${var.vpc_id}"
  target_port                      = "${var.target_port}"
  health_check_port                = "${var.target_health_check_port}"
  health_check_interval            = "${var.health_check_interval}"
  health_check_healthy_threshold   = "${var.health_check_healthy_threshold}"
  health_check_unhealthy_threshold = "${var.health_check_unhealthy_threshold}"
  stickiness                       = "${var.http_stickiness}"
  stickiness_type                  = "${var.http_stickiness_type}"
  stickiness_cookie_duration       = "${var.http_stickiness_cookie_duration}"
  deregistration_delay             = "${var.deregistration_delay}"
}

module "http_listener" {
  is_enabled        = "${var.enable_http_listener}"
  source            = "./listener"
  load_balancer_arn = "${aws_lb.nlb.arn}"
  target_group_arn  = "${module.http_target_group.nlb_target_group_arn}"
  listener_port            = "80"
}

module "https_listener" {
  is_enabled               = "${var.enable_https_listener}"
  source                   = "./listener"
  listener_port            = "443"
  load_balancer_arn        = "${aws_lb.nlb.arn}"
  target_group_arn         = "${module.http_target_group.nlb_target_group_arn}"
}
