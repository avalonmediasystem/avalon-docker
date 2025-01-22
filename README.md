# avalon-docker
The project contains the Dockerfiles for all the necessary components of [Avalon Media System](http://github.com/avalonmediasystem/avalon). For developing with Avalon, the docker-compose script in [Avalon](http://github.com/avalonmediasystem/avalon) is recommended.

This branch is only intended to be used with [avalon-terraform](http://github.com/avalonmediasystem/avalon-terraform) on AWS.  For other use cases, use the main branch.

## Prerequisite

### Linux
1. Install [Docker](https://docs.docker.com/engine/installation/linux/centos/)
2. Install [Docker-Compose](https://docs.docker.com/compose/install/)

## Usage
1. Clone this Repo
2. Copy dotenv.example to .env and fill in the passwords and Rails secrect key base.
3. From inside the avalon-docker directory
  * `docker-compose pull` to get the prebuilt images from [Dockerhub](dockerhub.com)
  * `docker-compose up` to stand up the stack

### Notes
* `docker-compose logs <service_name>` to see the container(s) logs
* `docker-compose build --no-cache <service_name>` to build the image(s) from scratch
* `docker ps` to see all running containers
* `docker exec -it avalondocker_avalon_1 /bin/bash` to log into Avalon docker container
