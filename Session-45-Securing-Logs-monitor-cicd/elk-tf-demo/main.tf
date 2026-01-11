provider "aws" {
  region = local.region
}
resource "aws_security_group" "elk_sg" {
  name = "elk-sg"
  dynamic "ingress" {
    for_each = var.allowed_cidrs
    content {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ingress.value]
    }
  }
  dynamic "ingress" {
    for_each = var.allowed_cidrs
    content {
        description = "Kibana"
        from_port = 5601
        to_port = 5601
        protocol = "tcp"
        cidr_blocks = [ingress.value]
    }
  }
  dynamic "ingress" {
    for_each = var.allowed_cidrs
    content {
        description = "ElasticSearch"
        from_port = 9200
        to_port = 9200
        protocol = "tcp"
        cidr_blocks = [ingress.value]
    }
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# take automaic AMI Id based on Region
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"] 
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
resource "aws_instance" "elk" {
  ami = data.aws_ami.ubuntu.id
  instance_type = local.instance_type
  key_name = "linuxkey"
  vpc_security_group_ids = [aws_security_group.elk_sg.id]
  user_data = file("${path.module}/user_data.sh")
  root_block_device {
    volume_size = 40
    volume_type = "gp3"
  }

  tags = {
    Name="ELK-Instance"
  }
}