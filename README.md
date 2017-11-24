# LNMP-docker
working with LNMP images

## 使用方法
1、下载本项目到本地一目录
2、安装docker服务
3、./init_nginx.sh &&
   ./init_php56.sh &&
   ./init_mysql.sh &&
   ./init_redis.sh


## 原理解析

### Nginx服务
**需求**
1. 启动容器时自动启动
2. 配置文件和日志能映射到主机上

**安装过程**
1. wget  http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
2. rpm -ivh nginx-release-centos-7-0.el7.ngx.noarch.rpm
3. yum -y install nginx
4. 

**数据**
1. 日志目录
/var/log/nginx/access.log
/var/log/nginx/error.log
2. 配置目录
/etc/nginx/conf.d/\*.conf
3. PID目录
/var/run/nginx.pid

### PHP服务

### Mysql服务

### Redis服务
