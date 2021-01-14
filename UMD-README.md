# UMD Avalon

## Avalon Development Environment
To be updated!

## Kubernetes Deployment
The Avalon kubernetes stack uses images built from this repository. Some of the images that were customized needs to be built locally and deployed to UMD Nexus. In cases where we are using the stock avalon images, we still need to tag them with a specific avalon version and deploy them to UMD Nexus. This is to avoid using images without tags or with the non-stable tags (eg. latest) on the server environment.

### Local Builds
#### HLS Nginx

To build the HLS Nginx image

1. Update the image version of the HLS service on the docker-compose.yaml
2. Build the image

    ```
    cd nginx
    # Using 'avalon-7.1-umd-0.alpha4' as the example version
    docker build -t docker.lib.umd.edu/nginx:avalon-7.1-umd-0.alpha4 .
    ```

3. Deploy to Nexus

    ```
    # Using 'avalon-7.1-umd-0.alpha4' as the example version
    docker push docker.lib.umd.edu/nginx:avalon-7.1-umd-0.alpha4
    ```

### Tagging stock images

To tag and deploy stock images to Nexus

1. Pull the images

    ```
    docker-compose pull db fedora solr redis
    ```

2. Tag them with version the avalon version

    ```
    # Using 'avalon-7.1' as the example version
    docker tag avalonmediasystem/db:fedora4 docker.lib.umd.edu/db:fedora4-avalon-7.1
    docker tag avalonmediasystem/fedora:4.7.5 docker.lib.umd.edu/fedora:4.7.5-avalon-7.1
    docker tag avalonmediasystem/solr:latest docker.lib.umd.edu/solr:avalon-7.1
    docker tag redis:alpine docker.lib.umd.edu/redis:avalon-7.1
    ```

3. Push them to nexus

    ```
    docker push docker.lib.umd.edu/db:fedora4-avalon-7.1
    docker push docker.lib.umd.edu/fedora:4.7.5-avalon-7.1
    docker push docker.lib.umd.edu/solr:avalon-7.1
    docker push docker.lib.umd.edu/redis:avalon-7.1
    ```

**Note**: the main avalon image is built using the Dockerfile in the https://github.com/umd-lib/avalon project.
