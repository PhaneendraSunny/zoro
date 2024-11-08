variable "names" {
    type = list(string)
    default = [ "Sabo", "Ace","Luffy" ]
  
}
resource "aws_instance" "bros" {
    instance_type = "t2.micro"
    ami = "ami-0cf4e1fcfd8494d5b"
    key_name = "git key"
    for_each = toset(var.names)
    tags = {
      Name = each.value
    }
  
}