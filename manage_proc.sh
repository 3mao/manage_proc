#!/bin/sh

	#该程序为了监控进程是否存在，如果不存在则重启进程
	#命令格式：
	#	monitor_proces.sh  'future'  'dir'
	#参数说明：
	#	future	为进程匹配的grep特征
	#	dir	为进程重启的命令

#set -x
PROG=$0
TIM=$(date  '+%Y-%m-%d %H:%M:%OS')
LOGFILE=$HOME/common/log/manage_proc_$(date  '+%Y%m%d').log

exec 5>&1
exec 1>>${LOGFILE}
exec 2>&1

USAGE(){
	echo "	usage:"
	echo "		$0 dir "
}
	[ $# -lt 1 ] && USAGE && exit 1

prostatus(){

	num=$( ps -ef|grep  "$*"|grep  -v grep|grep  -v ${PROG}|wc -l)
	echo "$num"
}



	until [ $# -eq 0 ]
	do
	future=$1
	dir=$2
	shift 2
	re=$(prostatus ${future})

	[ $re -eq 0 ] &&  echo "[${TIM}] ${dir} of process is died!"
	[ $re -eq 1 ] &&  echo "[${TIM}] ${dir} of process exists " && continue
	[ $re -eq 0 ] && ./run.sh

	re=$(prostatus ${future})

	[ $re -eq 0 ] &&  echo "[${TIM}] ${dir} of process is died!"
	[ $re -eq 1 ] &&  echo "[${TIM}] ${dir} of process exists "
	[ $re -eq 0 ] && ./run.sh

	re=$(prostatus ${future})
	[ $re -eq 0 ] &&  echo "[${TIM}] ${dir} of process restart failed"

	done


exec 1>&5
exec 5>&-
