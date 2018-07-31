*! 程振兴 2018年3月20号 给定地图中心位置名称，调用百度地图
cap prog drop baidumap
prog define baidumap, rclass
	version 14.0
	syntax [, ADDress(string) HTMLname(string) ZOOM(string)]
	cap preserve
	if "`zoom'" == "" local zoom = "16"
	if "`htmlname'" == "" local htmlname = "fw_example"
	if "`address'" == ""{
		local longitude = "113.42251"
		local latitude = "23.021382"
	}
	else{
		clear all
		qui set obs 1
		qui gen v = "`address'"
		qui chinagcode,baidukey(tXvh2UTmo4z0zq5t41XLPTm1kQbMHjYl) address(v)
		local longitude = "`=longitude[1]'"
		local latitude = "`=latitude[1]'"
	}
	qui{
		jscopy
		fw, s html(`htmlname')
		lib, b s(infographic)
		fw `"var series=[]"'
		fw `"option = {"'
		fw `"    bmap: {"'
		fw `"        center: [`longitude', `latitude'],"'
		fw `"        zoom: `zoom',"'
		fw `"        roam: true,"'
		fw `"        mapStyle: {"'
		fw `"            styleJson: [{"'
		fw `""'
		fw `"            }]"'
		fw `"        }"'
		fw `"    },"'
		fw `"    series:series"'
		fw `"};"'
		fw, e t
	}
	ret local longitude = "`longitude'"
	ret local latitude = "`latitude'"
	if "`htmlname'" !="" di `"点击{browse `htmlname'.html:`htmlname'.html}即可打开结果文件"'
	if "`htmlname'" =="" di `"点击{browse fw_example.html:fw_example.html}即可打开结果文件"'
end
