
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
