#!/bin/bash
cd app

# Build and deploy
docker image prune
docker container prune
docker container build -t app .
docker container run -d -p 3000:3000 --name app app
