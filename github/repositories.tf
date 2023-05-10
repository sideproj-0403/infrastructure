locals {

  k8s-manifest = format("%s-%s", var.github_org, "k8s-manifest")

  api          = format("%s-%s", var.github_org, "api")
  api-docs     = format("%s-%s", var.github_org, "api-docs")

  android-app  = format("%s-%s", var.github_org, "android-app")

  devops_repo = [
    local.k8s-manifest
  ]

  backend_repo = [
    local.api,
    local.api-docs
  ]

  frontend_repo = [
    local.android-app
  ]

  all_repositories = concat(
    local.devops_repo,
    local.backend_repo,
    local.frontend_repo
  )

  prod_repositories = [
    local.api,
    local.android-app
  ]

}

# Create new repository from template
resource "github_repository" "respositories" {
  count              = length(local.all_repositories)

  name               = local.all_repositories[count.index]
  description        = "Repository generated by Terraform"
  visibility         = "public"
  auto_init          = true
}

# Branch Protection Rules
resource "github_branch_protection" "branch_protection" {
  count               = length(github_repository.respositories)

  repository_id       = github_repository.respositories[count.index].id
  pattern             = "master"
  enforce_admins      = true

  required_pull_request_reviews {
    required_approving_review_count = 1
    dismiss_stale_reviews           = true
  }

  push_restrictions = [
    github_team.admin.node_id,
    github_team.devops.node_id,
    github_team.backend.node_id,
    github_team.frontend.node_id
  ]
}

resource "github_branch" "prod_backend_repo" {
  count           = length(local.prod_repositories)

  repository      = local.prod_repositories[count.index]
  branch          = "prod"
  source_branch   = "master"
}
