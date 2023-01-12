
resource "aws_security_group" "security_group" {
  name        = "security_group"
  description = "Internet reaching access for public ec2s"
  vpc_id      = aws_vpc.jsr_vpc.id

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
            Name = "${var.platform_name}-${var.application_name}-${var.Environment}-security_group"
    }
  depends_on = [aws_vpc.jsr_vpc]
}
