Criando uma infra com 3 VPCs a partir do módulo "terraform-aws-modules/vpc/aws", que se comunicam entre si
por um TGW. Esse é o ambiente DEV.
Para a criação da instância EC2 eu poderia usar o módulo https://github.com/terraform-aws-modules/terraform-aws-ec2-instance
mas o objetivo dessa implementação foi mostrar a interação entre módulos criados localmente (EC2) e módulos remotos (VPC)