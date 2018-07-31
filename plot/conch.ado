*! 绘制一幅海螺图，差不多是极坐标系的柱形图
*! 程振兴 2018年7月15日
*!    clear
*!    input strL 国家 比例
*!    "中国" 100
*!    "美国" 50
*!    "日本" 70
*!    "俄罗斯" 80
*!    "印度" 90
*!    "德国" 60
*!    "英国" 40
*!    end
*!    conch 国家 比例, title(一个示例)
cap prog drop conch
prog define conch
	version 14.0
	syntax varlist(min = 2 max = 2) [, HTMLname(string) SCHeme(string) TItle(string) SUBTItle(string) Text(string)]
	cap preserve
	cap file close myfile 
	if "`htmlname'" == "" local htmlname = "fw_example"
	if "`scheme'" == "" local scheme = "dark"
	if "`title'" == "" local title = " "
	if "`subtitle'" == "" local subtitle = " "
	if "`text'" == "" local text = "%"
	qui{
		jscopy
		fw, s html(`htmlname')
		lib, b s(`scheme')
		tokenize `varlist'
		ren `1' name
		ren `2' num
		gsort -num
		tostring name num, replace
		replace name = "unknown" if name == "." 
		replace num = "0" if num == "" 
		fw `"var dataStyle = {"'
		fw `"    normal: {"'
		fw `"        label: {"'
		fw `"            show: false"'
		fw `"        },"'
		fw `"        labelLine: {"'
		fw `"            show: false"'
		fw `"        }}};"'
		fw `"var placeHolderStyle = {"'
		fw `"    normal: {"'
		fw `"        color: 'rgba(0,0,0,0)',"'
		fw `"        label: {"'
		fw `"            show: false"'
		fw `"        },"'
		fw `"        labelLine: {"'
		fw `"            show: false"'
		fw `"        }"'
		fw `"    },"'
		fw `"    emphasis: {"'
		fw `"        color: 'rgba(0,0,0,0)'"'
		fw `"    }"'
		fw `"};"'
		fw `"var data = ["'
		forval i = 1/`=_N'{
			local var = `"{"value": `=num[`i']', "name": "`=name[`i']'"},"'
			fw `"`var'"'
		}
		fw `"];"'
		fw `"var init_num = 5;"'
		fw `"var new_data = [];"'
		fw `"var data_name = [];"'
		fw `"for (var m in data) {"'
		fw `"    var arr = null;"'
		fw `"    arr = {"'
		fw `"        name: data[m]['name'],"'
		fw `"        type: 'pie',"'
		fw `"        clockWise: false,"'
		fw `"        radius: [init_num, init_num = init_num + 25],"'
		fw `"        center: ['50%', '50%'],"'
		fw `"        itemStyle: dataStyle,"'
		fw `"        textStyle: {"'
		fw `"            fontFamily: "微软雅黑","'
		fw `"            fontSize: '12px',"'
		fw `"            fontWeight: 'normal',"'
		fw `"        },"'
		fw `"        data: [{"'
		fw `"                value: data[m]['value'],"'
		fw `"                name: data[m]['name'] + ' ' + data[m]['value'] + '`text''"'
		fw `"            },"'
		fw `"            {   value: 100 - data[m]['value'],"'
		fw `"                name: 'invisible',"'
		fw `"                itemStyle: placeHolderStyle,"'
		fw `"                textStyle: {"'
		fw `"                    fontFamily: "微软雅黑","'
		fw `"                    fontSize: '12px',"'
		fw `"                    fontWeight: 'normal',"'
		fw `"                }}]}"'
		fw `"    new_data.push(arr)"'
		fw `"    data_name.unshift(data[m]['name'] + ' ' + data[m]['value'] + '`text'')"'
		fw `"}"'
		fw `"option = {"'
		fw `"    title: {"'
		fw `"        text:'`title'',"'
		fw `"        subtext:'`subtitle'',"'
		fw `"        left: '50%',"'
		fw `"        top:'50',"'
		fw `"        textAlign: 'center',"'
		fw `"        textStyle: {"'
		fw `"            fontWeight: 'normal',"'
		fw `"            fontFamily: '宋体'"'
		fw `"        }},"'
		fw `"    tooltip: {"'
		fw `"        show: true,"'
		fw `"        formatter: "{a} : {d}`text')","'
		fw `"        textStyle: {"'
		fw `"            fontWeight: 'normal',"'
		fw `"            fontFamily: '宋体'"'
		fw `"        }},"'
		fw `"    legend: {"'
		fw `"        orient: 'vertical',"'
		fw `"        left:'10%',"'
		fw `"        top: 120,"'
		fw `"        itemGap: 12,"'
		fw `"        data: data_name,"'
		fw `"        textStyle: {"'
		fw `"            fontFamily: "微软雅黑","'
		fw `"            fontSize: '12px',"'
		fw `"            fontWeight: 'normal',"'
		fw `"        }},"'
		fw `"    toolbox: {"'
		fw `"        show: true,"'
		fw `"        feature: {"'
		fw `"            mark: {"'
		fw `"                show: true"'
		fw `"            },"'
		fw `"            dataView: {"'
		fw `"                show: true,"'
		fw `"                readOnly: false"'
		fw `"            },"'
		fw `"            restore: {"'
		fw `"                show: true"'
		fw `"            },"'
		fw `"            saveAsImage: {"'
		fw `"                show: true"'
		fw `"            }"'
		fw `"        },"'
		fw `"        textStyle: {"'
		fw `"            fontFamily: "微软雅黑","'
		fw `"            fontSize: '12px',"'
		fw `"            fontWeight: 'normal',"'
		fw `"        }},"'
		fw `"    series: new_data"'
		fw `"};"'
		fw, e t
	}
	if "`htmlname'" !="" di `"点击{browse `htmlname'.html:`htmlname'.html}即可打开结果文件"'
	if "`htmlname'" =="" di `"点击{browse fw_example.html:fw_example.html}即可打开结果文件"'
	if "`c(os)'" == "MacOSX"{
		cap qui drm __MACOSX
	}
	if "`htmlname'" !="" copen `htmlname'.html
	if "`htmlname'" =="" copen fw_example.html
end
