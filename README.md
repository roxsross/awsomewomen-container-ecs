
# Despliegue usando AWS Copilot

Copilot es una herramienta para crear e implementar servicios en contenedores sin manejar todos los problemas de configuración de ECS, EC2 y Fargate.

si usa Copilot, puede pasar de la idea a la implementación mucho más rápido, con la confianza de que la infraestructura que ha implementado tiene una configuración lista para producción.

```
copilot init --app web \
--name web-service \
--type 'Load Balanced Web Service' \
--dockerfile './Dockerfile' \
--port 80 \
--deploy
```