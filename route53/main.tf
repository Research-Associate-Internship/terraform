data "aws_route53_zone" "selected" {
  name         = "axle-interns.com"
  private_zone = false
}

resource "aws_route53_record" "NextGenDS-RAC2" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.ngds_name
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}