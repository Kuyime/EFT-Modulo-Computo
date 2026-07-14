# Módulo de Infraestructura de Cómputo (EC2) - AWS

Este repositorio contiene un módulo de Terraform seguro y parametrizado para desplegar instancias de cómputo (EC2) en Amazon Web Services (AWS). Es parte integral de la Evaluación Final Transversal de la asignatura Infraestructura como Código II.

## Objetivos y Alcance
Este módulo automatiza el despliegue de servidores virtuales aplicando directamente los estándares de seguridad de la industria. Su diseño permite la inyección dinámica de dependencias (como Subredes y Security Groups) desde módulos externos de red.

**Características de Seguridad y Optimización:**
* Asignación dinámica de un IAM Instance Profile (LabRole) mediante la generación de sufijos aleatorios para evitar colisiones.
* Monitoreo detallado activado (`monitoring = true`).
* Optimización para Amazon EBS (`ebs_optimized = true`).
* Cifrado forzado del volumen raíz (`encrypted = true`).
* Protección contra vulnerabilidades SSRF al exigir el uso de IMDSv2 (`http_tokens = "required"`).

## Parámetros Configurables (Variables)

| Nombre | Descripción | Tipo | Por Defecto | Obligatorio |
|--------|-------------|------|-------------|-------------|
| `ami_id` | ID de la AMI para la instancia EC2 | `string` | `"ami-0ec10929233384c7f"` | No |
| `instance_type` | Tipo de instancia EC2 | `string` | `"t2.micro"` | No |
| `subnet_id` | ID de la subred donde se desplegará la instancia | `string` | N/A | **Sí** |
| `security_group_id` | ID del grupo de seguridad para la instancia | `string` | N/A | **Sí** |
| `instance_name` | Nombre para la etiqueta Name de la instancia | `string` | `"AUY1105-duocapp-ec2"` | No |

## Valores de Salida (Outputs)

| Nombre | Descripción |
|--------|-------------|
| `instance_id` | Identificador único de la instancia EC2 desplegada. |
| `instance_ip` | Dirección IP pública asignada a la instancia para acceso. |

## Instrucciones de Uso

Para implementar este módulo, debes llamarlo desde tu orquestador principal y pasarle los identificadores de red previamente creados. Asegúrate de apuntar a la versión correcta en la URL:

```hcl
module "computo" {
  source = "git::[https://github.com/Kuyime/EFT-Modulo-Computo.git?ref=v1.0.0](https://github.com/Kuyime/EFT-Modulo-Computo.git?ref=v1.0.0)"

  # Variables Obligatorias (Dependencias de red)
  subnet_id         = module.redes.public_subnet_1_id
  security_group_id = module.redes.id_sg_ssh

  # Variables Opcionales (Ejemplo de sobrescritura)
  instance_type = "t2.micro"
  instance_name = "AUY1105-MiApp-Produccion"
}