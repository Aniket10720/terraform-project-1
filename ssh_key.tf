#ssh key

resource "aws_key_pair" "key-tf" {
  key_name   = "tf-key"
  public_key = file("${path.module}/tf-key.pem.pub")
}
output "keyname" {
  value = aws_key_pair.key-tf.key_name
}
