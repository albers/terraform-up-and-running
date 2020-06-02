provider "aws" {
  region  = "us-east-2"
  version = "~> 2.62"
}

resource "aws_iam_user" "example" {
  count = 3
  name  = "neo.${count.index + 1}"
}
