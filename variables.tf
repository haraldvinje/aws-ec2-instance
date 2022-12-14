variable "region" {
  default = "eu-west-1"
}

variable "profile" {
  default = "default"
}

variable "generated_key_name" {
  type        = string
  default     = "my-ec2-ubuntu-key-pair"
  description = "Key-pair generated by Terraform"
}
