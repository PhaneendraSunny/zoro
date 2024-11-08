provider "aws" {
    region = "us-west-1"
  
}
resource "aws_instance" "team" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key
    tags = {
        Name = "Costco"
    }
    
}
resource "aws_vpc" "my_vpc" {
    cidr_block = ""
  
}
