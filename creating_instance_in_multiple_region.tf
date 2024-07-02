#creating ec2 instance in the multiple region 

#us-east-1
provider "aws" {
    alias = "us-east-1"  #creating the alias for the associated region 
    region = "us-east-1"

  
}

#us-west-2
provider "aws" {
    alias = "us-west-2" #creating the alias for the associated region 
    region =  "us-west-2"
  
}

#ami may vary from region to region 
resource "aws_instance" "us-east-1_instance" {
    ami = "ami-06c68f701d8090592"
    instance_type = "t2.micro"
    provider = aws.us-east-1
  
}
resource "aws_instance" "us-west-2_instance" {
    ami = "ami-0604d81f2fd264c7b"
    instance_type = "t2.micro"
    provider = aws.us-west-2
     
}
