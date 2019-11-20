resource "aws_dynamodb_table" "customer_transactions_ddb_table" {
  name           = "CustomerTransactions"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "CustomerId"
  range_key      = "TransactionType"

  attribute {
    name = "CustomerId"
    type = "S"
  }

  attribute {
    name = "TransactionType"
    type = "S"
  }

  attribute {
    name = "TransactionAmount"
    type = "N"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  global_secondary_index {
    name               = "TransactionTypeIndex"
    hash_key           = "TransactionType"
    range_key          = "TransactionAmount"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["CustomerId"]
  }

  tags = {
    Name        = "customer-transactions-ddb-table"
    Environment = "development"
  }
}
