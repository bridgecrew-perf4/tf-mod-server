variable "server_tags" {
  type        = map(string)
  description = "Tags to assign to the server."
}

variable "encrypt_root" {
  type        = bool
  description = "Whether the root volume should be encrypted."
}

variable "root_volume_size" {
  type        = number
  description = "The size of the root volume in GB."
}

variable "aws_region" {
  type = string
}

variable "subnet_id" {
  type = string
}
