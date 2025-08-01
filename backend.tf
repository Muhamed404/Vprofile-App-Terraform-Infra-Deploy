terraform {
  backend "s3" {
    bucket = "vprofile-cicd-selenium-01"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}
