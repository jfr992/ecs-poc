resource "aws_ecr_repository" "api_ecr" {
  name                 = "reorg-ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}