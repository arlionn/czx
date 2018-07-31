*! 程振兴 2018年3月21日
*! 绘制仪表盘
*! dashboard 15.6, ti(利率) html(仪表盘)
cap prog drop dashboard
prog define dashboard
	version 14.0
	syntax anything [, TItle(string) HTMLname(string)]
	if "`title'" == "" local title = "完成率"
	if "`htmlname'" == "" local htmlname = "fw_example"
	qui{
		cap preserve
		clear all
		jscopy
		fw, s h(`htmlname')
		lib, b
		fw `"var sum=100;"'
		fw `"var num=`anything';"'
		fw `"var v=num/sum*100;"'
		fw `"function toDecimal2(x) {"'
		fw `"var f = parseFloat(x);      "'
		fw `"if (isNaN(f)) {   "'
		fw `" return false;     "'
		fw `"}          "'
		fw `"var y = Math.round(x*100)/100;  "'
		fw `"var s = y.toString();       "'
		fw `"var rs = s.indexOf('.');      "'
		fw `"if (rs < 0) {   "'
		fw `" rs = s.length;      "'
		fw `" s += '.';   "'
		fw `"            }       "'
		fw `"while (s.length <= rs + 2) {   "'
		fw `" s += '0';       "'
		fw `"}            "'
		fw `"return s;   "'
		fw `"} "'
		fw `"var f =toDecimal2(v);"'
		fw `"option = {"'
		fw `"    tooltip : {"'
		fw `"        formatter: "{a} = {c}%""'
		fw `"    },"'
		fw `"    series: [{"'
		fw `"        name: '`title'',"'
		fw `"        type: "gauge","'
		fw `"        startAngle: 180,"'
		fw `"        endAngle: 0,"'
		fw `"        min: 0,"'
		fw `"        max: 100,"'
		fw `"        radius: "80%","'
		fw `"        center: ["50%", "65%"],"'
		fw `"        axisLine: {"'
		fw `"            show: true,"'
		fw `"            lineStyle: {"'
		fw `"                width: 30,"'
		fw `"                shadowBlur: 0,"'
		fw `"                color: [[0.3, '#C23531'],[0.7, '#63869e'],[1, '#91c7a1']]"'
		fw `"            }"'
		fw `"        },"'
		fw `"       itemStyle: {"'
		fw `"            normal: {"'
		fw `"                shadowBlur: 10"'
		fw `"            }"'
		fw `"        },"'
		fw `"        detail: {formatter:'{value}%'},"'
		fw `"        data: [{value:f , name: '`title''}]"'
		fw `"    }]"'
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
