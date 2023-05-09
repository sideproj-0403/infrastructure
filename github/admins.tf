# Add codeowners team as orgnisation member
resource "github_membership" "admins" {
  for_each = toset(local.admins)

  username = each.key
  role     = "admin"
}

data "github_repository" "manage_github" {
  full_name = var.manage_github
}

# Set permissions to manage-github for devops github team
resource "github_team_repository" "manage_github_devops" {
  team_id    = github_team.devops.id
  repository = data.github_repository.manage_github.name
  permission = "admin"
}