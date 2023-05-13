resource "aws_eks_cluster" "eks-cluster" {
  name     = "eks-cluster"
  role_arn = aws_iam_role.eksClusterRole.arn

  vpc_config {
    subnet_ids = [module.network.priv_sub_1_id, module.network.priv_sub_2_id, module.network.priv_sub_3_id]
  }
  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy,
  ]

}

output "endpoint" {
  value = aws_eks_cluster.eks-cluster.endpoint
}

# output "kubeconfig-certificate-authority-data" {
#   value = aws_eks_cluster.example.certificate_authority[0].data
# }


resource "aws_eks_node_group" "node-group" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "EKS-node-group"
  node_role_arn   = aws_iam_role.node-role.arn
  subnet_ids      = [module.network.priv_sub_1_id, module.network.priv_sub_2_id, module.network.priv_sub_3_id]

  scaling_config {
    desired_size = 3
    max_size     = 3
    min_size     = 3
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
  ]
}

