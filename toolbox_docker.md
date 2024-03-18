
docker pull dpage/pgadmin4
docker run -p 8080:80 \
    -e 'PGADMIN_DEFAULT_EMAIL=user@domain.com' \
    -e 'PGADMIN_DEFAULT_PASSWORD=SuperSecret' \
    dpage/pgadmin4

docker inspect db-host | grep "IPAddress":
