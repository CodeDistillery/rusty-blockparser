.PHONY: build run
.SILENT: run
.IGNORE: run

DOCKER_TAG = "rusty-blockparser"

run:
	docker run -it --rm -v ${CURDIR}:/data ${DOCKER_TAG}

bash:
	docker run -it --rm -v ${CURDIR}:/data --entrypoint "" ${DOCKER_TAG} /bin/bash

build:
	docker build -t ${DOCKER_TAG} .
