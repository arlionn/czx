*! 绘制中国地图
*! 程振兴 2018年7月14日
*! cuse jd2017zsjh, c
*! stcnmap 省份 同比2016年计划增减
*! stcnmap 省份 同比2016年计划增减, from(lightblue) to(green)
cap prog drop stcnmap
prog define stcnmap
	version 14.0
	syntax anything [,From(string) To(string) Hightext(string) Lowtext(string) TItle(string) SUBTItle(string) HTMLname(string) SCHeme(string)]
	qui{
		if "`htmlname'" == "" local htmlname = "fw_example"
		if "`from'" == "" local from = "#e0ffff"
		if "`to'" == "" local to = "#006edd"
		if "`hightext'" == "" local hightext = "高"
		if "`lowtext'" == "" local lowtext = "低"
		if "`scheme'" == "" local scheme = "dark"
		tokenize `anything'
		local a = "`1'"
		local b = "`2'"
		cap preserve
		egen max = max(`b')
		egen min = min(`b')
		local max = max[1]
		local min = min[1]
		drop max min
		jscopy
		fw, s h(`htmlname')
		lib, b s(`scheme')
		fw `"function mapTooltipClick(name){"'
		fw `"    alert(name)"'
		fw `"}"'
		fw `"option = {"'
		fw `"    title: {"'
		fw `"        text: '`title'',"'
		fw `"        subtext: '`subtitle'',"'
		fw `"        x: 'center',"'
		fw `"        y: 50,"'
		fw `"        textStyle: {"'
		fw `"            color: 'black',"'
		fw `"            fontFamily: '楷书',"'
		fw `"            fontSize: 18"'
		fw `"        },"'
		fw `"        subtextStyle:{"'
		fw `"            fontSize: '宋体',"'
		fw `"            fontFamily: 15"'
		fw `"        }"'
		fw `"    },"'
		fw `"    visualMap: {"'
		fw `"        min: `min',"'
		fw `"        max: `max',"'
		fw `"        right: 300,"'
		fw `"        top: 'center',"'
		fw `"        text: ['`hightext'','`lowtext''],"'
		fw `"        calculable: false,"'
		fw `"        orient:'orient',"'
		fw `"        inRange: {"'
		fw `"            color: ['`from'', '`to''],"'
		fw `"            symbolSize: [30, 100]"'
		fw `"        }"'
		fw `"    },"'
		fw `"    series : ["'
		fw `"        {"'
		fw `"        name: 'Value',"'
		fw `"        type: 'map',"'
		fw `"        mapType: 'china',"'
		fw `"        itemStyle:{"'
		fw `"            normal:{label:{show:true}},"'
		fw `"            emphasis:{label:{show:true}}"'
		fw `"        },"'
		fw `"        data:["'
		varreturn
		tostring `r(czx)', replace
		forval i = 1/`=_N'{
			local var = `"{name:"`=`a'[`i']'", value:`=`b'[`i']'},"'
			fw `"`var'"'
		}
		fw `"        ]"'
		fw `"        },"'
		fw `"    ]"'
		fw `"}"'
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

