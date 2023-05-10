# Create a backend team
resource "github_team" "admin" {
  name        = "frontend"
  description = "frontend GitHub Team"
  privacy     = "closed"
}

# Add codeowners team as orgnisation member
resource "github_membership" "admin" {
  for_each = toset(local.admins)

  username = each.key
  role     = "admin"
}

data "github_repository" "manage_github" {
  full_name = var.manage_github
}

# Add frontend to github team
resource "github_team_members" "admin" {
  for_each = toset(local.admins)

  team_id = github_team.admin.id

  members {
    username = each.value
    role     = "maintainer"
  }

}

resource "github_team_repository" "admin" {
  team_id    = github_team.admin.id
  repository = data.github_repository.manage_github.name
  permission = "admin"

  depends_on = [
    github_repository.respositories
  ]
}
