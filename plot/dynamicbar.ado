*! 绘制可伸缩的柱形图
*! 程振兴 2018年7月13日
*! ========================================= !*
*! sysuse auto, clear
*! dynamicbar rep78
*! dynamicbar rep78, sch(macarons)
*! sysuse auto, clear
*! contract rep78
*! dynamicbar rep78 _freq
*! ========================================= !*
cap prog drop dynamicbar
prog define dynamicbar
	version 14.0
	syntax varlist(max = 2) [, SORT HTMLname(string) SCHeme(string)]
	cap preserve
	cap file close myfile 
	if "`htmlname'" == "" local htmlname = "fw_example"
	if "`scheme'" == "" local scheme = "dark"
	qui{
		local number: word count `varlist'
		if `number' == 1{
			contract `varlist'
			ren _freq num
			if "`sort'" != "" gsort num
			tostring `varlist' num, replace
			replace `varlist' = "unknown" if `varlist' == "." 
			replace num = "0" if num == "" 
			jscopy
			fw, s h(`htmlname')
			lib, b s(`scheme')
			fw `"var option = {"'
			fw `"    grid: {"'
			fw `"        left: '9%',"'
			fw `"        right: '5%',"'
			fw `"        bottom: '6%',"'
			fw `"        top: '4%',"'
			fw `"        containLabel: true"'
			fw `"    },"'
			fw `"    xAxis: [{"'
			fw `"        type: 'category',"'
			fw `"        data: ["'
			ren `varlist' name
			forval i = 1/`=_N'{
			  local var = `"'`=name[`i']'', "'
			  fw `"`var'"'
			}
			fw `"        ],"'
			fw `"        axisTick: {"'
			fw `"            alignWithLabel: true,"'
			fw `"            show: false"'
			fw `"        },"'
			fw `"        axisLine: {"'
			fw `"            show: false"'
			fw `"        },"'
			fw `"        axisLabel: {"'
			fw `"            fontSize: 12"'
			fw `"        },"'
			fw `"        interval: 1,"'
			fw `"    }],"'
			fw `"    yAxis: [{"'
			fw `"        type: 'value',"'
			fw `"        offset: 30,"'
			fw `"        axisLine: {"'
			fw `"            show: false,"'
			fw `"        },"'
			fw `"        axisLabel: {"'
			fw `"            inside: true,"'
			fw `"            margin:4,"'
			fw `"        },"'
			fw `"        splitLine: false"'
			fw `"    }],"'
			fw `"    dataZoom: [{"'
			fw `"        type: 'inside',"'
			fw `"        filterMode: 'none',"'
			fw `"        startValue: 0,"'
			fw `"        endValue: 7,"'
			fw `"    }],"'
			fw `"    series: [{"'
			fw `"        type: 'bar',"'
			fw `"        label: {"'
			fw `"            show: true,"'
			fw `"            position: 'top',"'
			fw `"        },"'
			fw `"        barWidth: '24px',"'
			fw `"        itemStyle: {"'
			fw `"            barBorderRadius: [5, 5, 0, 0]"'
			fw `"        },"'
			fw `"        data: ["'
			forval i = 1/`=_N'{
			  local var = `"`=num[`i']',"'
			  fw `"`var'"'
			}
			fw `"        ]"'
			fw `"    }]"'
			fw `"};"'
			fw, e t
		}
		if `number' == 2{
			jscopy
			fw, s html(`htmlname')
			lib, b s(dark)
			tokenize `varlist'
			ren `1' name
			ren `2' num
			if "`sort'" != "" gsort num
			tostring name num, replace
			replace name = "unknown" if name == "." 
			replace num = "0" if num == "" 
			fw `"var option = {"'
			fw `"    grid: {"'
			fw `"        left: '9%',"'
			fw `"        right: '5%',"'
			fw `"        bottom: '6%',"'
			fw `"        top: '4%',"'
			fw `"        containLabel: true"'
			fw `"    },"'
			fw `"    xAxis: [{"'
			fw `"        type: 'category',"'
			fw `"        data: ["'
			forval i = 1/`=_N'{
			  local var = `"'`=name[`i']'', "'
			  fw `"`var'"'
			}
			fw `"        ],"'
			fw `"        axisTick: {"'
			fw `"            alignWithLabel: true,"'
			fw `"            show: false"'
			fw `"        },"'
			fw `"        axisLine: {"'
			fw `"            show: false"'
			fw `"        },"'
			fw `"        axisLabel: {"'
			fw `"            fontSize: 12"'
			fw `"        },"'
			fw `"        interval: 1,"'
			fw `"    }],"'
			fw `"    yAxis: [{"'
			fw `"        type: 'value',"'
			fw `"        offset: 30,"'
			fw `"        axisLine: {"'
			fw `"            show: false,"'
			fw `"        },"'
			fw `"        axisLabel: {"'
			fw `"            inside: true,"'
			fw `"            margin:4,"'
			fw `"        },"'
			fw `"        splitLine: false"'
			fw `"    }],"'
			fw `"    dataZoom: [{"'
			fw `"        type: 'inside',"'
			fw `"        filterMode: 'none',"'
			fw `"        startValue: 0,"'
			fw `"        endValue: 7,"'
			fw `"    }],"'
			fw `"    series: [{"'
			fw `"        type: 'bar',"'
			fw `"        label: {"'
			fw `"            show: true,"'
			fw `"            position: 'top',"'
			fw `"        },"'
			fw `"        barWidth: '24px',"'
			fw `"        itemStyle: {"'
			fw `"            barBorderRadius: [5, 5, 0, 0]"'
			fw `"        },"'
			fw `"        data: ["'
			forval i = 1/`=_N'{
			  local var = `"`=num[`i']',"'
			  fw `"`var'"'
			}
			fw `"        ]"'
			fw `"    }]"'
			fw `"};"'
			fw, e t
		}
	}
	if "`htmlname'" !="" di `"点击{browse `htmlname'.html:`htmlname'.html}即可打开结果文件"'
	if "`htmlname'" =="" di `"点击{browse fw_example.html:fw_example.html}即可打开结果文件"'
		if "`htmlname'" !="" copen `htmlname'.html
	if "`htmlname'" =="" copen fw_example.html
	if "`c(os)'" == "MacOSX"{
		cap qui drm __MACOSX
	}
end


