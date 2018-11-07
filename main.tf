provider "aws" {
  region  = "ap-southeast-2"
  profile = "default"
}
                                                  
module "test" {                                   
  source = "./modules"
}                                                 

output "azs" {
  value = "${module.test.azs}"
}

output "random_pet_id" {
  value = "${module.test.random_pet_id}"
}

output "random_shuffle_result" {
  value = "${module.test.random_shuffle_result}"
}

output "random_integer_result" {
  value = "${module.test.random_integer_result}"
}

output "uuid" {
  value = "${module.test.uuid}"
}

output "random_string_result" {
  value = "${module.test.random_string_result}"
}

