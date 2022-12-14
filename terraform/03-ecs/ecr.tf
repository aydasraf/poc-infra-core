resource "aws_ecr_repository" "main" {
  count                = terraform.workspace == "dev" ? length(local.repo_names) : 0
  name                 = "${local.repo_names[count.index].team}/${local.repo_names[count.index].name}"
  image_tag_mutability = "MUTABLE"

  tags = merge(
    {
      Name = "${local.prefix}-ecs-cluster"
    },
    local.tags
  )
}

resource "aws_ecr_lifecycle_policy" "main" {
  count = terraform.workspace == "dev" ? length(local.repo_names) : 0

  repository = aws_ecr_repository.main[count.index].name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "keep last 10 images"
      action = {
        type = "expire"
      }
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 10
      }
    }]
  })
}