#!/bin/bash
set -e

# Обновление системы и установка Nginx
apt-get update
apt-get install -y nginx

# Создаем демо-страницу
mkdir -p /var/www/demo
cat > /var/www/demo/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>Yandex Cloud + Terraform Demo</title>
    <style>
        body { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; text-align: center; padding-top: 20vh; font-family: Arial, sans-serif; }
        h1 { font-size: 3em; }
        .container { background: rgba(0,0,0,0.5); padding: 30px; border-radius: 10px; display: inline-block; }
        .hostname { font-family: monospace; background: rgba(0,0,0,0.7); padding: 10px; border-radius: 5px; margin-top: 20px; display: inline-block; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚀 Демо-сервер запущен!</h1>
        <p>Этот сайт развернут с помощью Terraform (IaC) в Yandex Cloud.</p>
        <div class="hostname">
            Имя хоста: $(hostname -f)
        </div>
    </div>
</body>
</html>
EOF

# Настройка Nginx для использования нашей демо-страницы
cat > /etc/nginx/sites-available/demo <<EOF
server {
    listen 80;
    server_name _;
    root /var/www/demo;
    index index.html;
}
EOF

# Активация сайта
ln -sf /etc/nginx/sites-available/demo /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default
systemctl restart nginx
