resource "aws_vpc" "test" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my_vpc"
  }
}
resource "aws_internet_gateway" "test" {
    vpc_id = aws_vpc.test.id
    tags = {
      Name = "IG"
    }
}
resource "aws_subnet" "test" {
  vpc_id     = aws_vpc.test.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "pubsub"
  }
}
resource "aws_route_table" "test" {
    vpc_id = aws_vpc.test.id
    route {
    cidr_block = "10.0.0.0/0"
    gateway_id = aws_internet_gateway.test.id
  }
  
}
resource "aws_route_table_association" "test" {
  subnet_id      = aws_subnet.test.id
  route_table_id = aws_route_table.test.id
}
resource "aws_security_group" "test" {
  name        = "My-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.test.id

  tags = {
    Name = "My-sg"
  }
  ingress {
    description = ">>VPC<<"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = ">>VPC<<"
    from_port = 22
    to_port = 22
    protocol = "ssh"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = ">>VPC<<"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks =  ["0.0.0.0/0"]
  }

}
resource "aws_instance" "test" {
    ami = "ami-0cf4e1fcfd8494d5b"
    instance_type = "t2.micro"
    key_name = "git key"
    subnet_id = aws_subnet.test.id
    vpc_security_group_ids = [aws_security_group.test.id]
    tags = {
      Name = "test_Ec-2"
    }
  
}