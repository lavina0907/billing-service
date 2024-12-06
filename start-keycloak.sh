#!/bin/bash

# Define the Keycloak directory path
KEYCLOAK_DIR="/Users/rishabh.verma/Documents/keycloak-22.0.4"

# Command to start Keycloak in dev mode with the specified HTTP port
"$KEYCLOAK_DIR/bin/kc.sh" start-dev --http-port 8180