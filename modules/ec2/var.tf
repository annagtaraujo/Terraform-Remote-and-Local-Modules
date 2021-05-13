variable "name_instance" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "ami"{
  type = string
  description = "AMI Ubuntu 20.04"
  default = "ami-0ca5c3bd5a268e7db"
}

variable "instance_type"{
  type = string
  description = "Tipo das instâncias"
  default = "t2.micro"
}

variable "subnet_id"{
  type = string
  description = "Subnets que abrigarão a instância"
  default = ""
}

variable "security_group_ids"{
  type = list(string)
  description = "Lista de security groups"
  default = []
}

variable "private_ip"{
  type = string
  description = "IP Privado a ser escolhido para a instância dentro de uma subnet"
  default = ""
}

variable "tags"{
  type        = map(string)
  default     = {}
}

variable "key_name" {
  description = "Nome da chave de autenticação"
  type        = string
  default     = ""
}