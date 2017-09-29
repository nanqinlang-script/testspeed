#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
Green_font="\033[32m" && Yellow_font="\033[33m" && Red_font="\033[31m" && Blue_font="\033[36m" && Font_suffix="\033[0m"
Info="${Green_font}[Info]${Font_suffix}"
Error="${Red_font}[Error]${Font_suffix}"
echo -e "${Green_font}
#======================================
# Project: testspeed
# Version: 1.1
# Author: nanqinlang
# Blog:   https://www.nanqinlang.com
# Github: https://github.com/nanqinlang
#======================================${Font_suffix}"


check_root(){
	[[ "`id -u`" != "0" ]] && echo -e "${Error} must be root user" && exit 1
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
	[[ "${ISP}" == "1" && "${position}" == "1" ]] && city_1
	[[ "${ISP}" == "1" && "${position}" == "2" ]] && city_2

	[[ "${ISP}" == "2" && "${position}" == "1" ]] && city_3
	[[ "${ISP}" == "2" && "${position}" == "2" ]] && city_4

	[[ "${ISP}" == "3" && "${position}" == "1" ]] && city_5
	[[ "${ISP}" == "3" && "${position}" == "2" ]] && city_6
}
city_1(){
	echo -e "1.北京\n2.上海\n3.重庆\n4.河南郑州\n5.湖北襄阳" && read -p "输入数字以选择:" city
#	while [[ ! "${city}" =~ ^[1-5]$ ]]
#		do
#			echo -e "${Error} 无效输入"
#			echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" city
#		done
}
city_2(){
	echo -e "1.湖南长沙\n2.四川成都\n3.江苏苏州\n4.江苏徐州\n5.江苏南京\n6.江西南昌\n7.福建福州\n8.云南昆明\n9.广西南宁\n10.广东深圳" && read -p "输入数字以选择:" city
#	while [[ ! "${city}" =~ ^[1-10]$ ]]
#		do
#			echo -e "${Error} 无效输入"
#			echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" city
#		done
}
city_3(){
	echo -e "1.黑龙江哈尔滨\n2.吉林长春\n3.上海\n4.北京\n5.天津\n6.重庆\n7.陕西西安\n8.甘肃兰州\n9.山东济南\n10.山西太原\n11.河南郑州" && read -p "输入数字以选择:" city
#	while [[ ! "${city}" =~ ^[1-11]$ ]]
#		do
#			echo -e "${Error} 无效输入"
#			echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" city
#		done
}
city_4(){
	echo -e "1.湖南长沙\n2.四川成都\n3.安徽合肥\n4.江西南昌\n5.江苏南京\n6.浙江杭州\n7.云南昆明\n8.广西南宁\n9.福建厦门\n10.西藏拉萨" && read -p "输入数字以选择:" city
#	while [[ ! "${city}" =~ ^[1-10]$ ]]
#		do
#			echo -e "${Error} 无效输入"
#			echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" city
#		done
}
city_5(){
	echo -e "1.上海\n2.陕西西安" && read -p "输入数字以选择:" city
#	while [[ ! "${city}" =~ ^[1-2]$ ]]
#		do
#			echo -e "${Error} 无效输入"
#			echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" city
#		done
}
city_6(){
	echo -e "1.四川成都\n2.安徽合肥\n3.江苏苏州\n4.江苏无锡\n5.浙江宁波\n6.浙江杭州" && read -p "输入数字以选择:" city
#	while [[ ! "${city}" =~ ^[1-6]$ ]]
#		do
#			echo -e "${Error} 无效输入"
#			echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" city
#		done
}

set_id(){
	[[ "${ISP}" == "1" && "${position}" == "1" && "${city}" == "1" ]]  && id=4751  && city_name="北京"
	[[ "${ISP}" == "1" && "${position}" == "1" && "${city}" == "2" ]]  && id=3633  && city_name="上海"
	[[ "${ISP}" == "1" && "${position}" == "1" && "${city}" == "3" ]]  && id=6592  && city_name="重庆"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "4" ]]  && id=4595  && city_name="河南郑州"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "5" ]]  && id=6435  && city_name="湖北襄阳"

	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "1" ]]  && id=6132  && city_name="湖南长沙"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "2" ]]  && id=4624  && city_name="四川成都"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "3" ]]  && id=7643  && city_name="江西南昌"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "4" ]]  && id=5396  && city_name="江苏苏州"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "5" ]]  && id=5324  && city_name="江苏徐州"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "6" ]]  && id=5316  && city_name="江苏南京"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "7" ]]  && id=5805  && city_name="福建福州"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "8" ]]  && id=6168  && city_name="云南昆明"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "9" ]]  && id=10305 && city_name="广西南宁"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "10" ]] && id=5081  && city_name="广东深圳"


	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "1" ]]  && id=5460  && city_name="黑龙江哈尔滨"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "2" ]]  && id=9484  && city_name="吉林长春"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "3" ]]  && id=5083  && city_name="上海"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "4" ]]  && id=5145  && city_name="北京"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "5" ]]  && id=5475  && city_name="天津"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "6" ]]  && id=5726  && city_name="重庆"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "7" ]]  && id=4863  && city_name="陕西西安"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "8" ]]  && id=4690  && city_name="甘肃兰州"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "9" ]]  && id=5039  && city_name="山东济南"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "10" ]] && id=12868 && city_name="山西太原"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "11" ]] && id=5131  && city_name="河南郑州"

	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "1" ]]  && id=4870  && city_name="湖南长沙"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "2" ]]  && id=2461  && city_name="四川成都"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "3" ]]  && id=5724  && city_name="安徽合肥"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "4" ]]  && id=7230  && city_name="江西南昌"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "5" ]]  && id=5446  && city_name="江苏南京"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "6" ]]  && id=5300  && city_name="浙江杭州"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "7" ]]  && id=5103  && city_name="云南昆明"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "8" ]]  && id=5674  && city_name="广西南宁"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "9" ]]  && id=5506  && city_name="福建厦门"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "10" ]] && id=5750  && city_name="西藏拉萨"


	[[ "${ISP}" == "3" && "${position}" == "1" && "${city}" == "1" ]]  && id=4665  && city_name="上海"
	[[ "${ISP}" == "3" && "${position}" == "1" && "${city}" == "2" ]]  && id=5292  && city_name="陕西西安"

	[[ "${ISP}" == "3" && "${position}" == "2" && "${city}" == "1" ]]  && id=4575  && city_name="四川成都"
	[[ "${ISP}" == "3" && "${position}" == "2" && "${city}" == "2" ]]  && id=4377  && city_name="安徽合肥"
	[[ "${ISP}" == "3" && "${position}" == "2" && "${city}" == "3" ]]  && id=3927  && city_name="江苏苏州"
	[[ "${ISP}" == "3" && "${position}" == "2" && "${city}" == "4" ]]  && id=5122  && city_name="江苏无锡"
	[[ "${ISP}" == "3" && "${position}" == "2" && "${city}" == "5" ]]  && id=6715  && city_name="浙江宁波"
	[[ "${ISP}" == "3" && "${position}" == "2" && "${city}" == "6" ]]  && id=4647  && city_name="浙江杭州"
}


install(){
	[[ ! -e speedtest.py ]] && wget https://raw.githubusercontent.com/nanqinlang/testspeed/master/speedtest.py
	[[ ! -e speedtest.py ]] && echo -e "${Error} download failed, please check!" && exit 1
	chmod 7777 speedtest.py
}


result_single(){
	echo -e "${Info} ${hostedby}"
	echo -e "${Info} 上传 : ${upload}"
	echo -e "${Info} 下载 : ${download}"
	echo -e "${Info} 延迟 : ${latency}"
	echo -e "${Info} 测试时间 :  ${date}"
	echo -e "${Info} 测试速度 到 ${city_name}${ISP_name} 完成"
}
info(){
	upload=`echo "${testinfo}" | awk -F ':' '/Upload/{print $2}'`
	latency=`echo "${testinfo}" | awk -F ':' '/Hosted/{print $2}'`
	date=`date +%Y-%m-%d" "%H:%M:%S`
}
ISP_single(){
	testinfo=`python speedtest.py --server ${id}`
	download=`echo "${testinfo}" | awk -F ':' '/Download/{print $2}'`
	if [[ -n "${download}" ]]; then
		info && hostedby=`echo "${testinfo}" | awk -F ':' '/Hosted/{print $1}'`
		result_single | tee testspeed.log 2>/dev/null
	else
		echo -e "${Error} 测试失败，可能当前选择节点不可用，请更换其他节点，或稍后再测试该节点"
	fi
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


result_all(){
	testinfo=`python speedtest.py --server $1`
	ISP_name=$2
	download=`echo "${testinfo}" | awk -F ':' '/Download/{print $2}'`
	if [[ -n "${download}" ]]; then
		info
		printf "%-17s%-18s%-20s%-12s\n" "${ISP_name}" "${upload}" "${download}" "${latency}"
	else
		echo -e "${Error} ${ISP_name} 测试失败，可能是此节点现不可用"
		echo -e "${Info} 继续测试下一节点 ..."
	fi
}
ISP_all(){
	printf "%-14s%-18s%-20s%-12s\n" "ISP Name" "Upload Speed" "Download Speed" "Latency"
	result_all '3633' '上海电信'
	result_all '6592' '重庆电信'
	result_all '6132' '长沙电信'
	result_all '5081' '深圳电信'
	result_all '9484' '长春联通'
	result_all '5131' '郑州联通'
	result_all '7230' '南昌联通'
	result_all '5506' '厦门联通'
	result_all '4665' '上海移动'
	result_all '5192' '西安移动'
	result_all '4575' '成都移动'
	result_all '4647' '杭州移动'
	echo -e "${Info} 测试时间: ${date}"
	echo -e "${Info} 三网测试完成 ！"
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
		echo -e "${Info} 你选择了退出脚本 ..." && exit 0
	else
		repeat_choose
	fi

repeat_choose(){
	while [[ ! "${function}" =~ ^[1-3]$ ]]
		do
			echo -e "${Error} 缺少或无效输入"
			echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" city
		done
}