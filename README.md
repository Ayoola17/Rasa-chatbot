to train model run `docker-compose run rasa train`

A trained model most exist before a ontainer can be spinned up

run `docker-compose up --build` to run containers

to chat with the rasa chatbot send a post request to the endpoint at `http://localhost:5005/webhooks/rest/webhook` or run the run.py script

# Rasa_ci_cd

## continous integation underdevelopment


## continous deployment underdevelopment
- build the docker image with docker compose up
- make changes in the docker container
- push image to docker registry 
- deploy in kubernetes to kubernetes dir run `kubectl apply -f deployment.yaml` and `kubectl apply -f service.yaml`

## check status progress of deployment and service
`kubectl get deployments`
`kubectl get pods`
`kubectl get services`
