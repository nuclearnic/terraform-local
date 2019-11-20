# ---------------------------------------------------------------------------------------------------------------------
# Terraform Infrastructure Definitions
# ---------------------------------------------------------------------------------------------------------------------

provider "aws" {
  access_key                  = "mockkeyid"
  region                      = "us-east-1"
  s3_force_path_style         = true
  secret_key                  = "mockkeysecret"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    dynamodb = "http://localhost:4569"
    kinesis  = "http://localhost:4568"
    lambda   = "http://localhost:4574"
    s3       = "http://localhost:4572"
    sns      = "http://localhost:4575"
    sqs      = "http://localhost:4576"
  }
}
