resource "aws_sns_topic_subscription" "topic_email_subscription" {
  count     = length(var.emails)
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "email"
  endpoint  = var.emails[count.index]

  lifecycle {
    ignore_changes = [
      topic_arn
    ]
  }
}
