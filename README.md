# Development

## First start

Copy file `docker-compose.yml`

```shell
cp ./deployments/dev/docker-compose.example.yml ./deployments/dev/docker-compose.yml
```

Create containers:

```shell
docker compose -f ./deployments/dev/docker-compose.yml -p simple-posts up -d
```

Install dependencies:

```shell
docker exec -it simple-posts-server-app-1 sh -c 'bundle install'
```

## Start

```shell
docker exec -it simple-posts-server-app-1 sh -c 'bundle exec rails s -b $HOST'
```
