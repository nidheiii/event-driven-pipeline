resource "aws_s3_bucket" "incoming" {
  bucket = "event-pipeline-incoming-nidheiii-001"
}

resource "aws_s3_bucket" "reports" {
  bucket = "event-pipeline-reports-nidheiii-001"
}

