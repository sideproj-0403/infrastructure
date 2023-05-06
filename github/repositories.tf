module "repository-sideproject-0403-api" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.10.0"

  name                   = "sideproject-0403-api"
  allow_rebase_merge     = true
  allow_squash_merge     = true
  delete_branch_on_merge = true
  has_issues = true
  branch_protections_v3 = [
    {
      branch                 = "master"
      enforce_admins         = true
      require_signed_commits = false
#      required_status_checks = {
#        contexts = [
#        "continuous-integration/drone/push"
#        ]
#        include_admins = false
#        strict = false
#      }

      required_pull_request_reviews = {
        dismiss_stale_reviews           = false
        restrict_dismissals             = true
        dismissal_teams                 = [module.team_backend.name]
        require_code_owner_reviews      = false
        required_approving_review_count = 1
      }

      restrictions = {
        teams = [module.team_backend.name]
      }
    },
  ]
}

module "repository-sideproject-0403-api-docs" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.10.0"

  name                   = "sideproject-0403-api-docs"
  allow_rebase_merge     = true
  allow_squash_merge     = true
  delete_branch_on_merge = true
}

module "repository-sideproject-0403-android-app" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.10.0"

  name                   = "sideproject-0403-android-app"
  allow_rebase_merge     = true
  allow_squash_merge     = true
  delete_branch_on_merge = true
  has_issues = true
  branch_protections_v3 = [
    {
      branch                 = "master"
      enforce_admins         = true
      require_signed_commits = false
#      required_status_checks = {
#        contexts = [
#        "continuous-integration/drone/push"
#        ]
#        include_admins = false
#        strict = false
#      }

      required_pull_request_reviews = {
        dismiss_stale_reviews           = false
        restrict_dismissals             = true
        dismissal_teams                 = [module.team_frontend.name]
        require_code_owner_reviews      = false
        required_approving_review_count = 1
      }

      restrictions = {
        teams = [module.team_frontend.name]
      }
    },
  ]
}

module "repository-sideproject-0403-k8s-manifests" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.10.0"

  name                   = "sideproject-0403-k8s-manifests"
  allow_rebase_merge     = true
  allow_squash_merge     = true
  delete_branch_on_merge = true
  has_downloads          = true
  has_issues             = true
}

module "repository-infrastructure" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.10.0"

  name                   = "infrastructure"
  allow_rebase_merge     = true
  allow_squash_merge     = true
  delete_branch_on_merge = true
  has_downloads          = true
  has_issues             = true
}