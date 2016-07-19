.PHONY: all java shell push-all

BUILDNUM=local
BRANCH=local
ORG=chaossystems

all: java dynamodb shell

shell: ubuntu-devtools ubuntu-cloudtools

java: oracle-jdk8 openjdk-jdk8

push-all: push-oracle-jdk8 push-openjdk-jdk8 push-dynamodb

# Environments
oracle-jdk8:
	cd java/oracle-jdk-8; docker build -t ${ORG}/oracle-jdk-8:${BUILDNUM} .
	docker tag ${ORG}/oracle-jdk-8:${BUILDNUM} ${ORG}/oracle-jdk-8:${BRANCH}

push-oracle-jdk8:
	docker push ${ORG}:oracle-jdk-8

openjdk-jdk8:
	cd java/openjdk-jdk-8; docker build -t ${ORG}/openjdk-jdk-8:${BUILDNUM} .
	docker tag ${ORG}/openjdk-jdk-8:${BUILDNUM} ${ORG}/openjdk-jdk-8:${BRANCH}

push-openjdk-jdk8:
	docker push ${ORG}/openjdk-jdk-8

nodejs:
	cd nodejs; docker build -t ${ORG}/nodejs:${BUILDNUM} .
	docker tag ${ORG}/nodejs:${BUILDNUM} ${ORG}/nodejs:${BRANCH}

push-nodejs:
	docker push ${ORG}/nodejs

# Third Party Applications
dynamodb: openjdk-jdk8
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
