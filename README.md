
# Despliegue usando AWS Copilot

Copilot es una herramienta para crear e implementar servicios en contenedores sin manejar todos los problemas de configuración de ECS, EC2 y Fargate.

si usa Copilot, puede pasar de la idea a la implementación mucho más rápido, con la confianza de que la infraestructura que ha implementado tiene una configuración lista para producción.

### Despliegue automatico con aws copilot
```
copilot init --app web \
--name web-service \
--type 'Load Balanced Web Service' \
--dockerfile './Dockerfile' \
--port 80 \
--deploy
```

### Despliegue importando recursos ya creado por ejemplo VPC

```
#!/bin/bash
NAME_APP=awsomeweb
ENV=develop

#copilot app init crea una nva aplicación dentro del dir que contendrá su(s) servicio(s)

copilot app init $NAME_APP

#copilot env init crea un nuevo entorno donde vivirán sus servicios.

copilot env init $NAME_APP --name $NAME_APP

#copilot env deploy toma las config en el manifiesto de su entorno e implementa

copilot env deploy --app $NAME_APP --name develop

#copilot svc init crea un nuevo servicio para ejecutar su código por usted.

copilot svc init -n $NAME_APP-service -t "Load Balanced Web Service" -d Dockerfile --port 80

#copilot svc deploy toma su código y configuración locales y los implementa.

copilot svc deploy --app $NAME_APP --name $NAME_APP-service --env develop
```