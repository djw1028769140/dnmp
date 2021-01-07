FROM php:7.3.18-fpm-alpine

MAINTAINER djw <1028769140@qq.com>

# 设置时区
ENV TZ=Asia/Shanghai
RUN apk update \
    && apk upgrade \
    && apk add tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo $TZ > /etc/timezone

# 安装 Composer
ENV COMPOSER_HOME /root/composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ENV PATH $COMPOSER_HOME/vendor/bin:$PATH

# 更新安装依赖包和PHP核心拓展
RUN echo -e http://mirrors.ustc.edu.cn/alpine/v3.12/main > /etc/apk/repositories \
	&& apk update \
    && apk upgrade \
    && apk add --no-cache --repository http://mirrors.ustc.edu.cn/alpine/v3.12/community --virtual .build-deps \
        libcrypto1.1 \
        musl \
        xz-libs \
        zlib \
        zlib-dev \
        autoconf \
        gcc \
        g++ \
        libc-dev \
        make \
        openssl-dev \
        pcre-dev \
        linux-headers \
        curl \
        libffi-dev \
        libcurl \
        freetype-dev \
        libpng-dev \
        libjpeg-turbo-dev \
    && apk add --no-cache --repository http://mirrors.ustc.edu.cn/alpine/v3.12/community \
        libzip-dev \
        gd-dev \
        icu-dev \
        libxslt-dev \
    && docker-php-ext-configure gd \
          --with-gd \
          --with-freetype-dir=/usr/include/ \
          --with-png-dir=/usr/include/ \
          --with-jpeg-dir=/usr/include/ \
          --with-zlib-dir=/usr \
    && docker-php-ext-install zip pdo_mysql mysqli gd exif intl xsl soap opcache \
    && docker-php-source delete

# 安装 Redis 扩展
ENV PHPREDIS_PATH /tmp/phpredis
COPY ./ext/phpredis.tar.gz /tmp/
RUN mkdir $PHPREDIS_PATH \
    && tar zxf $PHPREDIS_PATH.tar.gz -C $PHPREDIS_PATH --strip-components 1 \
    && mkdir -p /usr/src/php/ext \
    && mv $PHPREDIS_PATH /usr/src/php/ext/redis \
    && docker-php-ext-install redis \
    && rm -r $PHPREDIS_PATH.tar.gz \
    && rm -rf /usr/src/php

# 安装 Swoole 扩展
ENV SWOOLE_PATH /tmp/swoole-src
COPY ./ext/swoole-src.tar.gz /tmp/
RUN mkdir $SWOOLE_PATH \
    && tar zxf $SWOOLE_PATH.tar.gz -C $SWOOLE_PATH --strip-components 1 \
    && cd $SWOOLE_PATH \
    && /usr/local/bin/phpize \
    && ./configure --with-php-config=/usr/local/bin/php-config --enable-openssl \
    && make \
    && make install \
    && docker-php-ext-enable swoole \
    && rm -r $SWOOLE_PATH.tar.gz \
    && rm -rf $SWOOLE_PATH


## 安装 Redis 扩展
#ENV PHPREDIS_VERSION 3.1.3
#RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz \
#    && tar xfz /tmp/redis.tar.gz \
#    && rm -r /tmp/redis.tar.gz \
#    && mkdir -p /usr/src/php/ext \
#    && mv phpredis-$PHPREDIS_VERSION /usr/src/php/ext/redis \
#    && docker-php-ext-install redis \
#    && rm -rf /usr/src/php
#
## 安装 Swoole 扩展
#ENV PHPSWOOLE_VERSION 4.4.12
#RUN wget -O /tmp/swoole.tar.gz https://github.com/swoole/swoole-src/archive/v$PHPSWOOLE_VERSION.tar.gz \
#    && tar xfz /tmp/swoole.tar.gz \
#    && rm -r /tmp/swoole.tar.gz \
#    && cd /tmp/swoole-src-$PHPSWOOLE_VERSION \
#    && /usr/local/bin/phpize \
#    && ./configure --with-php-config=/usr/local/bin/php-config --enable-openssl --enable-http2 --enable-sockets \
#    && make \
#    && make install \
#    && docker-php-ext-enable swoole \
#    && rm -rf /tmp/swoole-src-$PHPSWOOLE_VERSION
