provider "aws" {
  region = "ap-northeast-2"
}

variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["aws12-neo", "aws12-trinity", "aws12-morpheus"]
}

resource "aws_iam_user" "example" {
  count = length(var.user_names)
  name  = "aws12-neo.${count.index}"
}

output "neo_arn" {
  value = aws_iam_user.example[*].arn
}
