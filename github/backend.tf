terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "sideproject-0403"

    workspaces {
      name = "github"
    }
  }
}