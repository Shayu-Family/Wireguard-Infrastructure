resource "hcloud_ssh_key" "main" {
  name       = "main-ssh-key"
  public_key = file(var.ssh_key_public_path)
}