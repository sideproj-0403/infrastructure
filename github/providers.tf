# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.13.0"
    }
  }
}

provider "github" {
  token = var.github_token
  owner = var.github_org
}

