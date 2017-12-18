#!/bin/bash
Green="\033[32m" && Yellow="\033[33m" && Red="\033[31m" && Blue="\033[36m" && Font_suffix="\033[0m"
Info="${Green}[Info]${Font_suffix}"
Error="${Red}[Error]${Font_suffix}"
echo -e "${Green}
#======================================
# Project: testspeed
# Version: 1.4.0
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
	[[ "${ISP}" == "1" && "${position}" == "1" ]] && city_11
	[[ "${ISP}" == "1" && "${position}" == "2" ]] && city_12

	[[ "${ISP}" == "2" && "${position}" == "1" ]] && city_21
	[[ "${ISP}" == "2" && "${position}" == "2" ]] && city_22

	[[ "${ISP}" == "3" && "${position}" == "1" ]] && city_31
	[[ "${ISP}" == "3" && "${position}" == "2" ]] && city_32
}
city_11(){
	echo -e "1.北京1\n2.北京2\n3.天津\n4.上海\n5.甘肃兰州\n6.河南郑州" && read -p "输入数字以选择:" city

#	while [[ ! "${city}" =~ ^[1-6]$ ]]
#		do
#			echo -e "${Error} 无效输入"
#			echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" city
#		done

}
city_12(){
	echo -e "1.湖北襄阳\n2.湖南长沙\n3.四川成都\n4.安徽合肥\n5.江西南昌1\n6.江西南昌2\n7.江苏苏州\n8.江苏南京\n9.云南昆明" && read -p "输入数字以选择:" city

#	while [[ ! "${city}" =~ ^[1-9]$ ]]
#		do
#			echo -e "${Error} 无效输入"
#			echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" city
#		done

}
city_21(){
	echo -e "1.辽宁沈阳\n2.上海\n3.北京\n4.天津\n5.重庆\n6.甘肃兰州\n7.河南郑州\n8.乌鲁木齐" && read -p "输入数字以选择:" city

#	while [[ ! "${city}" =~ ^[1-8]$ ]]
#		do
#			echo -e "${Error} 无效输入"
#			echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" city
#		done

}
city_22(){
	echo -e "1.湖北武汉\n2.安徽合肥\n3.江西南昌\n4.浙江杭州\n5.广西南宁\n6.海南海口" && read -p "输入数字以选择:" city

#	while [[ ! "${city}" =~ ^[1-6]$ ]]
#		do
#			echo -e "${Error} 无效输入"
#			echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" city
#		done

}
city_31(){
	echo -e "1.上海" && read -p "输入数字以选择:" city

#	while [[ "${city}" != "1" ]]
#		do
#			echo -e "${Error} 无效输入"
#			echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" city
#		done

}
city_32(){
	echo -e "1.四川成都\n2.安徽合肥\n3.江苏苏州\n4.江苏无锡\n5.浙江宁波\n6.云南昆明" && read -p "输入数字以选择:" city

#	while [[ ! "${city}" =~ ^[1-6]$ ]]
#		do
#			echo -e "${Error} 无效输入"
#			echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" city
#		done

}

set_id(){
	[[ "${ISP}" == "1" && "${position}" == "1" && "${city}" == "1" ]]   && id=4751  && city_name="北京1"
	[[ "${ISP}" == "1" && "${position}" == "1" && "${city}" == "2" ]]   && id=4589  && city_name="北京2"
	[[ "${ISP}" == "1" && "${position}" == "1" && "${city}" == "3" ]]   && id=6714  && city_name="天津"
	[[ "${ISP}" == "1" && "${position}" == "1" && "${city}" == "4" ]]   && id=3633  && city_name="上海"
	[[ "${ISP}" == "1" && "${position}" == "1" && "${city}" == "5" ]]   && id=3973  && city_name="甘肃兰州"
	[[ "${ISP}" == "1" && "${position}" == "1" && "${city}" == "6" ]]   && id=4595  && city_name="河南郑州"

	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "1" ]]   && id=6435  && city_name="湖北襄阳"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "2" ]]   && id=6132  && city_name="湖南长沙"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "3" ]]   && id=4624  && city_name="四川成都"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "4" ]]   && id=4433  && city_name="安徽合肥"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "5" ]]   && id=6345  && city_name="江西南昌1"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "6" ]]   && id=7643  && city_name="江西南昌2"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "7" ]]   && id=5274  && city_name="江苏苏州"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "8" ]]   && id=5316  && city_name="江苏南京"
	[[ "${ISP}" == "1" && "${position}" == "2" && "${city}" == "9" ]]   && id=6415  && city_name="云南昆明"


	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "1" ]]   && id=5017  && city_name="辽宁沈阳"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "2" ]]   && id=5083  && city_name="上海"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "3" ]]   && id=5145  && city_name="北京"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "4" ]]   && id=5475  && city_name="天津"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "5" ]]   && id=5726  && city_name="重庆"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "6" ]]   && id=4690  && city_name="甘肃兰州"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "7" ]]   && id=6810  && city_name="河南郑州"
	[[ "${ISP}" == "2" && "${position}" == "1" && "${city}" == "8" ]]   && id=6144  && city_name="乌鲁木齐"

	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "1" ]]   && id=5485  && city_name="湖北武汉"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "2" ]]   && id=5724  && city_name="安徽合肥"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "3" ]]   && id=7230  && city_name="江西南昌"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "4" ]]   && id=5300  && city_name="浙江杭州"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "5" ]]   && id=5674  && city_name="广西南宁"
	[[ "${ISP}" == "2" && "${position}" == "2" && "${city}" == "6" ]]   && id=5985  && city_name="海南海口"


	[[ "${ISP}" == "3" && "${position}" == "1" && "${city}" == "1" ]]   && id=4665  && city_name="上海"

	[[ "${ISP}" == "3" && "${position}" == "2" && "${city}" == "1" ]]   && id=4575  && city_name="四川成都"
	[[ "${ISP}" == "3" && "${position}" == "2" && "${city}" == "2" ]]   && id=4377  && city_name="安徽合肥"
	[[ "${ISP}" == "3" && "${position}" == "2" && "${city}" == "3" ]]   && id=3927  && city_name="江苏苏州"
	[[ "${ISP}" == "3" && "${position}" == "2" && "${city}" == "4" ]]   && id=5122  && city_name="江苏无锡"
	[[ "${ISP}" == "3" && "${position}" == "2" && "${city}" == "5" ]]   && id=6715  && city_name="浙江宁波"
	[[ "${ISP}" == "3" && "${position}" == "2" && "${city}" == "6" ]]   && id=5892  && city_name="云南昆明"
}

install(){
	[[ ! -f speedtest.py ]] && wget https://raw.githubusercontent.com/nanqinlang/testspeed/master/speedtest.py
	[[ ! -f speedtest.py ]] && echo -e "${Error} download failed, please check!" && exit 1
	chmod 7777 speedtest.py
}


info(){
	 upload=`echo "${testinfo}" | awk -F ':' '/Upload/{print $2}'`
	latency=`echo "${testinfo}" | awk -F ':' '/Hosted/{print $2}'`
	date=`date +%Y-%m-%d" "%H:%M:%S`
}



test_single(){
	select_ISP
	set_ISP_name
	select_position
	select_city
	set_id
	ISP_single
}
ISP_single(){
	testinfo=`python speedtest.py --server ${id}`
	download=`echo "${testinfo}" | awk -F ':' '/Download/{print $2}'`
	if [[ -n "${download}" ]]; then
		info && hostedby=`echo "${testinfo}" | awk -F ':' '/Hosted/{print $1}'`
		result_single | tee -a -i testspeed.log 2>/dev/null
	else
		echo -e "${Error} 测试失败，可能当前选择节点不可用，请更换其他节点，或稍后再测试该节点"
	fi
	repeat_test_single
}
result_single(){
	echo -e "${Info} ${hostedby}"
	echo -e "${Info} 上传 : ${upload}"
	echo -e "${Info} 下载 : ${download}"
	echo -e "${Info} 延迟 : ${latency}"
	echo -e "${Info} 测试时间 :  ${date}"
	echo -e "${Info} 测试速度 到 ${city_name}${ISP_name} 完成"
}
repeat_test_single(){
	echo -e "${Info} 是否继续测试其他节点?"
	echo -e "1.是\n2.否"
	read -p "请选择:" whether_repeat_single
	while [[ ! "${whether_repeat_single}" =~ ^[1-2]$ ]]
		do
			echo -e "${Error} 无效输入"
			echo -e "${Info} 请重新输入" && read -p "请选择:" whether_repeat_single
		done
	[[ "${whether_repeat_single}" == "1" ]] && test_single
	[[ "${whether_repeat_single}" == "2" ]] && echo -e "${Info} 退出脚本 ..." && exit 0
}



test_all(){
	ISP_all | tee -a -i testspeed.log 2>/dev/null
}
ISP_all(){
	echo -e "${Info} 开始 三网快速测试 ..."
	printf "%-14s%-18s%-20s%-12s\n" "ISP Name" "Upload Speed" "Download Speed" "Latency"

	result_all '3633' '上海电信'
	result_all '12637' '襄阳电信'
	result_all '4624' '成都电信'
	result_all '5081' '深圳电信'

	result_all '5083' '上海联通'
	result_all '5726' '重庆联通'
	result_all '5485' '武汉联通'
	result_all '7230' '南昌联通'

	result_all '4665' '上海移动'
	result_all '4575' '成都移动'
	result_all '3927' '苏州移动'
	result_all '6715' '宁波移动'

	echo -e "${Info} 测试时间: ${date}"
	echo -e "${Info} 三网测试完成 ！"
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



	echo -e "${Info} 选择你要使用的功能: "
	echo -e "1.指定一个节点测试\n2.三网快速测试"
	read -p "输入数字以选择:" function

	while [[ ! "${function}" =~ ^[1-2]$ ]]
		do
			echo -e "${Error} 缺少或无效输入"
			echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" function
		done

	check_root
	directory
	install

	if [[ "${function}" == "1" ]]; then
		test_single
	else
		test_all
	fi
