# Rails app container to connect with sqlserver db

## How to start

```
docker pull offthecode/rails-sqlserver:latest
docker run --rm -it -p 3000:3000 -p 1433:1433 -v "$(pwd)":/usr/src/app offthecode/rails-sqlserver:latest ash
rails new --database=sqlserver .
rails s
```

## Contact

offthecode@gmail.com
