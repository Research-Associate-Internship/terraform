resource "aws_eks_node_group" "NextGenDS-node-group" {
  cluster_name    = aws_eks_cluster.NextGenDS.name
  node_group_name = "NextGenDS-node-group"
  node_role_arn   = aws_iam_role.NextGenDS-role.arn
  subnet_ids      = [module.vpc.private_subnets[0]] //, module.vpc.private_subnets[1]]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  remote_access {
    ec2_ssh_key               = "bastion"
    source_security_group_ids = [aws_security_group.bastion-sg.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.NextGenDS-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.NextGenDS-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.NextGenDS-AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.NextGenDS-CloudWatchLogsFullAccess,
  ]

  ami_type       = "AL2_x86_64"
  instance_types = ["c4.2xlarge"]
  #disk_size = "50"
  tags = {
    Department = "DevSecOps Associate"
    project    = "interns"
    Creation   = "terraform"
  }

}

resource "aws_iam_role" "NextGenDS-role" {
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

resource "aws_iam_role_policy_attachment" "NextGenDS-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.NextGenDS-role.name
}

resource "aws_iam_role_policy_attachment" "NextGenDS-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.NextGenDS-role.name
}

resource "aws_iam_role_policy_attachment" "NextGenDS-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.NextGenDS-role.name
}

resource "aws_iam_role_policy_attachment" "NextGenDS-CloudWatchLogsFullAccess" {
 policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
 role    = aws_iam_role.NextGenDS-role.name
}

resource "aws_eks_node_group" "NextGenDS-node-group2" {
  cluster_name    = aws_eks_cluster.NextGenDS.name
  node_group_name = "NextGenDS-node-group2"
  node_role_arn   = aws_iam_role.NextGenDS-role.arn
  subnet_ids      = [module.vpc.private_subnets[0]] //, module.vpc.private_subnets[1]]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  remote_access {
    ec2_ssh_key               = "bastion"
    source_security_group_ids = [aws_security_group.bastion-sg.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.NextGenDS-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.NextGenDS-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.NextGenDS-AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.NextGenDS-CloudWatchLogsFullAccess,
  ]

  ami_type       = "AL2_x86_64"
  instance_types = ["c4.2xlarge"]
  disk_size = "50"
  tags = {
    Department = "DevSecOps Associate"
    project    = "interns"
    Creation   = "terraform"
  }

}