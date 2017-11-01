.PHONY: echo build run push
# Replace with your Docker hub username
DOCKER_USER=sleepyfox
# Current (as of writing) version of HyLang
TAG=0.13.0.157

# Image user attributes
USER=pair
UID=1001
GID=1001

echo:
	@ echo "DOCKER_USER=" $(DOCKER_USER)
	@ echo "USER=" $(USER)
	@ echo "UID=" $(UID)
	@ echo "GID=" $(GID)
	@ echo "TAG=" $(TAG)

build:
	docker build \
	--build-arg USER=$(USER) \
	--build-arg UID=$(UID) \
	--build-arg GID=$(GID) \
	-t $(DOCKER_USER)/hy:$(TAG) .

run:
	docker run -it --rm -v $(shell pwd)/src:/var/app/src $(DOCKER_USER)/hy:$(TAG) $(arg)
# Usage: `make run arg="hy src/world.hy"

push:
	docker push $(DOCKER_USER)/hy:$(TAG)
	docker tag $(DOCKER_USER)/hy:$(TAG) $(DOCKER_USER)/hy:latest
	docker push $(DOCKER_USER)/hy:latest
