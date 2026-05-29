output "instance_id" {
  description = "ID de la instancia EC2 desplegada"
  value       = aws_instance.mi_ec2.id
}

output "instance_ip" {
  description = "Dirección IP pública asignada a la instancia EC2"
  value       = aws_instance.mi_ec2.public_ip
}