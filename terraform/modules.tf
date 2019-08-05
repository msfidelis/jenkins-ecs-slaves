module "vpc" {
  source         = "./modules/vpc"
  cluster_name   = "${var.cluster_name}"
  alb_port       = "${var.alb_port}"
  container_port = "${var.container_port}"
}

module "ecs" {
  source              = "./modules/ecs"
  vpc_id              = "${module.vpc.vpc_id}"
  cluster_name        = "${var.cluster_name}"
  container_name      = "${var.container_name}"
  public_subnet_1a    = "${module.vpc.public_subnet_1a}"
  public_subnet_1b    = "${module.vpc.public_subnet_1b}"
  jenkins_sg_id       = "${module.vpc.jenkins_sg_id}"
  app_repository_name = "${var.app_repository_name}"
  alb_port            = "${var.alb_port}"
  container_port      = "${var.container_port}"
  min_tasks           = "${var.min_tasks}"
  max_tasks           = "${var.max_tasks}"
  cpu_to_scale_up     = "${var.cpu_to_scale_up}"
  cpu_to_scale_down   = "${var.cpu_to_scale_down}"
  desired_tasks       = "${var.desired_tasks}"
  desired_task_cpu    = "${var.desired_task_cpu}"
  desired_task_memory = "${var.desired_task_memory}"

  security_groups_ids = [
    "${module.vpc.jenkins_sg_id}"
  ]

  availability_zones = [
    "${module.vpc.public_subnet_1a}",
    "${module.vpc.public_subnet_1b}",
  ]
}