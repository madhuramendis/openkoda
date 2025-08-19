# Use the official Openkoda runtime image
FROM openkoda/openkoda:latest

# Choreo requires a numeric USER between 10000–20000
USER 10001

# Openkoda listens on 8080
EXPOSE 8080
