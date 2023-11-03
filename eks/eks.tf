resource "aws_eks_cluster" "NextGenDS-rac3" {
  name     = "NextGenDS-rac3-cluster"
  role_arn = aws_iam_role.NextGenDS.arn
  version = "1.28"
  vpc_config {
    //subnet_ids = [module.vpc.public_subnets[0], module.vpc.public_subnets[1], module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
    subnet_ids = ["subnet-087b37379578cd037","subnet-0aa9f30d1300a6a64"]
  }

  enabled_cluster_log_types = ["api", "audit"]

  depends_on = [
    "aws_iam_role_policy_attachment.AmazonEKSClusterPolicy"
  ]


  tags = {
    Department = "DevSecOps Associate"
    project    = "interns"
    Creation   = "terraform"
  }
}

resource "aws_iam_role" "NextGenDS" {
  name = "eks-cluster-role2"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.NextGenDS.name
}

# resource "aws_cloudwatch_log_group" "NextGenDS" {
#   # Reference: https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html
#   name              = "/aws/eks/NextGenDS-cluster/cluster"
#   retention_in_days = "7"

# }
