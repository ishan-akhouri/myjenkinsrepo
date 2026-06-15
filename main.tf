terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

resource "null_resource" "demo" {
  provisioner "local-exec" {
    command = "echo 'Terraform apply ran successfully on build ${timestamp()}'"
  }
}
