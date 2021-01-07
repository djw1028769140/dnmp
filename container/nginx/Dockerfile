FROM nginx:1.12-alpine

MAINTAINER djw <1028769140@qq.com>

# 设置时区
ENV TZ=Asia/Shanghai
RUN apk update \
    && apk upgrade \
    && apk add tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo $TZ > /etc/timezone
