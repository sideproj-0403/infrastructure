resource "github_repository" "repo_template" {
  name = "repo-template"
  description = "This is a repo template for new repositories"

  visibility = "private"
  is_template = true
  auto_init = true
}

resource "github_branch_default" "repo_template" {
  branch     = "master"
  repository = github_repository.repo_template.name
}

resource "github_repository_file" "repo_template_pr" {
  content    = file("template/.github/pull_request_template.md")
  file       = ".github/pull_request_template.md"
  repository = github_repository.repo_template.name
  branch = "master"
  commit_message = "Managed by Terraform"
  commit_author = "Terraform"
  overwrite_on_create = true
}