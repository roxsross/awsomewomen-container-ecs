copilot app init awsomegames

copilot env init --app awsomegames --name develop

copilot env deploy --app awsomegames --name develop

copilot svc init -n awsomegames-service -t "Load Balanced Web Service" -d Dockerfile --port 3000

copilot svc deploy --app awsomegames --name awsomegames-service --env develop

copilot svc status

copilot svc deploy --app awsomegames --name awsomegames-service --tag 1.0.0 --env develop

copilot app ahow

copilot app delete