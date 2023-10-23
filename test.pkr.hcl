packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "test" {
  ami_name = "test-app"
  source_ami = "ami-09ac7e749b0a8d2a1"
  instance_type = "t2.micro"
  region = "us-west-2"
  ssh_username = "ec2-user"
}

build {
  sources = [
    "source.amazon-ebs.test"
  ]
 
  provisioner "file" {
    source = "./info2.php"
    destination = "/tmp/info2.php" 

  }
  provisioner "shell" {
    script = "./app.sh"
  }

}
