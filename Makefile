# A wrapper to run Folding @Home in docker container
#
# __author__: tuan t. pham

DOCKER_NAME ?=neofob/fah
DOCKER_TAG ?=latest

docker:
	docker build -t $(DOCKER_NAME):$(DOCKER_TAG) build

up:
	docker-compose up -d

down:
	docker-compose down

pause:
	docker-compose pause
