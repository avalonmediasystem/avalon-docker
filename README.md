# avalon-docker
The project contains the Dockerfiles for all the necessary components of [Avalon Media System](http://github.com/avalonmediasystem/avalon). For developing with Avalon, the docker-compose script in [Avalon](http://github.com/avalonmediasystem/avalon) and [Avalon Bundle](http://github.com/samvera-labs/avalon-bundle) are recommended.

## Prerequisite

### Linux
1. Install [Docker](https://docs.docker.com/engine/install/)
2. Install [Docker-Compose](https://docs.docker.com/compose/install/)

### OSX
* Install [Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/install/)

## Usage
1. Clone this Repo
2. Copy dotenv.example to .env and fill in the passwords and Rails secret key base.
3. From inside the avalon-docker directory
  * `sudo chmod a+w masterfiles` to setup write permission for shared directory
  * `docker-compose pull` to get the prebuilt images from [Dockerhub](dockerhub.com)
  * `docker-compose up` to stand up the stack

To access the site, visit http://localhost in your browser.

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
