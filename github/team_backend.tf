# Create a backend team
resource "github_team" "backend" {
  name        = "backend"
  description = "backend GitHub Team"
  privacy     = "closed"
}

# Add backend team as organization member
resource "github_membership" "backend" {
  for_each = toset(local.backend_users)

  username = each.value
  role     = "member"
}

# Add backend to github team
resource "github_team_members" "backend" {
  for_each = toset(local.backend_users)

  team_id = github_team.backend.id

  members {
    username = each.value
    role     = "member"
  }

}

# Set permissions to respositories for contributors github team
resource "github_team_repository" "contributors" {
  for_each = toset(local.respositories)

  team_id    = github_team.contributors.id
  repository = each.value
  permission = "push"

  depends_on = [
    github_repository.respositories
  ]

}