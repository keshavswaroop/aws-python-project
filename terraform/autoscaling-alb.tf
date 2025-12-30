resource "aws_appautoscaling_policy" "alb_request_scaling" {
  name               = "ecs-alb-request-scaling"
  policy_type        = "TargetTrackingScaling"
  service_namespace  = "ecs"
  resource_id        = aws_appautoscaling_target.ecs.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs.scalable_dimension

  target_tracking_scaling_policy_configuration {

    predefined_metric_specification {
      predefined_metric_type = "ALBRequestCountPerTarget"

      resource_label = "${aws_lb.app.arn_suffix}/${aws_lb_target_group.app.arn_suffix}"
    }

    # target_value       = 50
    target_value = 10
    scale_out_cooldown = 60
    scale_in_cooldown  = 180
  }

  depends_on = [
    aws_appautoscaling_target.ecs
  ]
}
