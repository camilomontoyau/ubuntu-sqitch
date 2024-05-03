# ubuntu-sqitch

## how to build the image



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