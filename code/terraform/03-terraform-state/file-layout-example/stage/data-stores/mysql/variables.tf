variable "db_password" {
  description = "The master password for the database"
  type        = string
}

variable "db_name" {
  description = "The database name"
  type = string
  default = "example_database_stage"
}