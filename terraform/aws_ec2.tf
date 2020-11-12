resource "aws_key_pair" "deployer" {
  key_name   = "ansible-automation"
  public_key = var.ssh_key
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "webserver" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = var.aws_instance_size
    key_name = "ansible-automation"
    security_groups = [aws_security_group.http-ssh.name]
    root_block_device {
        volume_size = 30
    }
    #this block is needed to make sure that server booted up, before launching ansible
    provisioner "remote-exec" {
        inline = ["sleep 30"]
        connection {
            type = "ssh"
            user = "ubuntu"
            host = self.public_dns
            private_key = file(var.ssh_key_private)
        }
    }
    provisioner "local-exec" {
        command = "ansible-playbook -i ${self.public_ip}, -u ubuntu --ssh-common-args='-o StrictHostKeyChecking=no' --private-key ${var.ssh_key_private}  --extra-vars 'public_dns=${self.public_dns}' playbook.yaml"
    }
   
    tags = {
        Name = "Wordpress Server"
    }
    depends_on = [
        aws_security_group.http-ssh,
    ]
}