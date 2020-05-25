provider "aws" {
  region  = "us-east-2"
  version = "~> 2.62"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = "webservers-prod"
  db_remote_state_bucket = "terraform-book-state"
  db_remote_state_key = "module-example/prod/data-stores/mysql/terraform.tfstate"
  db_remote_state_region = "us-east-2"

  instance_type = "t2.small"
  min_size = 2
  max_size = 10
}

resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  scheduled_action_name = "scale_out_during_business_hours"
  autoscaling_group_name = module.webserver_cluster.asg_name
  min_size = 2
  max_size = 10
  desired_capacity = 6
  recurrence = "0 9 * * *"
}

resource "aws_autoscaling_schedule" "scale_in_at_night" {
  scheduled_action_name = "scale_in_at_night"
  autoscaling_group_name = module.webserver_cluster.asg_name
  min_size = 2
  max_size = 10
  desired_capacity = 2
  recurrence = "0 17 * * *"
}