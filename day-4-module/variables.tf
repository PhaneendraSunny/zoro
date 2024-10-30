variable "ami_id" {
    type = string
    default = "ami-0cf4e1fcfd8494d5b"
    description = "passing ami value to main"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "passing the values of inttance type"
  
}
variable "key" {
    type = string
    default = "git key"
    description = "passing the values of inttance type"
  
}