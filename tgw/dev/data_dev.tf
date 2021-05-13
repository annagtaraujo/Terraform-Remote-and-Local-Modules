data "terraform_remote_state" "dev_vpc_all" {
  backend = "local"

  config = {
    path = "../dev/terraform.tfstate"
  }
}