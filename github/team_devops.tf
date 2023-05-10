# Create a backend team
resource "github_team" "devops" {
  name        = "devops"
  description = "devops GitHub Team"
  privacy     = "closed"
}

# Add frontend team as organization member
resource "github_membership" "devops" {
  for_each = toset(local.devops_users)

  username = each.value
  role     = "member"
}

# Add frontend to github team
resource "github_team_members" "devops" {
  for_each = toset(local.frontend_users)

  team_id = github_team.devops.id

  members {
    username = each.value
    role     = "member"
  }
}

resource "github_team_repository" "devops" {
  for_each = toset(local.devops_repo)

  team_id    = github_team.devops.id
  repository = each.value
  permission = "push"

  depends_on = [
    github_repository.respositories
  ]
}
