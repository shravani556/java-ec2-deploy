provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "app_sg" {
  name = "ec2_sg_${var.environment}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "master" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  user_data              = file("${path.module}/scripts/deploy-java.sh")

  tags = {
    Name = "master-${var.environment}"
  }
}

resource "aws_instance" "slave" {
  count                  = 2
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  user_data              = file("${path.module}/scripts/deploy-java.sh")

  tags = {
    Name = "slave-${count.index + 1}-${var.environment}"
  }
}