* 绘制南丁格尔图
* clear all
* input value strL name
* 40 "产品设计1"
* 80 "产品设计2"
* 70 "产品设计3"
* 120 "产品设计4"
* 100 "产品设计5"
* 110 "产品设计6"
* 120 "产品设计7"
* 120 "产品设计8"
* end
* rose value name, sch(marcarons) html(myexamples) ti(产品设计)
cap prog drop rose
prog define rose
	version 13.0
	syntax anything [, HTMLname(string) SCHeme(string) TItle(string)]
	if "`title'" == "" local title = ""
	if "`scheme'" == "" local scheme = "vintage"
	tokenize `anything'
	local var1 = "`1'"
	local var2 = "`2'"
	qui{
		jscopy
		fw, s h(`htmlname')
		lib, b s(`scheme')
		fw `"option = {"'
		fw `"  title:{"'
		fw `"    text: '`title'',"'
		fw `"    x: 'center'"'
		fw `"  },"'
		fw `"  tooltip: {"'
		fw `"    trigger: 'item',"'
		fw `"    formatter: "{a}<br/>{b} : {c}({d}%)""'
		fw `"  },"'
		fw `"  legend: {"'
		fw `"    x: 'center',"'
		fw `"    y: 'bottom',"'
		fw `"    data: ['rose1', 'rose2', 'rose3', 'rose3', 'rose4', 'rose5']"'
		fw `"  },"'
		fw `"  toolbox: {"'
		fw `"    show: true,"'
		fw `"    feature: {"'
		fw `"      mark: {"'
		fw `"        show: true"'
		fw `"      },"'
		fw `"      dataView: {"'
		fw `"        show: true,"'
		fw `"        readOnly: false"'
		fw `"      },"'
		fw `"      magicType: {"'
		fw `"        show: true,"'
		fw `"        type: ['pie', 'funnel']"'
		fw `"      },"'
		fw `"      restore: {"'
		fw `"        show: true"'
		fw `"      },"'
		fw `"      saveAsImage: {"'
		fw `"        show: true"'
		fw `"      }"'
		fw `"    }"'
		fw `"  },"'
		fw `"  calculabel: true,"'
		fw `"  series: ["'
		fw `"    {"'
		fw `"      name: '`var2'',"'
		fw `"      type: 'pie',"'
		fw `"      radius: [30, 110],"'
		fw `"      center: ['50%', '50%'],"'
		fw `"      roseType: 'area',"'
		fw `"      data: ["'
		forval i = 1/`=_N'{ 
			fw `"        {value: `=`var1'[`i']', name: '`=`var2'[`i']''},"'
		} 
		fw `"      ]"'
		fw `"    }"'
		fw `"  ]"'
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

