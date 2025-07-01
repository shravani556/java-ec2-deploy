terraform {
  backend "s3" {
    bucket = "java-bucket7013"
    key    = "envs/qa/terraform.tfstate"
    region = "us-east-1"
  }
}
