# 进程管理工具

>该程序为了监控进程是否存在，如果不存在则重启进程

## 命令格式：
>  monitor_proces.sh  'future'  'dir'


## 参数说明：
*       future  为进程匹配的grep特征
*       dir     为进程重启的命令
## 功能说明：
*     程序接收 future1 dir1  future2 dir2格式的参数
*     如果根据特征匹配不到进程，则会进入目录中执行启动脚本
*     启动脚本统一命名为run.sh
