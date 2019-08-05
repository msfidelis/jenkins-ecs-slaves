output "server_configs" {
  value = <<CONFIGURATION


Cluster Example for Jenkins Slaves

Put this informations on your Jenkins master configuration.

Manage Jenkins –> Configure System  -> Add a new cloud -> Amazon EC2 Container Service Cloud

* Cluster Name: ${var.cluster_name}
* Cluster ARN: ${module.ecs.cluster_arn}
* Task ARN: ${module.ecs.task_role_arn}
* Cluster Region: ${var.aws_region}
* Subnets ID's: ${module.vpc.public_subnet_1a}, ${module.vpc.public_subnet_1b}
* Security Group for your task: ${module.vpc.jenkins_sg_id}

Optional Logs COnfiguration
* awslogs-group: ${module.ecs.log_group}
* awslogs-region: ${var.aws_region}
* awslogs-stream-prefix: ${var.cluster_name}-agent


CONFIGURATION
}