resource "aws_eks_cluster" "GenDS" {
  name     = "Rac2-NextGenDS-cluster"
  role_arn = aws_iam_role.GenDS.arn
  version = "1.27"
  enabled_cluster_log_types = ["api", "audit","authenticator","scheduler"]
  vpc_config {
    subnet_ids = [var.private_subnets[0],var.private_subnets[1],var.private_subnets[2],var.private_subnets[3]]
  }
  depends_on = [
    "aws_iam_role_policy_attachment.AmazonEKSClusterPolicy"
  ]
  tags = {
    Department       = "DevOps RAC2"
    Creation         = "terraform"
    Project          = "intern"
    Envirornment     = "Production"
  }
}

resource "aws_iam_role" "GenDS" {
  name = "rac2-eks-cluster-role"
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

tags = {
    Department       = "DevOps RAC2"
    Creation         = "terraform"
    Project          = "intern"
    Envirornment     = "Production"
  }
}

resource "aws_eks_node_group" "RAC2-NextGenDS-node-group1" {
  cluster_name              = aws_eks_cluster.GenDS.name
  node_group_name           = "RAC2-NextGenDS-node-group1"
  node_role_arn             = aws_iam_role.GenDS-role.arn
  subnet_ids                = [var.private_subnets[0],var.private_subnets[1],var.private_subnets[2],var.private_subnets[3]]

  scaling_config {
    desired_size            = 1
    max_size                = 1
    min_size                = 1
  }

  remote_access {
    ec2_ssh_key               = "bastion"
    source_security_group_ids = [aws_security_group.bastion-sg.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.GenDS-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.GenDS-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.GenDS-AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.GenDS-CloudWatchLogsFullAccess,
  ]

  ami_type                     = "AL2_x86_64"
  instance_types               = ["t3.xlarge"]
  disk_size                    = "50"
  tags = {
    Department                 = "DevOps RAC2"
    Creation                   = "terraform"
    Project                    = "intern"
    Envirornment               = "Production"
  }

}

resource "aws_eks_node_group" "RAC2-NextGenDS-node-group2" {
  cluster_name                = aws_eks_cluster.GenDS.name
  node_group_name             = "RAC2-NextGenDS-node-group2"
  node_role_arn               = aws_iam_role.GenDS-role.arn
  subnet_ids                  = [var.private_subnets[0],var.private_subnets[1],var.private_subnets[2],var.private_subnets[3]]

  scaling_config {
    desired_size              = 1
    max_size                  = 1
    min_size                  = 1
  }

  remote_access {
    ec2_ssh_key               = "bastion"
    source_security_group_ids = [aws_security_group.bastion-sg.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.GenDS-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.GenDS-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.GenDS-AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.GenDS-CloudWatchLogsFullAccess,
  ]

  ami_type                    = "AL2_x86_64"
  instance_types              = ["t3.xlarge"]
  disk_size                   = "50"
  tags = {
    Department                = "DevOps RAC2"
    Creation                  = "terraform"
    Project                   = "intern"
    Envirornment              = "Production"
  }
}

resource "aws_iam_role" "GenDS-role" {
  name = "rac2-eks-nodegroup-role"
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
  tags = {
    Department       = "DevOps RAC2"
    Creation         = "terraform"
    Project          = "intern"
    Envirornment     = "Production"
  }
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn                  = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role                        = aws_iam_role.GenDS.name
}
resource "aws_iam_role_policy_attachment" "GenDS-AmazonEKS_CNI_Policy" {
  policy_arn                  = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role                        = aws_iam_role.GenDS-role.name
}

resource "aws_iam_role_policy_attachment" "GenDS-AmazonEKSWorkerNodePolicy" {
  policy_arn                  = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role                        = aws_iam_role.GenDS-role.name
}

resource "aws_iam_role_policy_attachment" "GenDS-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn                 = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role                       = aws_iam_role.GenDS-role.name
}

resource "aws_iam_role_policy_attachment" "GenDS-CloudWatchLogsFullAccess" {
 policy_arn                  = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
 role                        = aws_iam_role.GenDS-role.name
}

resource "aws_security_group" "bastion-sg" {
  name                      = "eks-bastion-sg"
  vpc_id                    = var.Vpc_id

  ingress {
    from_port               = 22
    to_port                 = 22
    protocol                = "tcp"
  }

  egress {
    from_port               = 0
    to_port                 = 0
    protocol                = "-1"
    cidr_blocks             = ["0.0.0.0/0"]
  }

  tags = {
    Department              = "DevOps RAC2"
    Creation                = "terraform"
    Project                 = "intern"
    Envirornment            = "Production"
  }
}