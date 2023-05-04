terraform {
  required_version = "~> 1.0"

  required_providers {
    github = {
      #      source  = "integrations/github"
      source  = "hashicorp/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {
  token = var.github_token
  owner = "leeleelee3264"
}