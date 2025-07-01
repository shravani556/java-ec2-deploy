terraform {
  backend "s3" {
    bucket = "java-bucket7013"
    key    = "envs/${var.environment}/terraform.tfstate"
    region = "us-east-1"
  }
}