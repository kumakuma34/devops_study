resource "aws_eks_node_group" "test-eks-nodegroup" {
  cluster_name    = aws_eks_cluster.test-eks-cluster.name
  node_group_name = "skt-user13-test-eks-nodegroup"
  node_role_arn   = aws_iam_role.test-iam-role-eks-nodegroup.arn
  subnet_ids      = [aws_subnet.test-public-subnet1.id, aws_subnet.test-public-subnet3.id]
  instance_types = ["t3a.medium"]
  disk_size = 20

  labels = {
    "role" = "eks-nodegroup"
  }

  scaling_config {
    desired_size = 3
    min_size     = 3
    max_size     = 3
  }

  depends_on = [
    aws_iam_role_policy_attachment.test-iam-policy-eks-nodegroup,
    aws_iam_role_policy_attachment.test-iam-policy-eks-nodegroup-cni,
    aws_iam_role_policy_attachment.test-iam-policy-eks-nodegroup-ecr,
  ]

}
