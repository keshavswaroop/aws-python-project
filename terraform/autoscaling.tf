resource "aws_appautoscaling_target" "ecs" {
  max_capacity       = 6
  min_capacity       = 2

  resource_id        = "service/prod-cluster/prod-service"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  depends_on = [
    aws_ecs_service.app
  ]
}

resource "aws_appautoscaling_policy" "scale_up" {
  name               = "ecs-scale-up"
  service_namespace  = "ecs"
  resource_id        = aws_appautoscaling_target.ecs.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs.scalable_dimension
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value       = 70
    scale_in_cooldown  = 300
    scale_out_cooldown = 180
  }

  depends_on = [
    aws_appautoscaling_target.ecs
  ]
}
