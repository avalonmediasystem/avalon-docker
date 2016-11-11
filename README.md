# avalon-docker
Dockerfiles for Avalon Media System - http://github.com/avalonmediasystem/avalon


On a Mac
* Install Docker Toolbox for OS X
* Clone this Repo and checkout the desired branch (6.x probably)
* Run
  * `docker-machine stop default`
  * `docker-machine env`
  * `eval $(docker-machine env)`
  * `docker-machine start default`
  * `docker-compose up`
* The docker container will be accessible via `http://192.168.99.100:8888/`
