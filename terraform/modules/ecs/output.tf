output "cluster_arn" {
  value = "${aws_ecs_cluster.cluster.arn}"
}

output "log_group" {
  value = "${aws_cloudwatch_log_group.web-app.name}"
}

output "task_role_arn" {
  value = "${aws_iam_role.ecs_execution_role.arn}"
}
