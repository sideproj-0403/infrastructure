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

#TODO
#devops 팀 다시 만들기 (내가 맴버로 안 들어감)
#push restriction -> 아마 locals로 쓴 유저를 data로 바꿔야할듯...
##PR Template 적용
#팀원 초대