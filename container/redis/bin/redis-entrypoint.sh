#!/bin/sh

sed -i "s/\$REDIS_PORT/$REDIS_PORT/g" /app_redis/conf/redis.conf          #动态替换 端口
sed -i "s/\$REDIS_PASSWORD/$REDIS_PASSWORD/g" /app_redis/conf/redis.conf  #动态替换 密码

redis-server /app_redis/conf/redis.conf