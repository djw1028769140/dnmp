#### dnmp开发环境 (基于alpine版本)
```
docker + nginx + mysql + php + redis

PHP 7.2 (redis-3.1.3扩展, swoole-4.4.12扩展)
MySQL 5.7
Nginx 1.12
Redis 3.1.3
Swoole 4.4.12
```
##### 目录结构
```
├─.gitgnore
│
├─README.md
│
├─container //容器目录
│  ├─docker-compose.yml
│  ├─mysql
│  │  ├─Dockerfile
│  │  └─conf
│  │     └─.gitgnore
│  ├─nginx
│  │  ├─Dockerfile
│  │  ├─nginx.conf.bak
│  │  ├─nginx.conf.default
│  │  └─conf.d
│  │     ├─default.conf
│  │     └─.gitignore
│  ├─php
│  │  ├─Dockerfile
│  │  ├─ext
│  │  │  ├─phpredis.tar.gz (redis-3.1.2版本)
│  │  │  └─swoole-src.tar.gz (swoole-4.4.12版本)
│  │  └─conf
│  │     ├─php.ini-development
│  │     ├─php.ini-production
│  │     ├─php-fpm.conf.default
│  │     └─.gitignore
│  └─redis
│     ├─Dockerfile
│     └─conf
│        └─.gitignore
│
├─data //存放各个容器数据目录
│  └─.gitignore
│
├─logs //存放各个容器日志目录
│  └─.gitignore
│
└─www //项目代码目录
   └─.gitignore
```

##### 启动步骤

`1. 预先下载 redis, swoole 安装包放置在 container/php/ext 目录下`

`2. 输入命令:`

```
cd docker_env

cd container

docker-compose up -d
```