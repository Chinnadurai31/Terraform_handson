#creating the  vpc's and different subnet deploying the instance in each vpc
resource "aws_vpc" "test_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "test"
  }
}

resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.test_vpc
    cidr_block = "10.0.2.0/16"
    availability_zone = "us-east-1a"
    
    
}

resource "aws_subnet" "subnet2" {
    vpc_id = aws_vpc.test_vpc
    cidr_block = "10.0.3.0/16"
    availability_zone = "us-east-1b"
    
    
}

resource "aws_subnet" "subnet3" {
    vpc_id = aws_vpc.test_vpc
    cidr_block = "10.0.4.0/16"
    availability_zone = "us-east-1c"
    
    
}

resource "aws_instance" "instance_a" {
  ami             = "ami-0c55b159cbfafe1f0"  
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.subnet1
  #security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "Instance_A"
  }
}

resource "aws_instance" "instance_b" {
  ami             = "ami-0c55b159cbfafe1f0"  
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.subnet2
  #security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "Instance_B"
  }
}


resource "aws_instance" "instance_c" {
  ami             = "ami-0c55b159cbfafe1f0"  
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.subnet3
  #security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "Instance_C"
  }
}


