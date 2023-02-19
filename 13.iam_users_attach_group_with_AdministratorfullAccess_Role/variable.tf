variable "users" {
  description = "list of users"
  type        = list
  default     = ["thulasi", "nkhil"]
}

variable "group_name" {
  description = "group name"
  type        =  string
  default     =  "administrator"
}
