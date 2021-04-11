Легкая утановка ceph на docker

1. Создание общей сети ceph-net
  ~~~
  docker network create ceph-net
  ~~~
2. Получеть Gateway и Subnet
  ~~~
  docker network inspect ceph-net
  ~~~
  ~~~
  "IPAM": {
          "Driver": "default",
          "Options": {},
          "Config": [
              {
                  "Subnet": "172.18.0.0/16",
                  "Gateway": "172.18.0.1"
              }
          ]
      },
  ~~~
3. Создание файла .env
  - Пример
  ~~~
  MON_IP= <Gateway>
  CEPH_PUBLIC_NETWORK= <Subnet>
  PATH_CEPH= <ваш путь>
  LOGIN= <логин для входа в дашборд>
  PASSWORD= <пароль для входа в дашборд>
  ~~~
4. Установка ceph на docker
  ~~~
  make install_ceph
  ~~~
5. Открыть дашборд по этой ссылки Gateway:8443
