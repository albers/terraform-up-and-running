provider "aws" {
  region  = "us-east-2"
  version = "~> 2.62"
}

terraform {
  backend "s3" {
    bucket         = "terraform-book-state"
    key            = "module-example/prod/data-stores/mysql/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-book-locks"
    encrypt        = true
  }
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  skip_final_snapshot = true

  name     = var.db_name
  username = "admin"
  password = var.db_password
}