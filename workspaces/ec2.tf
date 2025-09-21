resource "aws_instance" "terraform-demo" {
  ami                    = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

  instance_type = lookup(var.instance_type, terraform.workspace)
  tags = {
    Name    = "terraform-demo-${terraform.workspace}"
    Purpose = "terraform-practice"
  }
}

resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_ssh_${terraform.workspace}"
  description = "Allow port no 22 for SSH access"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
