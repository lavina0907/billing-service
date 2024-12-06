#!/bin/bash

# Start Docker Compose in the background
docker-compose up -d

# Run your Spring Boot application (replace with your actual command)
./gradlew bootRun  # Replace with your actual Spring Boot run command

# Stop Docker Compose when the Spring Boot application exits
docker-compose down
