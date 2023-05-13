resource "aws_security_group" "public-sec" {
  name        = "allow_outside-traffic2"
  description = "allow_outside-traffic2"
  vpc_id      = module.network.vpc_id

  ingress {
    description      = "ssh from outside"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "public-sec"
  }
}