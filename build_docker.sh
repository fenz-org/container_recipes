#!/bin/bash

#SW_FLD=`echo $TRAVIS_COMMIT_MESSAGE | sed 's@.*Build docker:\(.*\),.*@\1@'`
SW_FLD=${TRAVIS_COMMIT_MESSAGE#Build docker:*}
SW_FLD=${SW_FLD%*,}
echo ${SW_FLD}
SW_NAME=${SW_FLD%%-*}
echo ${SW_NAME}
SW_TAG=${SW_FLD#*-}
echo ${SW_TAG}
SW_INIT=${SW_NAME:0:1}
echo ${SW_INIT}

#docker build --tag ${DOCKER_USER}/${TRAVIS_REPO_SLUG##*/}: ./docker/${SW_INIT,}/${SW_NAME}/${SW_FLD}

echo "Building Docker container for: ${SW_FLD}"

docker build --tag ${DOCKER_USER}/${SW_NAME}:${SW_TAG} ./docker/${SW_INIT,}/${SW_NAME}/${SW_TAG}

export IMAGE_TO_PUSH="${DOCKER_USER}/${SW_NAME}:${SW_TAG}"