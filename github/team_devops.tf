# Create a backend team
resource "github_team" "devops" {
  name        = "devops"
  description = "devops GitHub Team"
  privacy     = "closed"
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