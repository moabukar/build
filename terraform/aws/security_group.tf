resource "aws_security_group" "build" {
    name        = "build-security-group"
    description = "Security Group for build app"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    lifecycle {
        create_before_destroy = true
    }

    tags {
        Name = "build-sg"
    }
}

output "aws_sg" {
    value = "${aws_security_group.build.id}"
}

