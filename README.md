# avalon-docker
Dockerfiles for Avalon Media System - http://github.com/avalonmediasystem/avalon

Clone this Repo and checkout the desired branch
Copy dotenv.example to .env and fill in the passwords and Rails secrect key base.

On a Mac
* Install Docker Toolbox for OS X
* Run
  * `docker-machine stop default`
  * `docker-machine start default`
  * `docker-machine env`
  * `eval $(docker-machine env)`
  * `docker-machine start default`
  * `docker-compose up`
* The docker container will be accessible via `http://192.168.99.100:8888/`
* `docker exec -it avalondocker_avalon_1 /bin/bash` to log into the docker container
* if anytime OS X says docker is not started, rerun `eval $(docker-machine env)
