#!/bin/bash

#SW_FLD=`echo $TRAVIS_COMMIT_MESSAGE | sed 's@.*Build docker:\(.*\),.*@\1@'`
SW_FLD=${TRAVIS_COMMIT_MESSAGE#Build docker:*}
SW_FLD=${SW_FLD%*,}
SW_NAME=`echo ${SW_FLD%%-*} | sed 's/ *$//g'`
DOCKER_SW_NAME=${SW_NAME,,}
SW_TAG=${SW_FLD#*-}
SW_INIT=${DOCKER_SW_NAME:0:1}

#docker build --tag ${DOCKER_USER}/${TRAVIS_REPO_SLUG##*/}: ./docker/${SW_INIT,}/${SW_NAME}/${SW_FLD}

echo "Building Docker container for: ${SW_FLD}"
echo "docker build --tag ${DOCKER_USER}/${SW_NAME}:${SW_TAG} ./docker/${SW_INIT,}/${SW_NAME}/${SW_TAG}"
docker build --tag ${DOCKER_USER}/${DOCKER_SW_NAME}:${SW_TAG} ./docker/${SW_INIT}/${SW_NAME}/${SW_TAG}

export IMAGE_TO_PUSH="${DOCKER_USER}/${SW_NAME}:${SW_TAG}"