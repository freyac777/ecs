resource "aws_ecs_cluster" "julia" {
  name = "julia"

  setting {
    name  = "esc-julia"
    value = "enabled"
  }
}


resource "aws_ecs_task_definition" "service" {
  family = "service"
  container_definitions = jsonencode([
    {
      name      = "first"
      image     = "freyac777/stackdemo"
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 8000
          hostPort      = 8000
        }
      ]
    }

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-east-2a, us-east-2b]"
  }
}



resource "aws_s3_bucket" "julia-ecs" {
  bucket = "julia-esc-bucket"

  tags = {
    Name        = "julia-ecs"
    Environment = "Dev"
  }
}

