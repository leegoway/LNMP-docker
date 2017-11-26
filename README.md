# LNMP-docker
working with LNMP images

## 使用方法
1. 下载本项目到本地一目录
2. 安装docker服务
3. 启动服务
```shell
./init_nginx.sh &&
./init_php56.sh &&
./init_mysql.sh &&
./init_redis.sh
```

## 原理解析

### Nginx服务
**需求**
1. 启动容器时自动启动Nginx
2. 配置文件和日志能映射到主机上

**安装过程**
1. wget  http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
2. rpm -ivh nginx-release-centos-7-0.el7.ngx.noarch.rpm
3. yum -y install nginx
4. 制作项目配置文件，参考nginx/conf
5. 设置开机自启动Nginx
6. 制作Nginx容器启动脚本，参考init_nginx.sh

**数据**
1. 日志目录
/var/log/nginx/access.log
/var/log/nginx/error.log
2. 配置目录
/etc/nginx/conf.d/\*.conf
3. PID目录
/var/run/nginx.pid

### PHP服务
**需求**
1. 开机自启动php-fpm
2. 配置文件和日志映射到主机上

**编译安装过程**
1. yum install -y epel-release
2. yum install gcc gcc-c++ libxml2 libxml2-devel openssl openssl-devel bzip2 bzip2-devel libcurl libcurl-devel libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel gmp gmp-devel libmcrypt libmcrypt-devel readline readline-devel libxslt libxslt-devel 
3. ./configure --prefix=/usr/local/php --with-mysql-sock=/var/run/mysql/mysql.sock --with-mcrypt=/usr/local/libmcrypt/ --with-mhash  --with-openssl --with-mysqli=shared,mysqlnd --with-pdo-mysql=shared,mysqlnd --with-gd --with-iconv --with-zlib --enable-zip --enable-inline-optimization --disable-debug --disable-rpath --enable-shared --enable-xml --enable-bcmath --enable-shmop --enable-sysvsem --enable-mbregex --enable-mbstring  --enable-ftp --enable-gd-native-ttf --enable-pcntl --enable-sockets --with-xmlrpc --enable-soap --without-pear --with-gettext --enable-session --with-curl --with-jpeg-dir --with-freetype-dir --enable-opcache --enable-fpm   --without-gdbm  --disable-fileinfo --enable-soap --with-libxml-dir --with-xmlrpc
4. make && make install 
5. 添加到环境变量 ~/.bash_profile 
6. 制作配置文件和启动脚本

**数据**
1. 日志目录
/usr/local/php/var
2. 配置目录
/usr/local/php/etc

### Mysql服务

### Redis服务
**需求**
1. 开启自启动Redis
2. 配置文件和日志目录映射到主机上

**安装过程**
1. yum install epel-release
2. yum -y install redis
3. 制作项目配置文件，参考redis/conf
4. 制作redis启动脚本，参考init_redis.sh

**数据**
1. 日志目录
/var/log/redis/redis.log
2. 配置目录
/etc/redis/6379.conf
3. PID目录
/var/log/redis/6379.pid
4. 数据目录
/var/lib/redis
