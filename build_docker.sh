#!/bin/bash

#SW_FLD=`echo $TRAVIS_COMMIT_MESSAGE | sed 's@.*Build docker:\(.*\),.*@\1@'`
SW_FLD=${TRAVIS_COMMIT_MESSAGE#*"Build docker:"}
SW_FLD=${SW_FLD%%,*}
SW_NAME=`echo ${SW_FLD%%-*} | sed 's/ *$//g'`
DOCKER_SW_NAME=${SW_NAME,,}
SW_TAG=${SW_FLD#*-}
SW_INIT=${DOCKER_SW_NAME:0:1}

#docker build --tag ${DOCKER_USER}/${TRAVIS_REPO_SLUG##*/}: ./docker/${SW_INIT,}/${SW_NAME}/${SW_FLD}
export IMAGE_NAME="${DOCKER_ORG}/${DOCKER_SW_NAME}:${SW_TAG}"
docker build --tag ${IMAGE_NAME} ./docker/${SW_INIT}/${SW_NAME}/${SW_TAG}