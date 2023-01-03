variable "db_name" {
  description = "The name to use for the database"
  type        = string
  default     = "aws12_example_database_prod"
}

variable "db_password" {
	description = "The password for the database"
	type = string
	sensitive = true
}

variable "db_username" {
	description = "The name to use for the database"
	type = string
}
