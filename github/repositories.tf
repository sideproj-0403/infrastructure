locals {

  devops_repo = [
    "sideproject-0403-k8s-manifest",
  ]

  backend_repo = [
    "sideproject-0403-api",
    "sideproject-0403-api-docs"
  ]

  frontend_repo = [
    "sideproject-0403-android-app"
  ]

  all_repositories = concat(
    local.devops_repo,
    local.backend_repo,
    local.frontend_repo
  )
}

# Create new repository from template
resource "github_repository" "respositories" {
  count              = length(local.all_repositories)

  name               = local.all_repositories[count.index]
  description        = "Repository generated by Terraform"
  visibility         = "public"
  auto_init          = true
}

resource "github_repository_autolink_reference" "autolink" {
  count               = length(github_repository.respositories)

  repository          = github_repository.respositories[count.index].name
  key_prefix          = "TN-"
  target_url_template = "https://sideproject-0403.atlassian.net/browse/TN-<num>"
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
}

resource "github_branch" "prod_backend_repo" {
  repository      = local.backend_repo[0] # sideproject-0403-api
  branch          = "prod"
  source_branch   = "master"
}

resource "github_branch" "prod_frontend_repo" {
  repository      = local.frontend_repo[0] # sideproject-0403-android-app
  branch          = "prod"
  source_branch   = "master"
}