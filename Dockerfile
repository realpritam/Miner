# Use an Ubuntu base image
FROM ubuntu:latest

# Copy the script into the container
COPY script.sh script.sh

# Make the script executable
RUN chmod +x script.sh

# Set the script as the entry point
ENTRYPOINT ["script.sh"]
