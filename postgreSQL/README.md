
# Install on Docker

## Example code
```
docker run --name my_container_name \
	-e POSTGRES_PASSWORD=my_password \
	-d  \
	-p my_port:5432 \
	-v my_dir:/var/lib/postgresql/data \
  postgres:latest
```

## My Code

Install
```
docker run --name conpg1 -e POSTGRES_PASSWORD=123qwe -d -p 5432:5432 -v D:/Test_Docker/postgresql_dir/:/var/lib/postgresql/data postgres:latest
```

Enter
```
docker start conpg1
docker exec -it conpg1 psql -U postgres

```

# Install on RHEL 9
## Postgresql v15
```
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm
sudo dnf -qy module disable postgresql
sudo dnf install -y postgresql15-server
sudo /usr/pgsql-15/bin/postgresql-15-setup initdb
sudo systemctl enable postgresql-15
sudo systemctl start postgresql-15
```
