pwd=`pwd`
nginx=$pwd/nginx
www=$pwd/www

# --net=dev \
docker run \
-tid \
--name nginx \
-h nginx \
--privileged \
-p 80:80 \
-v $nginx/log:/var/log/nginx \
-v $nginx/conf:/etc/nginx/conf.d \
-v $www:/var/www/html \
leego/nginx \
/sbin/init
echo "Nginx starting: OK"