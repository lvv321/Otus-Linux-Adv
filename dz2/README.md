# Роль Ansible для установки NGINX и его настройки на использование нестандартного порта 8080
В файле staging/hosts необходимо указать путь к приватному ключу SSH.

Доступность службы http по заданному порту проверяется непостредственно с машины nginx. Сделано это с целью, чтобы не проводить настройки ip на данной машине.