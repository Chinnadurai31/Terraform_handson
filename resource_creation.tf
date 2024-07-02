
#creating ec2 instance
resource "aws_instance" "test_instance_terraform" {
  ami           = "ami-0e001c9271cf7f3b9"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"

  tags = {
    Name = "test_instance"
  }
}

#creating ebs volune
resource "aws_ebs_volume" "Terrafom_volume" {
  availability_zone = "us-east-1a" 
  size              = 10
  type              = "gp2" 

  tags = {
    Name = "Terraform-test-volume"
  }
}
#attaching the ebs volume to the ec2 instance
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh" 
  volume_id   = aws_ebs_volume.Terrafom_volume.id
  instance_id = aws_instance.test_instance_terraform.id
}


#creating s3 bucket
resource "aws_s3_bucket" "s3-bucket-creation" {
  bucket = "terraform-test-s3-chinna"
  tags = {
    Name = "terraform-test-s3"
    Environment = "test_env"

  }
  
