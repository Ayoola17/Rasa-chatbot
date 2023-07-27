#Use the rasa sdk image
FROM rasa/rasa:latest-full

#use  /app as working directory
WORKDIR /app

#copy all files from the current directory to /app in image 
COPY . /app

#installation of custom actions dependencies
RUN pip install rasa[transformers]

#Expose the port
EXPOSE 5005

CMD ["run", "--enable-api"]