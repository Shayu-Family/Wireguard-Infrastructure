resource "aws_key_pair" "shayu_key_pair" {
  key_name   = "shayu-key"
  public_key = file(var.ssh_key_public_path)

  tags = {
    created_by = "opentofu",
    Name = "shayu-key-pair"
  }
}