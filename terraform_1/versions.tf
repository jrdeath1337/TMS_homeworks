terraform {
  required_version = ">= 1.3"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.129.0"
    }
  }

  # Бэкенд локальный (по умолчанию)
  # backend "local" {}
}

provider "yandex" {
  zone      = var.default_zone
  folder_id = var.folder_id
}
