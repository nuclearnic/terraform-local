#!/usr/bin/env bash

Create SQS queues
declare -a queues=(
"localstack_queue_1"
"localstack_queue_2"
)

for queue in "${queues[@]}"; do
  aws --endpoint-url=http://localhost:4576 sqs create-queue --queue-name "$queue";
done

#Create DynamoDB
aws --endpoint-url=http://localhost:4569 dynamodb create-table --table-name localstack-ddb-1 \
--attribute-definitions AttributeName=Identifier,AttributeType=S \
--key-schema AttributeName=Identifier,KeyType=HASH \
--provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5