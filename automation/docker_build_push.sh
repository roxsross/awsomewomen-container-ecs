#!/bin/bash

VERSION=`jq -r '.version' ./package.json`
REGION='us-east-1'
ECS_ACCOUNT_NUMBER='459137896070'
REPOSITORY='awsomedemo'

function ecr_login(){
  aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ECS_ACCOUNT_NUMBER.dkr.ecr.$REGION.amazonaws.com
}

function docker_build() {
  echo "Build Imagen Version $VERSION"
  docker build -t $ECS_ACCOUNT_NUMBER.dkr.ecr.$REGION.amazonaws.com/$REPOSITORY:$VERSION .
}

function docker_push() {
  echo "Push To ECR $VERSION"
  docker push $ECS_ACCOUNT_NUMBER.dkr.ecr.$REGION.amazonaws.com/$REPOSITORY:$VERSION
}


ecr_login
docker_build
docker_push