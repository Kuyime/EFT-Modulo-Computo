# Generador de sufijo aleatorio para evitar colisiones en los nombres de IAM
resource "random_string" "sufijo_ec2" {
  length  = 5
  special = false
  upper   = false
}

# 1. Configuración de IAM Profile
data "aws_iam_role" "lab_role" {
  name = "LabRole"
}

resource "aws_iam_instance_profile" "profile_ec2" {
  name = "ec2_profile_${random_string.sufijo_ec2.result}"
  role = data.aws_iam_role.lab_role.name
}

# 2. Despliegue de la Instancia EC2
resource "aws_instance" "mi_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  monitoring           = true
  ebs_optimized        = true
  iam_instance_profile = aws_iam_instance_profile.profile_ec2.name

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    encrypted = true
  }

  tags = {
    Name = var.instance_name
  }
}