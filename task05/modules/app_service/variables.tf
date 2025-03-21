variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "service_plan_id" {
  type = string
}

variable "allow_ip" {
  type = string
}

variable "tags" {
  type = map(string)
}