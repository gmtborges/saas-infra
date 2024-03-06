#!/bin/bash
# Build and deploy
docker container stop app
docker container rm app
docker container prune --force

docker image prune --force
export $(cat .env)
docker image build -t app ./app
docker container run -d -p 3000:3000 --env-file .env --name app app
