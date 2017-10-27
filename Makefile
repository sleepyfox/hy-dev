.PHONY: echo build run push
# Replace with your Docker hub username
USER=sleepyfox
# Current (as of writing) version of HyLang
TAG=0.13.0.141

echo:
	@ echo "USER=" $(USER)
	@ echo "TAG=" $(TAG)

build:
	docker build -t $(USER)/hy:$(TAG) .

run:
	docker run -it --rm -v $(shell pwd)/src:/var/app/src $(USER)/hy:$(TAG) $(arg)
# Usage: `make run arg="hy src/world.hy"

push:
	docker push $(USER)/hy:$(TAG)
