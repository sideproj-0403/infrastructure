locals {
  share_repository = [
    module.repository-sideproject-0403-k8s-manifests.repository.name,
    module.repository-infrastructure.repository.name
  ]

  devops_repository = [
    module.repository-sideproject-0403-k8s-manifests.repository.name,
    module.repository-infrastructure.repository.name
  ]

  backend_repository = [
    module.repository-sideproject-0403-api.repository.name,
    module.repository-sideproject-0403-api-docs.repository.name
  ]

  frontend_repository = [
    module.repository-sideproject-0403-android-app.repository.name
  ]
}