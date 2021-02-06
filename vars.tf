variable "amis" {
  type = map
  default = {
      "us-east-1" = "ami-06fe5f9804d52da4c"
  }
}

variable "security_groups" {
    type = list
    default = ["sg-034b8add2e4e2169d"]
}

variable "subnets" {
    type = map
    default = {
        "a" = "subnet-095cd6cbe57bf7e40"
        "b" = "subnet-085b0668427fa3a81"
    }
}

variable "key_name" {
    default = "aws_dev_certificate"
}