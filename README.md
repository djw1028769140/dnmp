#### dnmp开发环境 (基于alpine版本)
```
docker + nginx + mysql + php + redis
需要安装 docker, docker-compose

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

##### 启动步骤:

`1.复制 .env 示例文件: cp .env-example .env`

`2.修改 HTML_DIR 文件位置, 以实际代码位置填写`

`3. 预先下载 redis, swoole 安装包放置在 container/php/ext 目录下`
```
注意:

tar包命名与 container/docker-compose.yml文件中 
以下两行名称对应

COPY ./ext/phpredis.tar.gz /tmp/

COPY ./ext/swoole-src.tar.gz /tmp/
```
`4. `


`5. 输入命令:`
```
cd dnmp
cd container

docker-compose up -d //启动各个容器
docker-compose down  //关闭各个容器
docker-compose ps    //列出启动的容器

docker exec -it dnmp-nginx nginx -t         //检测nginx配置
docker exec -it dnmp-nginx nginx -s reload  //重载nginx
docker exec -it dnmp-php php -v             //查看php信息  
docker exec -it dnmp-php php --ini          //查看phpini信息 
docker exec -it dnmp-php php --ri swoole    //查看swoole扩展信息  
```