# create EC2 (web server)
resource "aws_instance" "t3640-web-server" {
  ami = var.AMI_Inst   # image
  instance_type = var.instance_type  # instance type
  subnet_id = aws_subnet.t3640-ext-subnet.id   # public subnet
  vpc_security_group_ids = ["${aws_security_group.t3640-sg.id}"]  # security group
  key_name = var.KEY   # SSH KEY
 # user_data = "${file("wordpress.sh")}"
 # user_data = file("${path.module}/wordpress.sh")

  tags = {
    "Name" = "t3640-web-server"
  }
}