variable env_prefix {}
variable region {}
variable zone {}
variable "qa_users" {
  type    = list(string)
  default = ["user1@example.com", "user2@example.com", "user3@example.com"]
}