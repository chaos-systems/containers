CIRCLE_BUILD_NUM=local
CIRCLE_BRANCH=local

build:
	docker-compose build --no-cache
	docker tag chaossystems/dynamodb:$(CIRCLE_BUILD_NUM) chaossystems/dynamodb:$(CIRCLE_BRANCH)
	docker tag chaossystems/oraclejdk8:$(CIRCLE_BUILD_NUM) chaossystems/oraclejdk8:$(CIRCLE_BRANCH)
	docker tag chaossystems/swift:3.1.0 chaossystems/swift:3
	docker tag chaossystems/ubuntu-devtools:$(CIRCLE_BUILD_NUM) chaossystems/ubuntu-devtools:$(CIRCLE_BRANCH)
	docker tag chaossystems/ubuntu-cloudtools:$(CIRCLE_BUILD_NUM) chaossystems/ubuntu-cloudtools:$(CIRCLE_BRANCH)

publish:
	docker-compose push

