provider "aws" {
  region  = "us-east-2"
  version = "~> 2.62"
}

terraform {
  backend "s3" {
    bucket         = "terraform-book-state"
    key            = "workspaces-example/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-book-locks"
    encrypt        = true
  }
}

resource "aws_instance" "example" {
  ami = "ami-0c55b159cbfafe1f0"
  instance_type = terraform.workspace == "default" ? "t2.medium" : "t2.micro"
}
