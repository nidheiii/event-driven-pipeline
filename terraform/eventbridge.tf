resource "aws_cloudwatch_event_rule" "daily_report" {
  name                = "daily-report-schedule"
  schedule_expression = "cron(0 23 * * ? *)"
}

resource "aws_cloudwatch_event_target" "report_target" {
  rule = aws_cloudwatch_event_rule.daily_report.name
  arn  = aws_lambda_function.report.arn
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowEventBridgeInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.report.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.daily_report.arn
}
