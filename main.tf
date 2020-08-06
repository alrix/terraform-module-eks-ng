# Determine who's running the show
data "aws_caller_identity" "current" {
}

# Determine the region
data "aws_region" "region" {
}

# Determine availability zone
data "aws_availability_zone" "eks-node-group" {
  name = "${data.aws_region.region.name}${var.availability_zone}"
}

# Determine subnets for main asg
data "aws_subnet" "eks-node-group" {
  vpc_id = var.vpc_id
  availability_zone_id = data.aws_availability_zone.eks-node-group.zone_id
  filter {
    name   = "tag:role"
    values = [ var.subnet_identifier ]  
  }
}

output "subnets" { value = data.aws_subnet.eks-node-group.id }
