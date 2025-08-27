resource "aws_dynamodb_table" "test-table" {
    name           = "TestingPurpose"
    billing_mode   = "PROVISIONED"
    read_capacity  = 20
    write_capacity = 20
    hash_key       = "UserName"
    range_key      = "Department"
    

    attribute {
        name = "UserName"
        type = "S"
    }

    attribute {
        name = "Department"
        type = "S"
    }
    tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
    }

}

    
