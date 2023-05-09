resource "aws_eks_cluster" "devsecops {
  name     = "devsecops-cluster"
  role_arn = aws_iam_role.devsecops-cluster.arn

  vpc_config {
    subnet_ids = [module.vpc.public_subnets[0], module.vpc.public_subnets[1], module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  }
   depends_on = [
    "aws_iam_role_policy_attachment.AmazonEKSClusterPolicy"
  ]
}

resource "aws_iam_role" "devsecops-cluster" {
  name = "eks-cluster-role"

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
  role = aws_iam_role.devsecops-cluster.name
}