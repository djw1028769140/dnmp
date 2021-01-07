#### dnmp开发环境 (基于alpine版本)
```
docker + nginx + mysql + php + redis

PHP 7.2 (redis扩展, swoole-4.4.12扩展)
MySQL 5.7
Nginx 1.12
Redis 3.1.3
```
##### 目录结构
```
├─.gitgnore
│
├─README.md
│
├─data
│  └─ .gitignore
│
├─container
│  ├─docker-compose.yml
│  ├─mysql
│  │  ├─ Dockerfile
│  │  ├─ conf
│  │  │   └─ .gitgnore
│  │  └─ data
│  │      └─ .gitgnore
│  ├─nginx
│  │  ├─ Dockerfile
│  │  ├─ nginx.conf.bak
│  │  ├─ nginx.conf.default
│  │  └─ conf.d
│  │      ├─ default.conf
│  │      └─ .gitgnore
│  ├─php
│  │  ├─ Dockerfile
│  │  ├─ ext
│  │  └─ conf
│  │      ├─ php.ini-development
│  │      ├─ php.ini-production
│  │      ├─ php-fpm.conf.default
│  │      └─ .gitgnore
│  └─redis
│     ├─ Dockerfile
│     ├─ conf
│     │   └─ .gitgnore
│     └─ data
│         └─ .gitgnore
│
├─logs
│
└─www
   └─index.php
```

##### 启动步骤

`1. 预先下载 redis, swoole 安装包放置在 container/php/ext 目录下`

`2. 输入命令:`

```
cd docker_env

cd container

docker-compose up -d
```