resource "aws_ecr_repository" "app" {
  name = "first-node-app"

  image_scanning_configuration {
    scan_on_push = true
  }
}