resource "aws_instance" "team" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key
    tags = {
        Name = "walmart"
    }
    
}
