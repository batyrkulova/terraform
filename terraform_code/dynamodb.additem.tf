resource "aws_dynamodb_table_item" "example" {
  table_name = aws_dynamodb_table.test-table.name
  hash_key   = aws_dynamodb_table.test-table.hash_key
  
  item = <<item
{
  " exampleHashKey": {"S": "testing"},
  "one": {"S": "first"},
  "two": {"S": "Second"},
  "three": {"S": "Third"},
  "four": {"S": "Forths"}

}
item
}


