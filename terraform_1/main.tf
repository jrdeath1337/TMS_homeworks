# Создание сети
resource "yandex_vpc_network" "main" {
  name = "web-network"
}

# Создание подсети
resource "yandex_vpc_subnet" "main" {
  name           = "web-subnet"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

# Группа безопасности
resource "yandex_vpc_security_group" "web-sg" {
  name        = "web-sg"
  description = "Правила для веб-сервера"
  network_id  = yandex_vpc_network.main.id

  ingress {
    description    = "Разрешить SSH"
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "Разрешить HTTP"
    protocol       = "TCP"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description    = "Исходящий трафик"
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

# Данные для шаблона cloud-init
data "template_file" "cloud-init" {
  template = file("${path.module}/web-user-data.sh.tpl")
}

# Создание виртуальной машины
resource "yandex_compute_instance" "web" {
  count = var.instance_count

  name        = "web-server-${count.index + 1}"
  platform_id = "standard-v2"
  zone        = var.default_zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 20
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.main.id
    security_group_ids = [yandex_vpc_security_group.web-sg.id]
    nat                = true
  }

  metadata = {
    user-data = data.template_file.cloud-init.rendered
    ssh-keys  = "ubuntu:${var.ssh_key_path}"
  }
}
