resource "aws_cloudwatch_log_group" "ecs_logs" {
  name = "/ecs/project8"
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "project8-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 70

  dimensions = {
    ClusterName = aws_ecs_cluster.main.name
    ServiceName = aws_ecs_service.app.name
  }
}
