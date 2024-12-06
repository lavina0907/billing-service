#!/bin/bash

# Define the MySQL container name
MYSQL_CONTAINER="billing-system-mysql"

MYSQL_PWD_VAR="root"

# Get the current timestamp
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Define the backup file name with the timestamp
BACKUP_FILE="/Users/rishabh.verma/IdeaProjects/billing-service/src/main/resources/keycloak_backup$TIMESTAMP.sql"
DOCKER_BACKUP_FILE="\./src/main/resources/keycloak_backup$TIMESTAMP\.sql:/docker-entrypoint-initdb\.d/keycloak_backup$TIMESTAMP\.sql"

# Create the backup using mysqldump without providing the password inline
docker exec -i $MYSQL_CONTAINER mysqldump -uroot -p$MYSQL_PWD_VAR keycloak > "$BACKUP_FILE"

# Add the USE keycloak; command to the top of the backup file
echo "USE keycloak;" | cat - "$BACKUP_FILE" > temp && mv temp "$BACKUP_FILE"

# Update the docker-compose.yml file with the new backup file path
DOCKER_COMPOSE_FILE="/Users/rishabh.verma/IdeaProjects/billing-service/docker-compose.yml"
# Create a temporary Docker Compose file
TMP_DIR="/Users/rishabh.verma/IdeaProjects/billing-service/tmp"
TMP_DOCKER_COMPOSE_FILE="$TMP_DIR/docker-compose.tmp.yml"
mkdir -p "$TMP_DIR"
sed "s|\./src/main/resources/keycloak_backup\.sql:/docker-entrypoint-initdb\.d/keycloak_backup\.sql|${DOCKER_BACKUP_FILE}|g" "$DOCKER_COMPOSE_FILE" > "$TMP_DOCKER_COMPOSE_FILE"

# Replace the original Docker Compose file with the temporary one
mv "$TMP_DOCKER_COMPOSE_FILE" "$DOCKER_COMPOSE_FILE"

rm -r "$TMP_DIR"

# Output a message
echo "Backup completed. The backup file is saved as $BACKUP_FILE"
