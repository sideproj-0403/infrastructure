locals {

  admin_machine_users = [
    "leelee-technical"
  ]

  devops_users = [
    "leeleelee3264"
  ]

  backend_users = [
    "leeleelee3264"
  ]

  frontend_users = [
  ]

  admins = concat(
    local.admin_machine_users,
    local.devops_users
  )

  members = concat(
    local.backend_users,
    local.frontend_users
  )

}