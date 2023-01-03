terraform {
  required_version = ">= 1.0.0, < 2.0.0"

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

moudle "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"
	
	cluster_name = var.cluster_name
	db_remote_state_bucket = var.db.remote_state_bucket
	db_remote_state_key = var.remote_state_key

	instance_type = "t2.micro"
	des_size = 1
	min_size = 1
	max_size = 2
}

resource "aws_security_group_rule" "allow_testing_inbound" {
  type = "ingress"
	security_group_id = module.webserver_cluster.alb_security_group_id

	from_port = 12345
	to_port = 12345
	protocol = "tcp"
	cide_block = ["0.0.0.0/0"]
}