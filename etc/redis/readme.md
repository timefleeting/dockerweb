1. docker启用redis后同网络下的容器无法连接,提示Connection refused?
1.1 ./etc/redis.conf配置文件注释: bind 127.0.0.1 & protected-mode no(默认yes改为no)
1.2 其它容器或应用要连接的host可直接使用对应的docker NAMES名称
