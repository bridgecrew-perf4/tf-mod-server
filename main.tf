provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "testbucket" {
  bucket_prefix = "testbucket"
}

output "my_bucket_name" {
  value = aws_s3_bucket.testbucket.id
}

terraform {
  backend "remote" {
    organization = "desotech"

    workspaces {
      name = "test"
    }
  }
}
