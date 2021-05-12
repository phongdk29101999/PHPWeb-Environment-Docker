## Constants
BASEDIR=$(cd $(dirname $0)/.. && pwd)
WEB_CONTAINER_NAME="env"
MYSQL_CONTAINER_NAME="env-db"

## Mysql local
if [ $(docker ps -a | grep $MYSQL_CONTAINER_NAME | wc -l) == "0" ]; then
    docker run --name $MYSQL_CONTAINER_NAME \
        --restart=always \
        -e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
        -e MYSQL_DATABASE=training \
        -p 3306:3306 \
        -d mysql:5.7 \
        --character-set-server=utf8mb4 \
        --collation-server=utf8mb4_unicode_ci
fi
docker start $MYSQL_CONTAINER_NAME

## Run a application container
docker rm -f $WEB_CONTAINER_NAME
# docker build -t $WEB_CONTAINER_NAME .
docker run -it --name $WEB_CONTAINER_NAME \
    --restart=always \
    -d \
    -p 8080:80 \
    -e APP_MODE=dev \
    --link $MYSQL_CONTAINER_NAME:$MYSQL_CONTAINER_NAME \
    -v $BASEDIR:/var/html/:rw \
    $WEB_CONTAINER_NAME
