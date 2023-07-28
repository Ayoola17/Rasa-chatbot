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
    openjdk-8-jdk \
    # Add other tools you need for your project
    && rm -rf /var/lib/apt/lists/*

# Set the working directory to /app
WORKDIR /app

# Copy the requirements.txt file into the container's /app directory
#COPY requirements.txt /app/

# Install Python packages from requirements.txt
#RUN pip3 install --no-cache-dir -r requirements.txt

# When the container starts, start a Bash shell
CMD ["/bin/bash"]
