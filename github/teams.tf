module "team" {
  source  = "mineiros-io/team/github"
  version = "~> 0.6.0"

  name        = "Engineering"
  description = "Engineering"
  privacy     = "closed"
}


module "team_admin" {
  source  = "mineiros-io/team/github"
  version = "~> 0.6.0"

  name    = "Admins"
  privacy = "secret"

  members = concat(values(local.admin_machine_users), values(local.admin_users))

  admin_repositories = concat(
    local.share_repository,
    local.devops_repository,
    local.backend_repository,
    local.frontend_repository
  )

  pull_repositories = []
  push_repositories = []
}


module "team_devops" {
  source  = "mineiros-io/team/github"
  version = "~> 0.6.0"

  name    = "DevOps"
  privacy = "closed"

  members = values(local.devops_users)

  admin_repositories = concat(
    local.share_repository,
    local.devops_repository,
    local.backend_repository,
    local.frontend_repository
  )

  pull_repositories = []
  push_repositories = []
}


module "team_backend" {
  source  = "mineiros-io/team/github"
  version = "~> 0.6.0"

  name    = "Backend"
  privacy = "closed"

  members = values(local.backend_users)

  push_repositories = concat(
    local.share_repository,
    local.backend_repository,
  )

  pull_repositories = concat(
    local.frontend_repository
  )
}


module "team_frontend" {
  source  = "mineiros-io/team/github"
  version = "~> 0.6.0"

  name    = "Frontend"
  privacy = "secret"

  members = values(local.frontend_users)

  push_repositories = concat(
    local.share_repository,
    local.frontend_repository,
    local.backend_repository
  )

  pull_repositories = concat(
    local.backend_repository
  )
}
