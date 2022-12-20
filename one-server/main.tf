terraform {
  #테라폼 버전 지정latest version = 1.3.x
  required_version = "> 1.0.0, < 2.0.0"
  #공급자 버너 지정
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-06eea3cd85e2db8ce"
  instance_type = "t2.micro"
  key_name      = "aws12-key"

  tags = {
    Name = "aws12-terrform-example"
  }
}
