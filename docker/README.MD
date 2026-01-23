# Docker

## Login in Docker HUB
``` bash
docker login # Login in dockerhub console
```

## Tag Repo
``` bash
docker tag <local-image>:<version-tag> <dockerhub-user>/<docker-image>:<version-tag>
docker push rafahueb/docker-node-app:1.0.0 # To push into the hub
```

# DOCKER COMPOSE BASICS

## Start services
``` bash
docker-compose up              # start services in foreground
docker-compose up -d           # start services in background (detached)
docker-compose up --build      # rebuild images before starting
```

## Stop & Remove
``` bash
docker-compose down            # stop and remove containers, networks
docker-compose down -v         # stop and remove including volumes
docker-compose stop            # stop running containers (don't remove)
docker-compose start           # start stopped containers
```

## View Status
``` bash
docker-compose ps              # list running containers
docker-compose logs            # view container logs
docker-compose logs -f         # follow logs in real-time
docker-compose logs service    # logs for specific service
```

## Execute Commands
``` bash
docker-compose exec service cmd    # run command in running container
docker-compose run service cmd     # run command in new container
```

## Build & Pull
``` bash
docker-compose build           # build images
docker-compose pull            # pull images from registry
```

## Cleanup
``` bash
docker-compose rm              # remove stopped containers
docker-compose prune           # remove unused resources
```

## Validate
``` bash
docker-compose config          # validate docker-compose.yml
```
