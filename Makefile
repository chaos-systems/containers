CIRCLE_BUILD_NUM=local
CIRCLE_BRANCH=local

default: build

build:
	docker-compose build --no-cache --force-rm --pull

build-quick:
	docker-compose build --no-cache --force-rm --pull

publish:
	docker-compose push

