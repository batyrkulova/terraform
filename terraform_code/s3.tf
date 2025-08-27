resource "aws_s3_bucket" "bucket" {
  bucket = "test-bucket-of-elsu"

  tags = {
    Name       = "my bucket"
    Enviroment = "Dev"
  }
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    object_ownership = "ObjectWriter" # This allows ACLs to be used
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example] 

  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}