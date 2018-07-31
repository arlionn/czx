*! 程振兴 2018年3月21日
*! 绘制仪表盘（这个比较扁平化）
*! dashboard2 15.6, ti(利率) html(仪表盘) sch(dark)
cap prog drop dashboard2
prog define dashboard2
	version 14.0
	syntax anything [, TItle(string) HTMLname(string) SCHeme(string)]
	if "`title'" == "" local title = "完成率"
	if "`htmlname'" == "" local htmlname = "fw_example"
	if "`scheme'" == "" local scheme = "macarons"
	qui{
		cap preserve
		clear all
		jscopy
		fw, s h(`htmlname')
		lib, b s(`scheme')
		fw `"let inputValue = `anything'"'
		fw `"option = {"'
		fw `"  tooltip: {"'
		fw `"    formatter: "{a} <br/>{b} : {c}%""'
		fw `"  },"'
		fw `"  toolbox: {"'
		fw `"    feature: {"'
		fw `"      restore: {},"'
		fw `"      saveAsImage: {}"'
		fw `"    }"'
		fw `"  },"'
		fw `"  series: ["'
		fw `"    {"'
		fw `"      startAngle: 200,"'
		fw `"      endAngle: -20,"'
		fw `"      type: 'gauge',"'
		fw `"      radius: '80%',"'
		fw `"      min: 0,"'
		fw `"      max: 100,"'
		fw `"      splitNumber: 10,"'
		fw `"      axisLine: {"'
		fw `"        lineStyle: {"'
		fw `"          width: 2"'
		fw `"        }"'
		fw `"      },"'
		fw `"      axisTick: {"'
		fw `"        show: false"'
		fw `"      },"'
		fw `"      detail: {"'
		fw `"        show: false"'
		fw `"      },"'
		fw `"      splitLine: {"'
		fw `"        show: false"'
		fw `"      },"'
		fw `"      axisLabel: {"'
		fw `"        show: false"'
		fw `"      }"'
		fw `"    },"'
		fw `"    {"'
		fw `"      name: '`title'',"'
		fw `"      type: 'gauge',"'
		fw `"      startAngle: 200,"'
		fw `"      endAngle: -20,"'
		fw `"      detail: {formatter: '{value}'},"'
		fw `"      data: [{value: inputValue, name: '`title''}],"'
		fw `"      axisLabel: {"'
		fw `"        show: false"'
		fw `"      },"'
		fw `"      axisTick: {"'
		fw `"        show: false"'
		fw `"      },"'
		fw `"      splitLine: {"'
		fw `"        show: false"'
		fw `"      },"'
		fw `"      detail: {"'
		fw `"        offsetCenter: [0, 30]"'
		fw `"      }"'
		fw `"    },"'
		fw `"    {"'
		fw `"      startAngle: 200,"'
		fw `"      endAngle: -20,"'
		fw `"      type: 'gauge',"'
		fw `"      radius: '63%',"'
		fw `"      min: 0,"'
		fw `"      max: 100,"'
		fw `"      splitNumber: 10,"'
		fw `"      axisLine: {"'
		fw `"        lineStyle: {"'
		fw `"          width: 2"'
		fw `"        }"'
		fw `"      },"'
		fw `"      axisTick: {"'
		fw `"        show: true,"'
		fw `"        length: 16,"'
		fw `"      },"'
		fw `"      detail: {"'
		fw `"        show: false"'
		fw `"      },"'
		fw `"      splitLine: {"'
		fw `"        show: true,"'
		fw `"        length: 20,"'
		fw `"      },"'
		fw `"      axisLabel: {"'
		fw `"        show: true,"'
		fw `"        fontSize: 24"'
		fw `"      }"'
		fw `"    }"'
		fw `"  ]"'
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
