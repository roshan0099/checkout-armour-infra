terraform {
  backend "gcs" {
    bucket = "checkout-tf"
    prefix = "envs/prod"
  }
}