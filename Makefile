.PHONY: all java shell push-all

BUILDNUM=local
BRANCH=local
ORG=chaossystems

all: java dynamodb shell

shell: ubuntu-devtools ubuntu-cloudtools

java: oracle-jdk8

push-all: push-oracle-jdk8 push-dynamodb push-ubuntu-devtools push-ubuntu-cloudtools

# Environments
oracle-jdk8:
	cd java/oracle-jdk-8; docker build -t ${ORG}/oracle-jdk-8:${BUILDNUM} .
	docker tag ${ORG}/oracle-jdk-8:${BUILDNUM} ${ORG}/oracle-jdk-8:${BRANCH}

push-oracle-jdk8:
	docker push ${ORG}/oracle-jdk-8

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
