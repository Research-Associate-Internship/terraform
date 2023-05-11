resource "aws_route53_record" "vault" {
  zone_id = "Z03309881PN2JZ6GGLOJ8"
  name    = "vault-aws"
  type    = "A"

  alias {
    name                   = aws_lb.vault.arn
    zone_id                = "Z35SXDOTRQ7X7K"
    evaluate_target_health = true
  }

}