// ...existing code...

variable "resource_name" {
  description = "The name of the resource to create"
  type        = string
}

resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo Creating resource ${var.resource_name}"
  }
}
// ...existing code...