module "dev" {
  source        = "github.com/PhaneendraSunny/zoro/day-4-module"
  ami_id        = "ami-0cf4e1fcfd8494d5b"
  instance_type = "t2.micro"
  key           = "git key"
  
}
module "dev2" {
  source        = "github.com/PhaneendraSunny/zoro/day-4-module"
  ami_id        = "ami-0cf4e1fcfd8494d5b"
  instance_type = "t2.micro"
  key           = "git key"

}