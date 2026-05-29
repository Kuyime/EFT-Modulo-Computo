# Changelog

Todas las modificaciones notables de este proyecto serán documentadas en este archivo de acuerdo con el estándar de Versionado Semántico (SemVer).

## [0.1.0] - 2026-05-28
### Added
- Estructura base del módulo de cómputo de forma desacoplada (main.tf, variables.tf, outputs.tf, versions.tf).
- Recurso de instancia EC2 parametrizado (AMI, tipo de instancia, subred y grupo de seguridad).
- Generación dinámica del Perfil de Instancia IAM vinculado a LabRole de AWS Academy.
- Configuración de almacenamiento encriptado (EBS) y forzado de tokens HTTP en metadatos.
- Salidas (outputs) obligatorias para `instance_id` e `instance_ip`.