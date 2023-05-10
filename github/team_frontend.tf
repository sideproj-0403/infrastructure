# Create a backend team
resource "github_team" "frontend" {
  name        = "frontend"
  description = "frontend GitHub Team"
  privacy     = "closed"
}

# Add frontend team as organization member
resource "github_membership" "frontend" {
  for_each = toset(local.frontend_users)

  username = each.value
  role     = "member"
}

# Add frontend to github team
resource "github_team_members" "frontend" {
  for_each = toset(local.frontend_users)

  team_id = github_team.frontend.id

  members {
    username = each.value
    role     = "member"
  }

}

#resource "github_team_repository" "frontend" {
#  for_each = toset(local.frontend_repo)
#
#  team_id    = github_team.frontend.id
#  repository = each.value
#  permission = "push"
#
#  depends_on = [
#    github_repository.respositories
#  ]
#}