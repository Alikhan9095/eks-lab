# EKS Clusterraform
# Creates the Kubernetes control plane 

resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn

  version = "1.36"

  vpc_config {
    subnet_ids = concat(
      aws_subnet.public[*].id,
      aws_subnet.private[*].id
    )
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  tags = {
    Name       = var.cluster_name
    Enviroment = "dev"
    ManagedBy  = "Terraform"
  }
  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]
}

# Amazon VPC CNI Add-on 
# Provider Pod networking for kubernetes 

resource "aws_eks_addon" "vpc_cni" {
  cluster_name                = aws_eks_cluster.eks.name
  addon_name                  = "vpc-cni"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "PRESERVE"

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]
}

# CoreDNS Add-onaction
# Provider DNS resolution inside kubernetes 

resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "coredns"

  depends_on = [
    aws_eks_node_group.eks_node
  ]
}

# kube-proxy Add-on 
# Manages kubernetes Service networking 

resource "aws_eks_addon" "kube_proxy" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "kube-proxy"
}

# EKS Pod Identity Agent 
# Enable IAM roles for Kubernetes worklouds 

resource "aws_eks_addon" "pod_identity_agent" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "eks-pod-identity-agent"
}

