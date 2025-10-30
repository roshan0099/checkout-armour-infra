resource "google_project_service" "artifact" {
  project = var.project
  service = "artifactregistry.googleapis.com"


}

resource "google_artifact_registry_repository" "docker_repo" {
  project  = var.project
  location = var.region
  repository_id = "my-repo"
  format   = "docker"
  description = "My Docker repository"
}
