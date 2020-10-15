#!/bin/bash

SW_FLD=`echo $TRAVIS_COMMIT_MESSAGE | sed 's@.*Build:\(.*\),.*@\1@'`
SW_NAME=${SW_FLD%%-*}
SW_TAG=${SW_FLD#*-}
SW_INIT=${SW_NAME:0:1}

#docker build --tag ${DOCKER_USER}/${TRAVIS_REPO_SLUG##*/}: ./docker/${SW_INIT,}/${SW_NAME}/${SW_FLD}

echo "Building Docker container for: ${SW_FLD}"

docker build --tag ${DOCKER_USER}/${SW_NAME}:${SW_TAG} ./docker/${SW_INIT,}/${SW_NAME}/${SW_TAG}

export $IMAGE_TO_PUSH="${DOCKER_USER}/${SW_NAME}:${SW_TAG}"