data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_key_pair" "angel" {
   key_name   = "angel"
   public_key = file("~/.ssh/angel.pub")
}

resource "aws_instance" "public" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.angel.key_name
  subnet_id     = var.public_subnet_id
  vpc_security_group_ids = [var.public_security_group_id]

  user_data = file("${path.module}/../../scripts/install_nginx.sh")

  tags = {
    Name = "PublicEC2"
  }
}

resource "aws_instance" "private" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.angel.key_name
  subnet_id     = var.private_subnet_id
  vpc_security_group_ids = [var.private_security_group_id]

  user_data = file("${path.module}/../../scripts/install_postgresql.sh")

  tags = {
    Name = "PrivateEC2"
  }
}
