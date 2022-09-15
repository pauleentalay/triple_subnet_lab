resource "aws_s3_bucket" "ta_backend_bucket" {
  bucket = "triple-labs-terraform-tfstates-247548036690"
  lifecycle {
    prevent_destroy = true
  } 
  # life cycle is metadata
  tags = {
	  Name = "triple-labs-terraform-tfstates-247548036690"
	  Environment = "Labs"
	  Team = "Talent-Academy"
	  Owner = "Pauleen"
	}
}
resource "aws_s3_bucket_versioning" "version_my_bucket" {
    bucket = aws_s3_bucket.ta_backend_bucket.id
    versioning_configuration {
    status = "Enabled"
}

}
resource "aws_dynamodb_table" "terraform_lock_tbl" {
  name           = "terraformlock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags           = {
    Name = "terraform-lock"
  }
}