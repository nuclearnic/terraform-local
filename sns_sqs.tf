resource "aws_sqs_queue" "transaction_updates_queue" {
  name                      = "terraform-example-queue"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  # redrive_policy            = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.transaction_updates_queue_deadletter.arn}\",\"maxReceiveCount\":4}"

  tags = {
    Environment = "production"
  }
}

resource "aws_sns_topic" "transaction_updates" {
  name = "customer-transaction-updates-topic"
}

resource "aws_sns_topic_subscription" "transaction_updates_sqs_target" {
  topic_arn = "${aws_sns_topic.transaction_updates.arn}"
  protocol  = "sqs"
  endpoint  = "${aws_sqs_queue.transaction_updates_queue.arn}"
}

resource "aws_sns_topic" "customer_transaction_created" {
  name = "customer-transaction-created-topic"
}
