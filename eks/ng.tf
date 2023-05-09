resource "aws_eks_node_group" "nextgen-node-group" {
  cluster_name    = aws_eks_cluster.devsecops.name
  node_group_name = "nextgen-worker-group"
  node_role_arn   = aws_iam_role.nextgen-role.arn
  subnet_ids      = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  remote_access {
    ec2_ssh_key               = "bastion"
    //source_security_group_ids = [aws_security_group.something.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.nextgen-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.nextgen-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.nextgen-AmazonEC2ContainerRegistryReadOnly,
  ]

  ami_type       = "AL2_x86_64"
  instance_types = ["t3.medium"]

}

resource "aws_iam_role" "nextgen-role" {
  name = "nodegroup-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "nextgen-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nextgen-role.name
}

resource "aws_iam_role_policy_attachment" "nextgen-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nextgen-role.name
}

resource "aws_iam_role_policy_attachment" "nextgen-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nextgen-role.name
}