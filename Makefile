.PHONY: build tests all

DOCKER_IMAGE_NAME=amontaigu/ansible
ANSIBLE_VERSION="2.2.1.0"

all: build test

build:
	docker build --tag $(DOCKER_IMAGE_NAME) .

tests:
	docker run \
		-v $$(which docker):$$(which docker) \
		-v /var/run/docker.sock:/docker.sock \
		-v $(CURDIR):/app \
		-w="/app/tests" \
		-e DOCKER_HOST_CURDIR=$(CURDIR) \
		-e DOCKER_HOST="unix:///docker.sock" \
		-e DOCKER_IMAGE_NAME=$(DOCKER_IMAGE_NAME) \
		-e ANSIBLE_VERSION=$(ANSIBLE_VERSION) \
		dduportal/bats:0.4.0 \
			/app/tests/
