FROM chaossystems/openjdk-jdk8:masterj
MAINTAINER Greg Orzell <chaos@chaossystems.io>

# Extract and link the artifact
WORKDIR /dynamodb
RUN wget -q http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz -P dynamodb_local
RUN tar -xzvf dynamodb_local/dynamodb_local_latest.tar.gz -C dynamodb_local
RUN rm -f dynamodb_local/dynamodb_local_latest.tar.gz

# Included container configuration
EXPOSE 8000
ENTRYPOINT ["java", "-Djava.library.path=/dynamodb/dynamodb_local/DynamoDBLocal_lib", "-jar", "/dynamodb/dynamodb_local/DynamoDBLocal.jar", "-sharedDb"]