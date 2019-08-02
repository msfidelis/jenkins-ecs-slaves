# App Security Group
resource "aws_security_group" "app_sg" {
  name        = "${var.cluster_name}-cluster-sg"
  description = "Default security group to allow inbound/outbound from the VPC"
  vpc_id      = "${aws_vpc.cluster_vpc.id}"
  depends_on  = ["aws_vpc.cluster_vpc"]

  ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }

  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = "true"
  }

  tags {
    Environment = "${var.cluster_name}"
  }
}

# ALB Security Group
resource "aws_security_group" "jenkins_sg" {
  name        = "${var.cluster_name}-jenkins-sg"
  description = "Jenkins Security Group"
  vpc_id      = "${aws_vpc.cluster_vpc.id}"

  ingress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    description = "Dashboard Access Put your IP here"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    description = "ECS Communication"
    security_groups = ["${aws_security_group.app_sg.id}"]
  }

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    description = "SSH"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "50000"
    to_port     = "50000"
    protocol    = "tcp"
    description = "ECS Communication"
    security_groups = ["${aws_security_group.app_sg.id}"]
  }

  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.cluster_name}-alb-sg"
  }
}

# ECS Cluster Security Group
resource "aws_security_group" "ecs_sg" {
  vpc_id      = "${aws_vpc.cluster_vpc.id}"
  name        = "${var.cluster_name}-ecs-service-sg"
  description = "Allow egress from container"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "${var.cluster_name}-ecs-service-sg"
    Environment = "${var.cluster_name}"
  }
}
