# ceph-docker
 easy installation of ceph on docker

# Install

1. Create network ceph-net
  ~~~
  docker network create ceph-net
  ~~~
2. Get Gateway and Subnet
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
3. Create file .env
  - For example
  ~~~
  MON_IP= <Gateway>
  CEPH_PUBLIC_NETWORK= <Subnet>
  PATH_CEPH= <your path>
  LOGIN= <your login>
  PASSWORD= <your password>
  ~~~
4. Installation ceph on docker
  ~~~
  make install_ceph
  ~~~
5. Follow the link Gateway:8443 in a browser
