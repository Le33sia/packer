packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "test" {
  ami_name = "test-app"
  source_ami = "ami-013a129d325529d4d"

  instance_type = "t2.micro"
  region = "us-west-2"
  ssh_username = "ec2-user"
}

build {
  sources = [
    "source.amazon-ebs.test"
  ]
 
  provisioner "file" {
    source = "./info.php"
    destination = "/tmp/info.php" 

  }
  provisioner "shell" {
    script = "./app.sh"
  }

}
