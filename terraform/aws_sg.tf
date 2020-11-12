resource "aws_security_group" "http-ssh" {
    name = "http-ssh"
    description = "Allow SSH and HTTP/HTTPS access to server"
    ingress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            ipv6_cidr_blocks = []
            description      = "Allow SSH"
            from_port        = 22
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            ipv6_cidr_blocks = []
            description      = "Allow HTTP"
            from_port        = 80
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 80
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            ipv6_cidr_blocks = []
            description      = "Allow HTTPS"
            from_port        = 443
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 443
        },

    ]

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}