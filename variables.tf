variable "ami_id" {
  description = "ID de la AMI para la instancia EC2"
  type        = string
  default     = "ami-0ec10929233384c7f"
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "ID de la subred (pública) donde se desplegará la instancia"
  type        = string
}

variable "security_group_id" {
  description = "ID del grupo de seguridad para la instancia"
  type        = string
}

variable "instance_name" {
  description = "Nombre para la etiqueta Name de la instancia"
  type        = string
  default     = "AUY1105-duocapp-ec2"
}