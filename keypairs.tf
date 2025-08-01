resource "aws_key_pair" "vprofile" {
  key_name   = "vprofilekey"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINeEWZbMi5RgKEoaiENrIp8JN/qf9el6+H6OjOALsuDk abdallah@server01"
}