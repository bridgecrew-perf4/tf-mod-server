provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical's Owner ID on AWS

  filter {
    name   = "name"
    values = ["ubuntu-minimal/images/hvm-ssd/ubuntu-focal-20.04-amd64-minimal-????????"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_network_interface" "primary" {
  subnet_id = var.subnet_id
}

resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags          = var.server_tags

  root_block_device {
    encrypted   = var.encrypt_root
    volume_size = var.root_volume_size
  }

  network_interface {
    network_interface_id = aws_network_interface.primary.id
    device_index         = 0
  }
}
