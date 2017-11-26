pwd=`pwd`
redis=$pwd/redis

# --net=dev \
docker run \
-tid \
--name redis \
-h redis \
--privileged \
-p 6379:6379 \
-v $redis/conf:/etc/redis \
-v $redis/data:/var/lib/redis \
-v $redis/log:/var/log/redis \
leego/redis \
/sbin/init 
sleep 2
docker exec -it redis  /bin/bash -c "redis-server /etc/redis/6379.conf"
echo "Reids starting: OK"