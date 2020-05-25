provider "aws" {
  region  = "us-east-2"
  version = "~> 2.62"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-stage"
  db_remote_state_bucket = "terraform-book-state"
  db_remote_state_key    = "module-example/stage/data-stores/mysql/terraform.tfstate"
  db_remote_state_region = "us-east-2"

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 2
}
