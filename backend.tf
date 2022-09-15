terraform {
  backend "s3" {
    bucket = "triple-labs-terraform-tfstates-247548036690"
    key    = "sprint1/week2/training-terraform/terraform.tfstates"
    dynamodb_table = "terraformlock"
  }
}