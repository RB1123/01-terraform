provider "aws" {
  region = "ap-northeast-2"
}

data "aws_vpc" "default" {
  default = true
}

/*
다른 VPC를 사용하려면
data "aws_vpc" "project-vpc" {
	id = "<사용하려는 VPC ID>"
	//id = <"vpc-09648b326103bbd03">
}

data "aws_vpc" "project-vpc" {
	filter {
		name = "tag:NAME"
		vlalue = ["Project-VPC"]
	}
}

*/

data "aws_subnets" "example" {
	filter {
		name = "vpc-id"
		values = [data.aws_vpc.default.id]
	}
}

data "aws_subnet" "example" {
	for_each = toset(data.aws_subnets.example.ids)
	id			 = each.value
}

output "vpc-id" {
  value = data.aws_vpc.default.id
}

output "vpc-cidr_block" {
  value = data.aws_vpc.default.cidr_block
}
