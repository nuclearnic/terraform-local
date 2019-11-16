# Terraform + Localstack

## Getting Started
* Create localstack instance: `$ docker-compose up`
* Initialise Terraform: `$ terraform init`
* Create defined resources: `$ terraform apply`


## Resources
* AWS: https://www.terraform.io/docs/providers/aws/index.html

## AWS Commands
* `$ aws --endpoint-url=http://localhost:4569 dynamodb list-tables`