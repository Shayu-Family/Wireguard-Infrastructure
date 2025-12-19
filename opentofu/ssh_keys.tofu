resource "hcloud_ssh_key" "opentofu_automation_key" {
  name       = "opentofu-automation"
  public_key = file(var.ssh_key_public_path)

  labels = {
    "created_by" : "opentofu"
  }
}