variable "aws_region" {
  description = "aws region"
  default     = "us-west-2"
}
variable "infra_name" {
  type        = string
  description = "infra name"
  default     = "banking-network"
}

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

variable "public_key"{
  type = string
  description = "Public key de acesso às instâncias públicas"
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCpuAcCDGl/ONwyusp4q34RVPA5py/1Acj6zPHQcMnPJsbAajg5qpEunxncmPio35Qf1Q5HcVxpK2IpSRVJUH3C8n8EUWPvOZIBApfTcGumUO1UhTQr7lv/3Jthpn3jYivLYk8RsRj55noW/HbWVesEnitWQmAIhi169t/yAknPH6cyXImJe6o6WfbMU/6h8iZ7XLYbt8AmcXRK0oUgY9m9TFvQHVW2SOdhNzI+LI+YeBovNV+esDDMb7s7fpo+dFolubslyhbOlt09W7iLIDvUh+/1ooYtt5NOGDlQlbgEQqpVnd5xuL/8mU144VGvrJT1NbRLKf4VRHa5jfe4GTh7 annagtaraujo@BRRIOWN021449"
}

variable "subnet_id"{
  type = string
  description = "Subnets que abrigarão a instância"
  default = ""
}

variable "vpc_security_group_ids"{
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
