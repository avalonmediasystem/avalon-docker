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
  * `sudo chmod a+w masterfiles solr_data` to setup write permissions for shared directories
  * `docker-compose pull` to get the prebuilt images from [Dockerhub](dockerhub.com)
  * `docker-compose up` to stand up the stack
4. Create a user account by visiting http://localhost/users/sign_up in your browser.
5. Make the user an admin by running `docker-compose exec avalon bundle exec rake avalon:user:admin` 

### Notes
* `docker-compose logs <service_name>` to see the container(s) logs
* `docker-compose build --no-cache <service_name>` to build the image(s) from scratch
* `docker ps` to see all running containers
* `docker exec -it avalondocker_avalon_1 /bin/bash` to log into Avalon docker container

## Troubleshooting
* If the avalon and fedora containers do not come up the first time you run `docker-compose up` try restarting everything:
  ```
  docker-compose down
  docker-compose up
  ```
* If you have problems with solr or fedora not starting then add the following to their declarations in docker-compose.yml:
  ```
      ulimits:
        nofile:
          soft: 65536
          hard: 65536
  ```

## Advanced Usage

### Running on a server
Set these Avalon env vars:
* `SETTINGS__DOMAIN=http://<ip address or hostname>/`
* `STREAMING_HOST=<ip address or hostname>` so Avalon crafts the right streaming URLs

## nginx HLS image
The nginx HLS image is a special build of nginx with the [nginx-vod-module](https://github.com/kaltura/nginx-vod-module) built into it.  This image has a default nginx config that works with either a mounted content directory or a remote minio/s3 bucket.  For local mounted content, set VOD_MODE to 'local' (default) and mount the content to `/data` in the container.  For remote content, set VOD_MODE to 'remote' and set AVALON_STREAMING_BUCKET_URL to the derivatives bucket (default is `http://minio:9000/derivatives/` for use with a minio container in a docker-compose environment).

If you need to make customizations, make a local copy of nginx.conf.template and mount it into the container at `/etc/nginx/nginx.conf.template`.  This template file has variables that are replaced by environment variables on startup: AVALON_DOMAIN, AVALON_STREAMING_PORT, AVALON_STREAMING_BUCKET_URL, and VOD_MODE.
