resource "aws_lambda_function" "ingest" {
  function_name = "DataIngestionProcessor"
  runtime       = "python3.12"
  handler       = "ingest_lambda.lambda_handler"
  role          = aws_iam_role.lambda_role.arn
  filename      = "../lambda/ingest.zip"
}

resource "aws_lambda_function" "report" {
  function_name = "DailyReportGenerator"
  runtime       = "python3.12"
  handler       = "report_lambda.lambda_handler"
  role          = aws_iam_role.lambda_role.arn
  filename      = "../lambda/report.zip"
}

