variable "region" {
  default = "us-east-1"
}

variable "azs" {
  type = list (string)
  default = ["us-east-1a","us-east-1b" ]
}
variable "db_name" {
  default = "admin"
}

variable "db_user" {
  default = "admin"
}

variable "db_password" {
  default = "password"
}

variable "db_engine" {
  default = "mysql"
}

variable "db_engine_version" {
  default = "8.0"
}

variable "db_instance_class" {
  default = "db.t3.micro"
}

variable "db_allocated_storage" {
  default = "10"
}