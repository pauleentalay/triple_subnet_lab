terraform {
  backend "s3" {
    bucket = "ta-terraform-tfstates-247548036690"
    key    = "sprint1/week2/training-terraform/triple_subnet.tfstates"
  }
}