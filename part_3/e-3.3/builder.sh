#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <github-repo> <dockerhub-repo>"
    exit 1
fi

GITHUB_REPO=$1
DOCKERHUB_REPO=$2

REPO_NAME=$(basename $GITHUB_REPO)
REPO_NAME=${REPO_NAME%.*}

echo "Cloning the GitHub repository..."
git clone https://github.com/$GITHUB_REPO.git

cd $REPO_NAME

echo "Building the Docker image..."
docker build -t $DOCKERHUB_REPO .

echo "Logging in to Docker Hub..."
echo "$DOCKERHUB_TOKEN" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin

echo "Pushing the Docker image to Docker Hub..."
docker push $DOCKERHUB_REPO

cd ..
rm -rf $REPO_NAME

echo "Done!"
