output "alb_url" {
  value = "http://${aws_lb.main.dns_name}"
}

output "ecr_url" {
  value = aws_ecr_repository.app.repository_url
}

output "ecs_cluster" {
  value = aws_ecs_cluster.main.name
}
