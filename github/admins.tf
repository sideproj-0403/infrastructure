# Add codeowners team as orgnisation member
resource "github_membership" "admins" {
  for_each = toset(local.admins)

  username = each.key
  role     = "admin"
}

data "github_repository" "manage_github" {
  full_name = var.manage_github
}

resource "github_team_repository" "admins" {
  for_each = toset(local.devops_repo)

  team_id    = github_team.devops.id
  repository = each.value
  permission = "admin"

  depends_on = [
    github_repository.respositories
  ]
}

# Set permissions to manage-github for devops github team
resource "github_team_repository" "manage_github_devops" {
  team_id    = github_team.devops.id
  repository = data.github_repository.manage_github.name
  permission = "admin"
}