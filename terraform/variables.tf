#AWS location where to provision VM
variable "aws_region" {
  type = string
  default = "eu-central-1"
}
variable "aws_instance_size" {
  type    = string
  default = "t3.medium"
}
variable aws_access_key {
  type = string
}
variable aws_secret_key {
  type = string
}
variable ssh_key{
  type = string
}
variable ssh_key_private{
  type = string
}


