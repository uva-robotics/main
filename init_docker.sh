#!/usr/bin/env bash

# Invoke docker-compose with the 'uva-robotics' project/stack name, running in the background.
# Use 'docker ps' to view all running containers.
docker-compose -p uva-robotics up -d
