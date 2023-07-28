to train model run `docker-compose run rasa train`

A trained model most exist before a ontainer can be spinned up

run `docker-compose up --build` to run containers

to chat with the rasa chatbot send a post request to the endpoint at `http://localhost:5005/webhooks/rest/webhook` or run the run.py script