.PHONY: java shell dynamodb swift

BUILDNUM=local
BRANCH=local
ORG=chaossystems

all: java dynamodb shell

shell: ubuntu-devtools ubuntu-cloudtools

java: oracle-jdk8

swift: swift-2-14.04 swift-2-16.04 swift-3-14.04 swift-3-16.04

push-all: push-oracle-jdk8 push-dynamodb push-ubuntu-devtools push-ubuntu-cloudtools push-swift-2 push-swift-3

# Environments
oracle-jdk8:
	cd java/oracle-jdk-8; docker build -t ${ORG}/oracle-jdk-8:${BUILDNUM} .
	docker tag ${ORG}/oracle-jdk-8:${BUILDNUM} ${ORG}/oracle-jdk-8:${BRANCH}

push-oracle-jdk8:
	docker push ${ORG}/oracle-jdk-8

swift-2-14.04:
	cd swift/2/14.04; docker build -t ${ORG}/swift-2:14.04-${BUILDNUM} .
	docker tag ${ORG}/swift-2:14.04-${BUILDNUM} ${ORG}/swift-2:14.04

swift-2-16.04:
	cd swift/2/16.04; docker build -t ${ORG}/swift-2:16.04-${BUILDNUM} .
	docker tag ${ORG}/swift-2:16.04-${BUILDNUM} ${ORG}/swift-2:16.04

push-swift-2:
	docker push ${ORG}/swift-2

swift-3-14.04:
	cd swift/3/14.04; docker build -t ${ORG}/swift-3:14.04-${BUILDNUM} .
	docker tag ${ORG}/swift-3:14.04-${BUILDNUM} ${ORG}/swift-3:14.04

swift-3-16.04:
	cd swift/3/16.04; docker build -t ${ORG}/swift-3:16.04-${BUILDNUM} .
	docker tag ${ORG}/swift-3:16.04-${BUILDNUM} ${ORG}/swift-3:16.04

push-swift-3:
	docker push ${ORG}/swift-3

# Third Party Applications
dynamodb:
	cd dynamodb; docker build -t ${ORG}/dynamodb:${BUILDNUM} .
	docker tag ${ORG}/dynamodb:${BUILDNUM} ${ORG}/dynamodb:${BRANCH}

push-dynamodb:
	docker push ${ORG}/dynamodb

# Shell Configurations
ubuntu-devtools:
	cd shell/ubuntu-devtools; docker build -t ${ORG}/ubuntu-devtools:${BUILDNUM} .
	docker tag ${ORG}/ubuntu-devtools:${BUILDNUM} ${ORG}/ubuntu-devtools:${BRANCH}

push-ubuntu-devtools:
	docker push ${ORG}/ubuntu-devtools

ubuntu-cloudtools: ubuntu-devtools
	cd shell/ubuntu-cloudtools; docker build -t ${ORG}/ubuntu-cloudtools:${BUILDNUM} .
	docker tag ${ORG}/ubuntu-cloudtools:${BUILDNUM} ${ORG}/ubuntu-cloudtools:${BRANCH}

push-ubuntu-cloudtools:
	docker push ${ORG}/ubuntu-cloudtools
