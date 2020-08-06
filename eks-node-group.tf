resource "aws_eks_node_group" "node-group" {
  lifecycle {
    ignore_changes = [scaling_config.0.desired_size]
  }
  cluster_name    = "tf-${var.cluster_name}"
  node_group_name = format("tf-%v_EKS-nodegroup_%v_%v", var.cluster_name, var.node_group_name, var.availability_zone)

  subnet_ids      = flatten([data.aws_subnet.eks-node-group.id])

  labels = var.node_labels

  node_role_arn   = var.node_iam_role
  disk_size = var.node_volume_size
  instance_types = var.node_instance_types

  remote_access {
    ec2_ssh_key = var.ssh_key_name
  }

  scaling_config {
    desired_size = var.cluster_desired_capacity
    max_size     = var.cluster_max_size
    min_size     = max(var.cluster_min_size,1)
  }

}


