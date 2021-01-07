FROM redis:3.0-alpine

MAINTAINER djw <1028769140@qq.com>

# 设置时区
ENV TZ=Asia/Shanghai
RUN apk update \
    && apk upgrade \
    && apk add tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo $TZ > /etc/timezone

ENV WORKDIR /app_redis
RUN mkdir $WORKDIR
WORKDIR $WORKDIR
RUN mkdir -p $WORKDIR/data
RUN mkdir -p $WORKDIR/log
ADD ./conf $WORKDIR/conf
ADD ./bin $WORKDIR/bin
RUN chown redis:redis $WORKDIR/*
RUN chmod +x $WORKDIR/bin/redis-entrypoint.sh
CMD ["./bin/redis-entrypoint.sh"]