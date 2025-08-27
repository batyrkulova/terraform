terraform {
    backend "s3" {
        bucket = "test-bucket-of-elsu"
        key = "terraform_code/tfstate"
        region = "us-west-2"
        encrypt = true
    }
}