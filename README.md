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
- deploy in kubernetes to kubernetes dir run `kubectl apply -f deployment.yaml` and `kubectl apply -f service.yaml` and `kubectl port-forward service/rasa-chatbot-service 5005:5005`

## check status progress of deployment and service
`kubectl get deployments`
`kubectl get pods`
`kubectl get services`


## connecting jenkins to local kubernetes cluster
To connect Jenkins to your local Kubernetes cluster, you'll need to provide Jenkins with the credentials and configuration information it needs to interact with your cluster. Here's how you can set this up:

Get the Kubernetes configuration: The first thing you need is your Kubernetes configuration file (kubeconfig). For a local Kubernetes cluster (like Docker Desktop), the kubeconfig file is usually located at ~/.kube/config on your local machine.

Create a Jenkins Credential for Kubernetes:

Navigate to Jenkins dashboard -> Manage Jenkins -> Manage Credentials.
Click on (global) under Stores scoped to Jenkins.
Click on Add Credentials.
In the Kind dropdown, select Kubernetes configuration (kubeconfig).
You can either copy and paste the content of your kubeconfig file into the Kubeconfig field or use the Kubeconfig file field to point to the location of the file.
Give this credential an ID (for instance, kubeconfig) that will be used in your Jenkins pipeline script.