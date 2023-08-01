# running rasa chatbot locally
to train model run `docker-compose run rasa train`

A trained model most exist before a ontainer can be spinned up

run `docker-compose up --build` to run containers

to chat with the rasa chatbot send a post request to the endpoint at `http://localhost:5005/webhooks/rest/webhook` or run the run.py script

# runing rasa_chatbot program manually in kubernetes
- build the docker image with docker compose up
- make changes in the docker container
- push image to docker registry 
- deploy in kubernetes to kubernetes dir run `kubectl apply -f deployment.yaml` and `kubectl apply -f service.yaml` and `kubectl port-forward service/rasa-chatbot-service 5005:5005`

## check status progress of deployment and service
`kubectl get deployments`
`kubectl get pods`
`kubectl get services`

run the test.py script to test
## starting the jenkins serve
- cd to the jenkins dir in the root dir
- run docker-compose up. This will spin up a jenkins server in a docker container at port 8080
- go to localhost:8080 it might take a while to load up
- to enter the jenkins admin password go to the jenkins log look for the following line `This may also be found at: /var/jenkins_home/secrets/initialAdminPassword` and copy the key above it
- input your details username password and email
- once you are logged in to the jenkins server install all the neccessay plugin
plugins needed for this project are `docker`, `git` and `kubernetes`, `kubernetes credentials provider`. you can choosse the recommend plugin installation at the prompt.
Go to your Jenkins dashboard.

Click on "Manage Jenkins" in the left sidebar.
Click on "Manage Plugins".
Click on the "Available" tab and type the plugin you want to install
- you may  have to restart jenkins to make the changes work

## connecting jenkins to docker registery
make sure the docker plug-in is installed before you run
- go to the jenkins dashboard -> credential -> system  then click on global credentials
- Add credential in the kind dropdown menu select username with password.
- in the scope drop down menu select global
- Enter your dockerhub username and password 
- in the id fields you enter a name for this credential to reference it in the pipeline in this case we are using `docker-hub-credentials`
- enter a description in the description field
- click `ok` and `apply`

## connecting jenkins to local kubernetes cluster
To connect Jenkins to your local Kubernetes cluster, you'll need to provide Jenkins with the credentials and configuration information it needs to interact with your cluster. Here's how you can set this up:

Get the Kubernetes configuration: The first thing you need is your Kubernetes configuration file (kubeconfig). For a local Kubernetes cluster (like Docker Desktop), the kubeconfig file is usually located at ~/.kube/config on your local machine.
 run  C:\Users\<your-username>\.kube\config to open the file replace <your-username> with your pc username assuming you are on a windows operating system.

Create a Jenkins Credential for Kubernetes:

- Navigate to Jenkins dashboard -> Manage Jenkins -> Manage Credentials.
- Click on (global) under Stores scoped to Jenkins.
- Click on Add Credentials.
- In the Kind dropdown, select Kubernetes configuration (kubeconfig).
- You can either copy and paste the content of your kubeconfig file into the Kubeconfig field or use the Kubeconfig file field to point to the location of the file.
- Give this credential an ID (for instance, kubeconfig) that will be used in your Jenkins pipeline script.

## Configure GitHub for jeenkins if jenkins runs in cloud

In your GitHub repository:

- Go to the "Settings" tab.
- Click on "Webhooks".
- Click "Add webhook".
- For "Payload URL", input http://<your-jenkins-server>/github-webhook/. This tells GitHub where to send webhook payloads.
- Set "Content type" to application/json.
- Set "Which events would you like to trigger this webhook?" to "Just the push event".
- Click "Add webhook".
- Create a Jenkins Pipeline Job


## Running the cicd pipeline

In your Jenkins dashboard, click "New Item".
Name the job, choose "Pipeline", and click "OK".
Under "General", check "GitHub project" and enter your project URL.
Under "Build Triggers", select "GitHub hook trigger for GITScm polling". This is to trigger the pipeline job for each commit pushed to the main branch.
Under "Pipeline", select "Pipeline script from SCM" for the "Definition".
For the "SCM", select "Git".
In "Repository URL", put the URL of your GitHub repository.
In "Branch Specifier", put */main to build the main branch.
Under "Script Path", enter the path to your Jenkinsfile in your repository.
Click "Save".
