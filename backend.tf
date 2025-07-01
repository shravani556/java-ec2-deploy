terraform {
  backend "s3" {
    bucket = "your-s3-bucket-name"
    key    = "envs/${var.environment}/terraform.tfstate"
    region = "us-east-1"
  }
}