resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/${var.project}"
  retention_in_days = 7

}

resource "aws_cloudwatch_metric_alarm" "high_errors" {
   alarm_name            = "${var.project}-high-errors"
   comparison_operator   = "GreaterThanThreshold"
   evaluation_periods    = 2
   metric_name           = "HTTPCode_Target_5XX_Count"
   namespace             = "AWS/ApplicationELB"
   period                = 60
   statistic             = "Sum"
   threshold             = 10
   alarm_description     = "Too many 5XX errors"
}
