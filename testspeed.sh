#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
Green_font="\033[32m" && Yellow_font="\033[33m" && Red_font="\033[31m" && Blue_font="\033[36m" && Font_suffix="\033[0m"
Info="${Green_font}[Info]${Font_suffix}"
Error="${Red_font}[Error]${Font_suffix}"
echo -e "${Green_font}
#======================================
# Project: testspeed
# Version: 1.0
# Author: nanqinlang
# Blog:   https://www.nanqinlang.com
# Github: https://github.com/nanqinlang
#======================================${Font_suffix}"


check_root(){
	if [[ "`id -u`" = "0" ]]; then
	echo -e "${Info} user is root"
	else echo -e "${Error} must be root user" && exit 1
	fi
}

directory(){
	[[ ! -d /home/testspeed ]] && mkdir -p /home/testspeed
	cd /home/testspeed
}


select_ISP(){
	echo -e "${Info} 选择需要测速的目标网络: \n1.中国电信\n2.中国联通\n3.中国移动"
	read -p "输入数字以选择:" ISP

	while [[ ! "${ISP}" =~ ^[1-3]$ ]]
		do
			echo -e "${Error} 无效输入"
			echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" ISP
		done
}

set_ISP_name(){
	[[ "${ISP}" == "1" ]] && ISP_name="电信"
	[[ "${ISP}" == "2" ]] && ISP_name="联通"
	[[ "${ISP}" == "3" ]] && ISP_name="移动"
}

select_position(){
	echo -e "${Info} 选择你的方位: \n1.北方\n2.南方"
	read -p "输入数字以选择:" position

	while [[ ! "${position}" =~ ^[1-2]$ ]]
		do
			echo -e "${Error} 无效输入"
			echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" position
		done
}

select_city(){
	echo -e "${Info} 选择最靠近你的城市:"
	[[ "${ISP}" == "1" && "${position}" == "1" ]] && echo -e "1.上海\n2.重庆\n3.河南郑州\n4.湖北襄阳" && read -p "输入数字以选择:" city
	[[ "${ISP}" == "1" && "${position}" == "2" ]] && echo -e "1.湖南长沙\n2.福建福州\n3.广西南宁\n4.广东深圳" && read -p "输入数字以选择:" city

	[[ "${ISP}" == "2" && "${position}" == "1" ]] && echo -e "1.黑龙江沈阳\n2.北京\n3.重庆\n4.陕西西安\n5.河南郑州\n6.山西太原" && read -p "输入数字以选择:" city
	[[ "${ISP}" == "2" && "${position}" == "2" ]] && echo -e "1.湖南长沙\n2.安徽合肥\n3.江西南昌\n4.云南昆明\n5.广西南宁\n6.广东广州" && read -p "输入数字以选择:" city
	
	[[ "${ISP}" == "3" && "${position}" == "1" ]] && echo -e "1.上海\n2.陕西西安" && read -p "输入数字以选择:" city
	[[ "${ISP}" == "3" && "${position}" == "2" ]] && echo -e "1.安徽合肥\n2.四川成都\n3.江苏无锡\n4.浙江杭州" && read -p "输入数字以选择:" city

	while [[ ! "${city}" =~ ^[1-6]$ ]]
		do
			echo -e "${Error} 无效输入"
			echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" city
		done
}

set_id(){
	[[ "${ISP}" == "1" && "${position}" == "1" && "${city}" == "1" ]] && id=3633  && city_name="上海"
	[[ "${ISP}" == "1" && "${position}" == "1" && "${city}" == "2" ]] && id=6592  && city_name="重庆"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "3" ]] && id=4595  && city_name="河南郑州"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "4" ]] && id=6435  && city_name="湖北襄阳"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "1" ]] && id=6132  && city_name="湖南长沙"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "2" ]] && id=5805  && city_name="福建福州"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "3" ]] && id=10305 && city_name="广西南宁"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "4" ]] && id=5081  && city_name="广东深圳"

	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "1" ]] && id=5017  && city_name="黑龙江沈阳"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "2" ]] && id=5145  && city_name="北京"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "3" ]] && id=5726  && city_name="重庆"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "4" ]] && id=4863  && city_name="陕西西安"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "5" ]] && id=5131  && city_name="河南郑州"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "6" ]] && id=12868 && city_name="山西太原"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "1" ]] && id=4870  && city_name="湖南长沙"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "2" ]] && id=5724  && city_name="安徽合肥"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "3" ]] && id=5079  && city_name="江西南昌"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "4" ]] && id=5103  && city_name="云南昆明"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "5" ]] && id=5674  && city_name="广西南宁"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "6" ]] && id=3891  && city_name="广东广州"

	[[ "${ISP}" == "3" && "${position}" == "1" && "${city}" == "1" ]] && id=4665  && city_name="上海"
	[[ "${ISP}" == "3" && "${position}" == "2" && "${city}" == "2" ]] && id=5292  && city_name="陕西西安"
	[[ "${ISP}" == "3" && "${position}" == "2" && "${city}" == "1" ]] && id=4377  && city_name="安徽合肥"
	[[ "${ISP}" == "3" && "${position}" == "2" && "${city}" == "2" ]] && id=4575  && city_name="四川成都"
	[[ "${ISP}" == "3" && "${position}" == "2" && "${city}" == "3" ]] && id=5122  && city_name="江苏无锡"
	[[ "${ISP}" == "3" && "${position}" == "2" && "${city}" == "4" ]] && id=4647  && city_name="浙江杭州"
}

install(){
	[[ ! -e speedtest.py ]] && wget https://raw.github.com/sivel/speedtest-cli/master/speedtest.py
	[[ ! -e speedtest.py ]] && echo -e "${Error} download failed, please check!" && exit 1
	chmod 7777 speedtest.py
}

result(){
	hostedby=`cat testspeed.log | awk -F ':' '/Hosted/{print $1}'`
	upload=`cat testspeed.log | awk -F ':' '/Upload/{print $2}'`
	download=`cat testspeed.log | awk -F ':' '/Download/{print $2}'`
	latency=`cat testspeed.log | awk -F ':' '/Hosted/{print $2}'`
	date=`date +%Y-%m-%d" "%H:%M:%S`
	echo -e "${Info} ${hostedby}"
	echo -e "${Info} 上传  : ${upload}"
	echo -e "${Info} 下载  : ${download}"
	echo -e "${Info} 延迟  : ${latency}"
	echo -e "${Info} 时间  :  ${date}"
}
ISP_single(){
	if [[ "${ISP}" =~ ^[1-3]$ ]]; then
		python speedtest.py --server ${id} --share 2>/dev/null | tee testspeed.log 2>/dev/null
		download=`cat testspeed.log | grep 'Download'`

		if [[ -n "${download}" ]]; then
			result
			echo -e "${Info} 测试到  ${city_name}${ISP_name} 完成 ！"
		else
			echo -e "${Error} 测试失败，可能当前选择节点不可用，请更换其他节点，或稍后再测试"
		fi
	fi
}


speed_test(){
	temp=`python speedtest.py --server $1 --share 2>&1`
	download=`echo "${temp}" | grep 'Download'`
	if [[ -n "${download}" ]]; then
		local reupload=`echo "${temp}" | awk -F ':' '/Upload/{print $2}'`
		local redownload=`echo "${temp}" | awk -F ':' '/Download/{print $2}'`
		local relatency=`echo "${temp}" | awk -F ':' '/Hosted/{print $2}'`
		retemp=`echo "${relatency}" | awk -F '.' '{print $1}'`
		[[ "${retemp}" -gt 1000 ]] && relatency=" 000.000 ms"
		local ISPname=$2
		printf "%-17s%-18s%-20s%-12s\n" "${ISPname}" "${reupload}" "${redownload}" "${relatency}"
	else
		local cerror="ERROR"
	fi
}
ISP_all(){
	printf "%-14s%-18s%-20s%-12s\n" "ISP Name" "Upload Speed" "Download Speed" "Latency"
	speed_test '3633'  '上海电信'
	speed_test '6592'  '重庆电信'
	speed_test '6132'  '长沙电信'
	speed_test '5081'  '深圳电信'

	speed_test '5017'  '沈阳联通'
	speed_test '5131'  '郑州联通'
	speed_test '5079'  '南昌联通'
	speed_test '3891'  '广州联通'

	speed_test '4665'  '上海移动'
	speed_test '5192'  '西安移动'
	speed_test '4575'  '成都移动'
	speed_test '4647'  '杭州移动'

	echo -e "${Info} 三网测试完成 ！"
}


test_single(){
	check_root
	directory
	install
	select_ISP
	set_ISP_name
	select_position
	select_city
	set_id
	ISP_single
}

test_all(){
	check_root
	directory
	install
	ISP_all | tee testspeed.log 2>/dev/null
}

echo -e "${Info} 选择你要使用的功能: "
echo -e "1.指定一个节点测试\n2.三网快速测试\n3.退出脚本"
read -p "输入数字以选择:" function
	if [[ "${function}" == "1" ]]; then
		test_single
	elif [[ "${function}" == "2" ]]; then
		test_all
	elif [[ "${function}" == "3" ]]; then
		echo -e "${Info} you choose quit, exiting ..." && exit 0
	else
		echo -e "${Error} no or invaild input, exiting ..." && exit 1
	fi
