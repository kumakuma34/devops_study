resource "aws_s3_bucket" "test-s3-tf-state" {

  bucket = "skt-test-s3-bucket-tfstate"

  tags = {
    "Name" = "skt-test-s3-bucket-tfstate"
  }
  
}

resource "aws_dynamodb_table" "test-ddb-tf-lock" {

  depends_on   = [aws_s3_bucket.test-s3-tf-state]
  name         = "skt-test-s3-ddb-tflock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "skt-test-s3-ddb-tflock"
  }

}

