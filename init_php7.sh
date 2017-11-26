pwd=`pwd`
php=$pwd/php7

docker run \
-tid \
--name php7 \
-h php7 \
-p 9000:9000 \
-v $php/etc:/usr/local/php/etc \
-v $php/var:/usr/local/php/var \
leego/php7 \
/sbin/init
sleep 1
docker exec -it php7  /bin/bash -c "/usr/local/php/sbin/php-fpm"
echo "PHP-FPM starting: OK"