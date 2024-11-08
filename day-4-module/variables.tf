variable "ami_id" {
    type = string
    default =  ""
    description = "passing ami value to main"
}

variable "instance_type" {
    type = string
    default = ""
    description = "passing the values of inttance type"
  
}
variable "key" {
    type = string
    default = ""
    description = "passing the values of inttance type"
  
}
variable "cidr_block" {
    type = string
    default = "10.0.0.0/16"
    description = "passing the values of inttance type"
}