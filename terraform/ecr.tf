resource  "aws_ecr_repository" "app" {
   name         = "${var.project}-app"
   force_delete = true
}
