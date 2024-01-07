# running rasa chatbot locally
to train model run `docker-compose run rasa train`

A trained model most exist before a ontainer can be spinned up

run `docker-compose up --build` to run containers

to chat with the rasa chatbot send a post request to the endpoint at `http://localhost:5005/webhooks/rest/webhook` or run the run.py script


rasa shell --port 5090 exit

To train 
Attach shell to rasa ubuntu image
run `rasa train`

positional arguments:
  {init,run,shell,train,interactive,telemetry,test,visualize,data,export,x,evaluate}
                        Rasa commands
    init                Creates a new project, with example training data, actions, and config files.
    run                 Starts a Rasa server with your trained model.
    shell               Loads your trained model and lets you talk to your assistant on the command line.
    train               Trains a Rasa model using your NLU data and stories.
    interactive         Starts an interactive learning session to create new training data for a Rasa model by chatting.
    telemetry           Configuration of Rasa Open Source telemetry reporting.
    test                Tests Rasa models using your test NLU data and stories.
    visualize           Visualize stories.
    data                Utils for the Rasa training files.
    export              Export conversations using an event broker.
    x                   Run a Rasa server in a mode that enables connecting to Rasa Enterprise as the config endpoint.
    evaluate            Tools for evaluating models.