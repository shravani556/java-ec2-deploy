variable "ami_id" {}
variable "instance_type" {
  default = "t2.micro"
}
variable "environment" {}
variable "aws_region" {
  default = "us-east-1"
}
variable "key_name" {}
variable "allowed_ip" {
  default = "0.0.0.0/0"
}