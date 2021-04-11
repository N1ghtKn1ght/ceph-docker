include .env
configure_ceph:
	docker-compose up -d mon
	sleep 5
	cat ${PATH_CEPH}/ceph/ceph/ceph.conf config.txt > ceph.conf
	cat ceph.conf > ${PATH_CEPH}/ceph/ceph/ceph.conf
	docker-compose restart mon
	docker-compose up -d mgr
	sleep 5
	docker-compose up -d osd1
	docker-compose up -d mds

create_dashboard:
	docker-compose exec mon ceph mgr module enable dashboard
	docker-compose exec mon ceph dashboard create-self-signed-cert
	docker-compose exec mon ceph dashboard set-login-credentials ${LOGIN} ${PASSWORD}


install_ceph: configure_ceph  create_dashboard


start:
	docker-compose up
