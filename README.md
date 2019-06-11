# avalon-docker
The project contains the Dockerfiles for all the necessary components of [Avalon Media System](http://github.com/avalonmediasystem/avalon). For developing with Avalon, the docker-compose script in [Avalon 6.x](http://github.com/avalonmediasystem/avalon) and [Avalon 7.x](http://github.com/samvera-labs/avalon-bundle) are recommended.

## Prerequisite

### Linux
1. Install [Docker](https://docs.docker.com/engine/installation/linux/centos/)
2. Install [Docker-Compose](https://docs.docker.com/compose/install/)

### OSX
* Install [Docker Toolbox for OS X](https://www.docker.com/products/docker-toolbox)
* Run
  * `docker-machine stop default`
  * `docker-machine start default`
  * `docker-machine env`
  * `eval $(docker-machine env)`
  * `docker-machine start default`

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

## Advanced Usage

### Running on a server
Set these Avalon env vars:
* `SETTINGS__DOMAIN=http://<ip address or hostname>/`
* `STREAMING_HOST=<ip address or hostname>` so Avalon crafts the right streaming URLs
