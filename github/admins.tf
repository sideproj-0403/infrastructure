# Someone Elses Organisation Admins
locals {

  admins = [
    "leeleelee3264",
    "leelee-technical"
  ]

}

# Add codeowners team as orgnisation member
resource "github_membership" "admins" {
  for_each = toset(local.admins)

  username = each.key
  role     = "admin"
}

data "github_repository" "manage_github" {
  full_name = "sideproject-0403/infrastructure"
}

# Set permissions to manage-github for contributors github team
resource "github_team_repository" "manage_github_contributors" {
  team_id    = github_team.contributors.id
  repository = data.github_repository.manage_github.name
  permission = "push"
}

# Set permissions to manage-github for codeowners github team
resource "github_team_repository" "manage_github_codeowners" {
  team_id    = github_team.codeowners.id
  repository = data.github_repository.manage_github.name
  permission = "push"
}