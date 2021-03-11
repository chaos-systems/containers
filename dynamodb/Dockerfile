FROM openjdk:jre-slim
MAINTAINER Greg Orzell <chaos@chaossystems.io>

# Extract and link the artifact
WORKDIR /dynamodb
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget && \
    wget -q http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz -P dynamodb_local && \
    tar -xzvf dynamodb_local/dynamodb_local_latest.tar.gz -C dynamodb_local && \
    rm -f dynamodb_local/dynamodb_local_latest.tar.gz && \
    apt-get remove -y wget && \
    apt-get clean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Included container configuration
EXPOSE 8000
ENTRYPOINT ["java", "-Djava.library.path=/dynamodb/dynamodb_local/DynamoDBLocal_lib", "-jar", "/dynamodb/dynamodb_local/DynamoDBLocal.jar", "-sharedDb"]
