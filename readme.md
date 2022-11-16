1. 项目结构说明
./build/ : 构建镜像对应版本的dockfile及对应的shell构建初始化脚本
./etc/ : 静态的应用配置文件(正常不会随意改动,改动后需要重启应用)
./var/ : 动态的应用数据文件(如:数据库的存放数据等)
./log/ : 应用日志记录信息
./www/ : 各应用共用的工作目录
./env : 环境全局配置,各镜像环境变量版本号等(一般为隐藏文件)
./docker-compose.yml 镜像应用编排文件(Docker Compose的核心)

#sync相关非linux内核系统需要了解及应用
./docker-compose.sync.yml 用于非linux内核系统的同步排编模式文件（macos,window系统如果不用该模式数据应用可能会有延迟）
./docker-sync.yml 非linux内核系统(macos,window)和docker之间的文件同步变快.(其中:compose-dev-file-path:指定docker-compose.sync.yml为核心docker compose)
./sync.sh 自动化的脚本(有4个指令: 启用:sync.sh up; 关闭: sync.sh down; 开启sync加速: sync.sh sync; 清除缓存: sync.sh clean)
./sync.md sync.sh的说明文件

2. 项目结构规范
2.1 项目目录: build,etc,var,log 对应的结构为 xx/应用名/版本号/ （如: ./build/nginx/1.22.1/)
2.2 各版本应用项目中如有特殊说明或经验总结加入对应的.md文件 xx/应用名/readme.md (如: redis配置文件说明, ./etc/redis/readme.md)
2.3 如指定版本有特殊性说明加入对应的.md文件 xx/应用名/版本号/readme.md

3. 除非有特殊需求,否则不需要改动.env