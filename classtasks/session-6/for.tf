resource "aws_sqs_queue" "name" {
  for_each = toset(var.sqs)
  name = each.key
}

variable "sqs" {
    description = "Name of  of the sqs"
    type = list(string)
    default = [ "queue-1", "queue-2" , "queue-3" ]

}

resource "aws_sqs_queue" "main" {
  for_each = toset(local.names)
  name = each.key
}

locals {
    names = [ for i in range(1, 3) : "new-queue-${i}"]
}