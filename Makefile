CIRCLE_BUILD_NUM=local
CIRCLE_BRANCH=local

default: build

build:
	docker-compose build --no-cache --force-rm --pull

build-quick:
	docker-compose build --force-rm

publish:
	docker-compose push

help: #: Show help topics
	@grep "#:" Makefile | sed "s/:.*#//g" | grep -v "@grep" | sort
