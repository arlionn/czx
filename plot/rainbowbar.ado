*! 绘制彩虹色柱条图
*! 程振兴 2018年7月14日
*! sysuse auto, clear
*! rainbowbar rep78, html(temp1) ti(汽车维修次数柱形图) text1(维修次数)
*!     text2(样本数) bargap(20)
*! sysuse auto, clear
*! contract rep78
*! rainbowbar rep78 _freq, html(temp2) ti(汽车维修次数柱形图) text1(维修次数) text2(样本数) bargap(10)
cap prog drop rainbowbar
prog define rainbowbar
	version 14.0
	syntax varlist(max = 2) [, SORT HTMLname(string) TItle(string) TEXT1(string) TEXT2(string) BARGAP(string)]
	cap preserve
	cap file close myfile 
	if "`htmlname'" == "" local htmlname = "fw_example"
	if "`title'" == "" local title = "标题"
	if "`text1'" == "" local text1 = "文本"
	if "`text2'" == "" local text2 = "文本"
	if "bargap" == "" local bargap = "0.01"
	qui{
		local number: word count `varlist'
		if `number' == 1{
			contract `varlist'
			ren _freq num
			sum num
			local max = r(max)*1.1
			local min = r(min)
			if "`sort'" != "" gsort num
			tostring `varlist' num, replace
			replace `varlist' = "unknown" if `varlist' == "." 
			replace num = "0" if num == "" 
			jscopy
			fw, s h(`htmlname')
			lib, b
			fw `"var value = ["'
			forval i = 1/`=_N'{
				local var = `"`=num[`i']',"'
				fw `"`var'"'
			}
			fw `"];"'
			fw `"option = {"'
			fw `"    backgroundColor: '#333',"'
			fw `"    title: {"'
			fw `"        text: '`title'',"'
			fw `"        x: 'center',"'
			fw `"        y: '10',"'
			fw `"        textStyle: {"'
			fw `"            color: '#fff'"'
			fw `"        }"'
			fw `"    },"'
			fw `"toolbox: {"'
			fw `"    show: true,"'
			fw `"    feature: {"'
			fw `"        dataView: {show: true, readOnly: false},"'
			fw `"        restore: {show: true},"'
			fw `"        saveAsImage: {show: true}"'
			fw `"    }"'
			fw `"},"'
			fw `"    tooltip: {"'
			fw `"        trigger: 'item'"'
			fw `"    },"'
			fw `"    dataRange: {"'
			fw `"        show: false,"'
			fw `"        min : `min',"'
			fw `"        max : `max',"'
			fw `"        calculable : true,"'
			fw `"        color: ['#d94e5d','#eac736','#50a3ba'],"'
			fw `"         y:'center',"'
			fw `"    },"'
			fw `" "'
			fw `"    xAxis: ["'
			fw `"        {"'
			fw `"            type: 'category',"'
			fw `"            show: false,"'
			fw `"            data: ["'
			ren `varlist' name
			forval i = 1/`=_N'{
				local var = `"'`=name[`i']'', "'
				fw `"`var'"'
			}
			fw `"            ]"'
			fw `"        }"'
			fw `"    ],"'
			fw `"    yAxis: ["'
			fw `"        {"'
			fw `"            type: 'value',"'
			fw `"            show: false"'
			fw `"        }"'
			fw `"    ],"'
			fw `"    series: ["'
			fw `"        {"'
			fw `"            name: 'num',"'
			fw `"            type: 'bar',"'
			fw `"            barGap: 0.1,"'
			fw `"            barCategoryGap: `bargap',"'
			fw `"            itemStyle: {"'
			fw `"                normal: {"'
			fw `"                    color: function(params) {"'
			fw `"                        // 在这个可以设计你的colormap."'
			fw `"                        var colorList = ["'
			fw `"                          '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B', '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD', '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'"'
			fw `"                        ];"'
			fw `"                        return colorList[params.dataIndex]"'
			fw `"                    },"'
			fw `"                    label: {"'
			fw `"                        show: true,"'
			fw `"                        position: 'bottom',"'
			fw `"                        formatter: '`text1'：{b}\n`text2'：{c}',"'
			fw `"                        fontSize: 14"'
			fw `"                    },"'
			fw `"                    shadowBlur: 80,"'
			fw `"                    shadowColor: 'rgba(0, 0, 0, 0.5)'"'
			fw `"                }"'
			fw `"            },"'
			fw `"            data: value.map(function (a, idx) {"'
			fw `"                return a;"'
			fw `"            })"'
			fw `"        }"'
			fw `"    ]"'
			fw `"};"'
			fw, e t
		}
		if `number' == 2{
			jscopy
			fw, s html(`htmlname')
			lib, b 
			tokenize `varlist'
			ren `1' name
			ren `2' num
			if "`sort'" != "" gsort num
			sum num
			local max = r(max)*1.1
			local min = r(min)
			tostring name num, replace
			replace name = "unknown" if name == "." 
			replace num = "0" if num == "" 
			fw `"var value = ["'
			forval i = 1/`=_N'{
				local var = `"`=num[`i']',"'
				fw `"`var'"'
			}
			fw `"];"'
			fw `"option = {"'
			fw `"    backgroundColor: '#333',"'
			fw `"    title: {"'
			fw `"        text: '`title'',"'
			fw `"        x: 'center',"'
			fw `"        y: '10',"'
			fw `"        textStyle: {"'
			fw `"            color: '#fff'"'
			fw `"        }"'
			fw `"    },"'
			fw `"toolbox: {"'
			fw `"    show: true,"'
			fw `"    feature: {"'
			fw `"        dataView: {show: true, readOnly: false},"'
			fw `"        restore: {show: true},"'
			fw `"        saveAsImage: {show: true}"'
			fw `"    }"'
			fw `"},"'
			fw `"    tooltip: {"'
			fw `"        trigger: 'item'"'
			fw `"    },"'
			fw `"    dataRange: {"'
			fw `"        show: false,"'
			fw `"        min : `min',"'
			fw `"        max : `max',"'
			fw `"        calculable : true,"'
			fw `"        color: ['#d94e5d','#eac736','#50a3ba'],"'
			fw `"         y:'center',"'
			fw `"    },"'
			fw `" "'
			fw `"    xAxis: ["'
			fw `"        {"'
			fw `"            type: 'category',"'
			fw `"            show: false,"'
			fw `"            data: ["'
			forval i = 1/`=_N'{
				local var = `"'`=name[`i']'', "'
				fw `"`var'"'
			}
			fw `"            ]"'
			fw `"        }"'
			fw `"    ],"'
			fw `"    yAxis: ["'
			fw `"        {"'
			fw `"            type: 'value',"'
			fw `"            show: false"'
			fw `"        }"'
			fw `"    ],"'
			fw `"    series: ["'
			fw `"        {"'
			fw `"            name: 'num',"'
			fw `"            type: 'bar',"'
			fw `"            barGap: 0.1,"'
			fw `"            barCategoryGap: `bargap',"'
			fw `"            itemStyle: {"'
			fw `"                normal: {"'
			fw `"                    color: function(params) {"'
			fw `"                        // build a color map as your need."'
			fw `"                        var colorList = ["'
			fw `"                          '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B', '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD', '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'"'
			fw `"                        ];"'
			fw `"                        return colorList[params.dataIndex]"'
			fw `"                    },"'
			fw `"                    label: {"'
			fw `"                        show: true,"'
			fw `"                        position: 'bottom',"'
			fw `"                        formatter: '`text1'：{b}\n`text2'：{c}',"'
			fw `"                        fontSize: 14"'
			fw `"                    },"'
			fw `"                    shadowBlur: 80,"'
			fw `"                    shadowColor: 'rgba(0, 0, 0, 0.5)'"'
			fw `"                }"'
			fw `"            },"'
			fw `"            data: value.map(function (a, idx) {"'
			fw `"                return a;"'
			fw `"            })"'
			fw `"        }"'
			fw `"    ]"'
			fw `"};"'
			fw, e t
		}
	}
	if "`htmlname'" !="" di `"点击{browse `htmlname'.html:`htmlname'.html}即可打开结果文件"'
	if "`htmlname'" =="" di `"点击{browse fw_example.html:fw_example.html}即可打开结果文件"'
	if "`c(os)'" == "MacOSX"{
		cap qui drm __MACOSX
	}
	if "`htmlname'" !="" copen `htmlname'.html
	if "`htmlname'" =="" copen fw_example.html
end

