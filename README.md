# ubuntu-sqitch

## This project is designed to build and run a Docker image for the ubuntu-sqitch project. Here's a summary of how it works:

`Building the Docker Image:` The build.sh script is used to build and push Docker images for the ubuntu-sqitch project. It accepts two parameters: the Docker Hub account name and the version tag for the image. The script uses docker buildx to build the Docker image and then pushes it to the specified Docker Hub account. It also builds a separate Docker image specifically for the amd64 platform with the same version tag appended with -amd64 and pushes it to the same Docker account.

`Dockerfile:` The Dockerfile specifies the steps to build the Docker image. It starts from an ubuntu:24.04 base image, installs sqitch, mysql-client, postgresql-client, and libdbd-mysql-perl. It sets the working directory to /usr/src/sqitch-project and sets several environment variables related to the database configuration. It also copies the run.sh, mysql.sh, and postgres.sh scripts from the scripts directory to the Docker image.

`Database Setup Scripts:` The run.sh script is the main script that runs when the Docker container starts. It checks the DB_ENGINE environment variable to determine which database engine to use (mysql or postgres), and then runs the corresponding script (mysql.sh or postgres.sh). The mysql.sh script checks if the specified MySQL database exists, and if not, it creates it. It then deploys changes to the database using sqitch.

`Docker Compose:` The docker-compose.yml file is used to define and run multi-container Docker applications. It specifies the services, networks, and volumes for the application.

To use this project, you need to have Docker installed on your machine and a Docker Hub account (or another registry where you can push images). You also need to log in to your Docker registry using docker login. Then, you can run the build.sh script with your Docker Hub account name and desired version tag as parameters to build and push the Docker image. After that, you can use docker-compose up to start the application.

## how to build and publish the image

### build.sh
The build.sh script is designed to build and push Docker images for the ubuntu-sqitch project. It accepts two parameters: the Docker Hub account name and the version tag for the image. Below are the instructions on how to use this script effectively.

## Prerequisites:
1. Make sure Docker is installed on your machine. if not, follow instructions [here](https://docs.docker.com/engine/install/)
2. Make sure you have a Docker Hub account (or another registry where you can push images). If not, create one [here](https://hub.docker.com/) .
3. Login to your Docker registry using docker login.

Usage:
- Open your terminal.
- Navigate to the directory containing the script.
- Run the script with the required parameters. Syntax:

  ```./build.sh [Docker Hub Account] [Version Tag]```

Example:

```./build.sh mydockerhubaccount 1.0.0```


- Replace mydockerhubaccount with your Docker Hub account name and 1.0.0 with your desired version tag.


## What the Script Does:
Builds a Docker image named ubuntu-sqitch tagged with the specified version and pushes it to the specified account on Docker Hub.
Builds a separate Docker image specifically for the amd64 platform with the same version tag appended with -amd64 and pushes it to the same Docker account.

`Notes:`

Ensure that the Dockerfile and any necessary files for building the Docker image are present in the same directory as the script or specify the path accordingly.

The script uses docker buildx which is a Docker CLI plugin for extended build capabilities with BuildKit. Ensure buildx is set up properly in your Docker environment.

This script simplifies the process of building and pushing Docker images across different architectures and should be included in your project's README to assist other developers.