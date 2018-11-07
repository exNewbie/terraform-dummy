# ------------------------------------------------------------------------------
# Data
# ------------------------------------------------------------------------------
data "aws_availability_zones" "available" {}

# ------------------------------------------------------------------------------
# Local
# ------------------------------------------------------------------------------

locals {
  CreateUniqueID = "${uuid()}"
}

# ------------------------------------------------------------------------------
# Resources
# ------------------------------------------------------------------------------

resource "random_pet" "server" {
  length = 1
}

resource "random_shuffle" "az" {
  input        = ["${local.CreateUniqueID}"]
  result_count = 1

  keepers = {
    # Generate a new integer each time we switch to a new listener ARN
    listener_arn = "var.my-name"
  }
}

resource "random_integer" "priority" {
  min = 1
  max = 99999

  keepers = {
    # Generate a new integer each time we switch to a new listener ARN
    listener_arn = "var.listener_arn"
  }
}

resource "random_string" "name-prefix" {
  length  = 32
  special = false

  #  keepers = {
  #    uuid = "${local.CreateUniqueID}"
  #  }
}

# ------------------------------------------------------------------------------
# Output 
# ------------------------------------------------------------------------------

output "azs" {
  value = "${length(data.aws_availability_zones.available.names)}"
}

output "random_pet_id" {
  value = "${random_pet.server.id}"
}

output "random_shuffle_result" {
  value = "${random_shuffle.az.result}"
}

output "random_integer_result" {
  value = "${random_integer.priority.result}"
}

output "uuid" {
  value = "${local.CreateUniqueID}"
}

output "random_string_result" {
  value = "${random_string.name-prefix.result}"
}

