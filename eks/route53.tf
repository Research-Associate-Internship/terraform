resource "aws_route53_record" "NextGenDS" {
  zone_id = "Z03309881PN2JZ6GGLOJ8"
  name    = "NextGenDS.axle-interns.com"
  type    = "A"

  alias {
    name                   = "k8s-node-ALB-476907778.us-east-1.elb.amazonaws.com"
    zone_id                = "Z35SXDOTRQ7X7K"
    evaluate_target_health = true
  }

}