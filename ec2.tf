#creating aws ec2 instance with ngnix installed using terraform 

resource "aws_instance" "web_instance" {
  ami                         = "ami-00fa32593b478ad6e"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key-tf.key_name
  subnet_id                   = aws_subnet.some_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
#!/bin/bash -ex

sudo yum update -y
sudo yum install nginx -y
echo "<h1>$(curl https://api.kanye.rest/?format=text)</h1>" | sudo tee /usr/share/nginx/html/index.html
systemctl enable nginx
systemctl start nginx
EOF

  tags = {
    "Name" : "Aniket"
  }
}
