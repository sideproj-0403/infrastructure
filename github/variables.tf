variable "github_token" {
description = "GitHub Personal Access Token that is configured on the Terraform Workspace"
}

variable "github_org" {
    type = string
    default ="sideproject-0403"
    description = "GitHub Organisation Name"
}