# variable "aws_region" {
#   description = "aws region"
#   default     = "us-west-2"
# }
# variable "infra_name" {
#   type        = string
#   description = "infra name"
#   default     = "banking-network"
variable "infra_name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "Nome da chave de autenticação"
  type        = string
  default     = ""
}

variable "public_key"{
  type = string
  description = "Public key de acesso às instâncias públicas"
  default = "" 
}

variable "tags"{
  type        = map(string)
  default     = {}
}
