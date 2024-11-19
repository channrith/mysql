#!/bin/bash

# Variables
CONTAINER_NAME=$1
NEW_PASSWORD=$2

# Check if both arguments (container name and new password) are provided
if [ -z "$CONTAINER_NAME" ] || [ -z "$NEW_PASSWORD" ]; then
  echo "Usage: $0 <container_name> <new_password>"
  exit 1
fi

# Run MySQL command inside the container to change the root password
docker exec -i $CONTAINER_NAME mysql -u root -p -e "
  USE mysql;
  UPDATE user SET authentication_string = PASSWORD('$NEW_PASSWORD') WHERE User = 'root';
  FLUSH PRIVILEGES;
"

echo "Root password changed successfully."
