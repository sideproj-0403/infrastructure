locals {

  # A map of admin machine users. These users are used for tasks such like CI & CD, releasing, etc.
  admin_machine_users = {
    "absinthe4902+technical@gmail.com" = "leelee-technical"
  }

  admin_users = {
    "absinthe4902@naver.com"  = "leeleelee3264"
  }

  devops_users = {
    "absinthe4902@naver.com"  = "leeleelee3264"
  }

  backend_users = {
    "absinthe4902@naver.com"  = "leeleelee3264"
    "djadbwjd1004@naver.com"  = "ujeongeom"
  }

  frontend_users = {
    "xxunghee@gmail.com"  = "xxunghee"
  }

  # We merge the maps of members and admins and pass them as arguments to the module
  admins = merge(
    local.admin_machine_users,
    local.admin_users,
    local.devops_users
  )

  members = merge(
    local.backend_users,
    local.frontend_users
  )
}