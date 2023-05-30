resource "aws_route53_record" "NextGenDS" {
  zone_id = "Z03309881PN2JZ6GGLOJ8"
  name    = "NextGenDS.axle-interns.com"
  type    = "A"

  alias {
    name                   = "a5e4e91e7edb645da9c9e56969ba1572-1354975883.us-east-1.elb.amazonaws.com"
    zone_id                = "Z35SXDOTRQ7X7K"
    evaluate_target_health = true
  }

}

resource "aws_route53_record" "kibana" {
  zone_id = "Z03309881PN2JZ6GGLOJ8"
  name    = "Kibana.axle-interns.com"
  type    = "A"

  alias {
    name                   = "Kibana-ALB-613920680.us-east-1.elb.amazonaws.com"
    zone_id                = "Z35SXDOTRQ7X7K"
    evaluate_target_health = true
  }

}
