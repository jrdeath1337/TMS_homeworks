variable "folder_id" {
  description = "Идентификатор каталога Yandex Cloud"
  type        = string
  sensitive   = true
}

variable "default_zone" {
  description = "Зона по умолчанию"
  type        = string
  default     = "ru-central1-a"
}

variable "image_id" {
  description = "ID образа ВМ (Ubuntu 22.04 LTS)"
  type        = string
  default     = "fd8luipngpka5gjrocrl" # ID образа для Ubuntu 22.04 LTS, уточните в консоли при необходимости
}

variable "ssh_pablic_key" {
  description = "Публичный SSH-ключ"
  type        = string
}

variable "instance_count" {
  description = "Количество инстансов ВМ для создания"
  type        = number
  default     = 1
}
