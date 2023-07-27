resource "aws_route53_record" "NextGenDS-RAC2" {
  zone_id = var.zone_id
  name    = var.ngds_name
  type    = "A"

  alias {
    name                   = var.ngds_alb_name
    zone_id                = "Z35SXDOTRQ7X7K"
    evaluate_target_health = true
  }
}