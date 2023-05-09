# Create a backend team
resource "github_team" "devops" {
  name        = "devops"
  description = "devops GitHub Team"
  privacy     = "closed"
}

# Add devops to github team
resource "github_team_members" "devops" {
  for_each = toset(local.devops_users)

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
  permission = "admin"

  depends_on = [
    github_repository.respositories
  ]
}