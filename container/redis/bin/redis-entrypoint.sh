#!/bin/sh

sed -i "s/\$REDIS_PORT/$REDIS_PORT/g" /app_redis/conf/redis.conf   #声明参数，为了docker-compose里面可以动态配置
sed -i "s/\$REDIS_PASSWORD/$REDIS_PASSWORD/g" /app_redis/conf/redis.conf  #声明参数

redis-server /app_redis/conf/redis.conf