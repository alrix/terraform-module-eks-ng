# Inherited
variable cluster_name {}
variable vpc_id {}
variable node_iam_role {}
variable ssh_key_name {}
variable node_group_name {}
variable availability_zone {}

# Cluster node Tuning
variable cluster_desired_capacity { default = "0" }
variable cluster_max_size { default = "1" }
variable cluster_min_size { default = "0" }

# Node Tuning
variable node_instance_types { default = ["t3.small"] }
variable node_volume_size { default = "40" }

# Kubernetes Labels
variable node_labels { default = { "node_type" = "default", "env" = "dev" } }

variable "subnet_identifier" {
  description = "value of Tag:role to identify which subnets to deploy into"
  default = "eks"
}
