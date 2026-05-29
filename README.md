# Módulo de Terraform para Cómputo AWS (EC2)

Repositorio destinado al desarrollo del Módulo de Cómputo para la Evaluación Parcial N° 2 de la asignatura **AUY1105 - Infraestructura como Código II**.

## Objetivos del Repositorio
El propósito principal de este repositorio es proporcionar un módulo desacoplado y reutilizable para el despliegue seguro y estandarizado de instancias de cómputo (EC2) en Amazon Web Services (AWS), preparado para integrarse de forma fluida con módulos de red externos.

## Propósito General del Código
Este módulo automatiza el aprovisionamiento de capacidad de cómputo aplicando buenas prácticas de seguridad. Despliega:
- Una instancia EC2 parametrizada (AMI, Tamaño, Red).
- Un Perfil de Instancia IAM (Instance Profile) generado dinámicamente y asociado al `LabRole`.
- Almacenamiento raíz (EBS) encriptado por defecto.
- Configuración de metadatos de instancia exigiendo el uso de tokens (IMDSv2).

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

## Instrucciones Básicas de Uso
Este módulo depende de recursos de red previamente creados. Puede ser invocado de la siguiente manera:

```hcl
module "computo" {
  source            = "[github.com/TU_USUARIO/terraform-aws-ec2-AUY1105-grupo-3](https://github.com/TU_USUARIO/terraform-aws-ec2-AUY1105-grupo-3)"
  subnet_id         = module.redes.public_subnet_1_id
  security_group_id = module.redes.security_group_ssh_id
}