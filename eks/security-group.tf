resource "aws_security_group_rule" "https_ingress" {
  security_group_id = "sg-077456172e29d3d01"

  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]  # Adjust as needed for your specific requirements
}


resource "aws_security_group_rule" "https_ingress-result" {
  security_group_id = "sg-088befe3d121b6bf0"

  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]  # Adjust as needed for your specific requirements
}

resource "aws_security_group_rule" "https_ingress-kibana" {
  security_group_id = "sg-0750dc02e225c822d"

  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]  # Adjust as needed for your specific requirements
}