data "terraform_remote_state" "prod_vpc_all" {
  backend = "local"

  config = {
    path = "../prod/terraform.tfstate"
  }
}