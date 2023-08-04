# Start with the latest Ubuntu image as the base
FROM ubuntu:latest

# Update and install basic tools
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    vim \
    git \
    curl \
    wget \
    # Add other tools you need for your project
    && rm -rf /var/lib/apt/lists/*


# Copy the entire contents of the host's 'rasa_chatbot' directory to the container's '/app/rasa_chatbot' directory
COPY . /app

# Set the working directory to /app
WORKDIR /app

# Install virtual environment package
RUN apt update && apt install -y python3-venv

# Install Python packages from requirements.txt within the virtual environment
RUN pip install --no-cache-dir -r requirements.txt

# Map port range 5005-5055 of the container to the same range on the host machine
EXPOSE 5005-5055

# Create a startup script to run multiple commands
RUN echo '#!/bin/bash' >> /start.sh \
    && echo 'rasa run -m models --enable-api --cors "*"' >> /start.sh \
    && chmod +x /start.sh

# When the container starts, run the startup script
CMD ["/bin/bash", "/start.sh"]