#!/bin/bash

CI_REGISTRY=registry.gitlab.com/tribalwars/tribalwars

docker login $CI_REGISTRY -u $GITLAB_USERNAME -p $GITLAB_TOKEN
docker build \
    -f Dockerfile \
    --tag $CI_REGISTRY/app \
    .

docker build \
    -f Dockerfile_db \
    --tag $CI_REGISTRY/db \
    .

docker push registry.gitlab.com/tribalwars/tribalwars/app
docker push registry.gitlab.com/tribalwars/tribalwars/db
