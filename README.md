# docker-compose-mysql

This guide explains how to set up and run a MySQL container using Docker Compose.

## Prerequisites

1. Install [Docker](https://docs.docker.com/get-docker/) on your system.
2. Ensure that environment variables for sensitive data are set before running Docker Compose.
   
   Example:
   ```bash
   export MYSQL_ROOT_PASSWORD=secret
   ```
   or include them in a script:
   ```
   MYSQL_ROOT_PASSWORD=secret docker compose up -d
   ```
   > **Tip:** Never hardcode sensitive credentials like root passwords in the Compose file. Use environment variables to keep them secure.

---

## Connecting to MySQL

Use your favorite MySQL client (e.g., MySQL Workbench, Navicat, or any other tool) to connect and manage your database.

### Connection Details

- **Port:** `3306`
- **Host:** `127.0.0.1`
- **Username:** Use the value of `MYSQL_ROOT_USER` (e.g., `root`)
- **Password:** Use the value of `MYSQL_ROOT_PASSWORD` (e.g., `secret`)

---

## Changing the MySQL Root Password

1. **Verify the script is present:**
   ```bash
   ls -l change_root_password.sh
   ```
   If the script is not listed, navigate to the correct directory.

2. **Make the script executable:**
   
   If you encounter an error like:
   ```bash
   -bash: change_root_password.sh: command not found
   ```
   Set the correct permissions for the script by running:
   ```bash
   chmod +x change_root_password.sh
   ```

3. **Run the script:**

    Check running containers with:
    ```bash
    docker ps
    ```
    Look for your container in the `NAMES` column. Use the following command to change the root password:
   ```bash
   ./change_root_password.sh <container_name> <new_password>
   ```

   - Replace `<container_name>` with the name of your MySQL container (e.g., `mysql-mysql-1`).
   - Replace `<new_password>` with the desired new root password.


