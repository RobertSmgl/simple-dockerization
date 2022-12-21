#!/bin/bash

docker login -u $(cat .access-token | head -n1) -p $(cat .access-token | tail -n1) registry.gitlab.com
docker pull registry.gitlab.com/rsamigullin/dev-tools-simple-ci/$(git branch --show-current)/service-frontend
docker pull registry.gitlab.com/rsamigullin/dev-tools-simple-ci/$(git branch --show-current)/service-backend
sed -i -e "s/registry.gitlab.com\/rsamigullin\/dev-tools-simple-ci\/.*\/service-frontend/registry.gitlab.com\/rsamigullin\/dev-tools-simple-ci\/$(git branch --show-current)\/service-frontend/g" docker-compose.yml
sed -i -e "s/registry.gitlab.com\/rsamigullin\/dev-tools-simple-ci\/.*\/service-backend/registry.gitlab.com\/rsamigullin\/dev-tools-simple-ci\/$(git branch --show-current)\/service-backend/g" docker-compose.yml
docker logout