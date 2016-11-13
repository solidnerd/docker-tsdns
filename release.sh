#!/bin/bash
set -e
REPO=tsdns
TRIGGER_TOKEN=0a8dc666-96b4-11e4-9837-0242ac110045

git checkout master

echo "Pull master to get all latest changes"

git pull

TAG=$(cat VERSION)

echo "Tag following version: $TAG "

git tag -s $TAG

git push origin $TAG

echo "Trigger latest build"

curl -H "Content-Type: application/json" --data '{"docker_tag": "latest"}' -X POST https://registry.hub.docker.com/u/solidnerd/$REPO/trigger/$TRIGGER_TOKEN/

echo "Waiting 60 seconds for next trigger"

sleep 60

echo "Trigger Build for following Tag: https://github.com/solidnerd/docker-rainloop/releases/tag/$TAG"

curl -H "Content-Type: application/json" --data '{"source_type": "Tag", "source_name": "'$TAG'"}' -X POST https://registry.hub.docker.com/u/solidnerd/$REPO/trigger/$TRIGGER_TOKEN/


