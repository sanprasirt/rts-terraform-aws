variable "aws_region" {
  description = "AWS Region to launch servers."
  default     = "ap-southeast-1"
  type        = string
}
variable "environment" {
  description = "Environment to launch servers."
  default     = "dev"
  type        = string
}

variable "devision" {
  description = "AWS Profile to launch servers."
  default     = "rts"
  type        = string
}
