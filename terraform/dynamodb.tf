resource "aws_dynamodb_table" "events" {
  name         = "ProcessedEvents"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "eventDate"
  range_key    = "eventId"

  attribute {
    name = "eventDate"
    type = "S"
  }

  attribute {
    name = "eventId"
    type = "S"
  }
}

