module "ec2-infra" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  environment   = var.environment
  aws_region    = var.aws_region
  key_name      = var.key_name
  allowed_ip    = var.allowed_ip
}