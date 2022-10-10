output "region" {
  value = var.region
}

output "cluster_name" {
  value = aws_eks_cluster.this.name
}
output "k8s_version" {
  value = aws_eks_cluster.this.version
}

output "cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "cluster_ca_certificate" {
  value = aws_eks_cluster.this.certificate_authority[0].data
}
