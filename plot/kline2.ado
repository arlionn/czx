*! 绘制K线图
*! 程振兴 2018年7月13日
*! kline2 2, sch(vintage)
cap prog drop kline2
prog def kline2
	version 14.0
	syntax anything(name = code), [Start(string) End(string) Stock Index SCHeme(string)]
	qui{
		cap preserve
		clear
		if "`end'" == "" local end: disp %dCYND date("`c(current_date)'","DMY")
		if "`start'" == "" local start: disp %dCYND (date("`end'","YMD")-60)
		if "`scheme'" == "" local scheme = "vintage"
		qui cntrade2 `code', s(`start') e(`end') `stock' `index'
		replace name = subinstr(name, " ", "", .)
		cap file close myfile
		jscopy
		fw, s h(`=name[`=_N']')
		fw `"<!DOCTYPE html>"'
		fw `"<html style="height: 100%">"'
		fw `"   <head>"'
		fw `"       <meta charset="utf-8">"'
		fw `"   </head>"'
		fw `"   <body style="height: 100%; margin: 0">"'
		fw `"       <div id="container" style="height: 100%"></div>"'
		fw `"       <script type="text/javascript" src="./js/echarts.min.js"></script>"'
		fw `"		<script type="text/javascript" src="./js/dark.js"></script>"'
		fw `"		<script type="text/javascript" src="./js/vintage.js"></script>"'
		fw `"		<script type="text/javascript" src="./js/macarons.js"></script>"'
		fw `"		<script type="text/javascript" src="./js/infographic.js"></script>"'
		fw `"		<script type="text/javascript" src="./js/shine.js"></script>"'
		fw `"		<script type="text/javascript" src="./js/roma.js"></script>"'
		fw `"<script type="text/javascript"> "'
		fw `"var dom = document.getElementById("container");"'
		fw `"var myChart = echarts.init(dom, '`scheme'');"'
		fw `"var app = {};"'
		fw `"option = null;"'
		fw `"var upColor = '#ec0000';"'
		fw `"var upBorderColor = '#8A0000';"'
		fw `"var downColor = '#00da3c';"'
		fw `"var downBorderColor = '#008F28';"'
		fw `"var data0 = splitData(["'
		gen open1 = string(open)
		gen close1 = string(close)
		gen low1 = string(low)
		gen high1 = string(high)
		gen year = year(date)
		gen month = month(date)
		gen day = day(date)
		tostring year month day, replace
		gen date1 = year + "/" + month + "/" + day
		forval i = 1/`=_N'{
			fw `"['`=date1[`i']'', `=open1[`i']', `=close1[`i']', `=low1[`i']', `=high1[`i']'],"'
		}
		fw `"]);"'
		fw `"function splitData(rawData) {"'
		fw `"    var categoryData = [];"'
		fw `"    var values = []"'
		fw `"    for (var i = 0; i < rawData.length; i++) {"'
		fw `"        categoryData.push(rawData[i].splice(0, 1)[0]);"'
		fw `"        values.push(rawData[i])"'
		fw `"    }"'
		fw `"    return {"'
		fw `"        categoryData: categoryData,"'
		fw `"        values: values"'
		fw `"    };"'
		fw `"}"'
		fw `"function calculateMA(dayCount) {"'
		fw `"    var result = [];"'
		fw `"    for (var i = 0, len = data0.values.length; i < len; i++) {"'
		fw `"        if (i < dayCount) {"'
		fw `"            result.push('-');"'
		fw `"            continue;"'
		fw `"        }"'
		fw `"        var sum = 0;"'
		fw `"        for (var j = 0; j < dayCount; j++) {"'
		fw `"            sum += data0.values[i - j][1];"'
		fw `"        }"'
		fw `"        result.push(Math.round((sum / dayCount)*100, 2)/100);"'
		fw `"    }"'
		fw `"    return result;"'
		fw `"}"'
		fw `"option = {"'
		fw `"    title: {"'
		fw `"        text: '`=name[`=_N']'',"'
		fw `"        left: 0"'
		fw `"    },"'
		fw `"    tooltip: {"'
		fw `"        trigger: 'axis',"'
		fw `"        axisPointer: {"'
		fw `"            type: 'cross'"'
		fw `"        }"'
		fw `"    },"'
		fw `"    legend: {"'
		fw `"        data: ['日K', 'MA5', 'MA10', 'MA20', 'MA30']"'
		fw `"    },"'
		fw `"    grid: {"'
		fw `"        left: '10%',"'
		fw `"        right: '10%',"'
		fw `"        bottom: '15%'"'
		fw `"    },"'
		fw `"    xAxis: {"'
		fw `"        type: 'category',"'
		fw `"        data: data0.categoryData,"'
		fw `"        scale: true,"'
		fw `"        boundaryGap : false,"'
		fw `"        axisLine: {onZero: false},"'
		fw `"        splitLine: {show: false},"'
		fw `"        splitNumber: 20,"'
		fw `"        min: 'dataMin',"'
		fw `"        max: 'dataMax'"'
		fw `"    },"'
		fw `"    yAxis: {"'
		fw `"        scale: true,"'
		fw `"        splitArea: {"'
		fw `"            show: true"'
		fw `"        }"'
		fw `"    },"'
		fw `"    dataZoom: ["'
		fw `"        {"'
		fw `"            type: 'inside',"'
		fw `"            start: 50,"'
		fw `"            end: 100"'
		fw `"        },"'
		fw `"        {"'
		fw `"            show: true,"'
		fw `"            type: 'slider',"'
		fw `"            y: '90%',"'
		fw `"            start: 50,"'
		fw `"            end: 100"'
		fw `"        }"'
		fw `"    ],"'
		fw `"    series: ["'
		fw `"        {"'
		fw `"            name: '日K',"'
		fw `"            type: 'candlestick',"'
		fw `"            data: data0.values,"'
		fw `"            itemStyle: {"'
		fw `"                normal: {"'
		fw `"                    color: upColor,"'
		fw `"                    color0: downColor,"'
		fw `"                    borderColor: upBorderColor,"'
		fw `"                    borderColor0: downBorderColor"'
		fw `"                }"'
		fw `"            },"'
		fw `"            markPoint: {"'
		fw `"                label: {"'
		fw `"                    normal: {"'
		fw `"                        formatter: function (param) {"'
		fw `"                            return param != null ? Math.round(param.value) : '';"'
		fw `"                        }"'
		fw `"                    }"'
		fw `"                },"'
		fw `"                data: ["'
		fw `"                    {"'
		fw `"                        name: 'XX标点',"'
		fw `"                        coord: ['2013/5/31', 2300],"'
		fw `"                        value: 2300,"'
		fw `"                        itemStyle: {"'
		fw `"                            normal: {color: 'rgb(41,60,85)'}"'
		fw `"                        }"'
		fw `"                    },"'
		fw `"                    {"'
		fw `"                        name: 'highest value',"'
		fw `"                        type: 'max',"'
		fw `"                        valueDim: 'highest'"'
		fw `"                    },"'
		fw `"                    {"'
		fw `"                        name: 'lowest value',"'
		fw `"                        type: 'min',"'
		fw `"                        valueDim: 'lowest'"'
		fw `"                    },"'
		fw `"                    {"'
		fw `"                        name: 'average value on close',"'
		fw `"                        type: 'average',"'
		fw `"                        valueDim: 'close'"'
		fw `"                    }"'
		fw `"                ],"'
		fw `"                tooltip: {"'
		fw `"                    formatter: function (param) {"'
		fw `"                        return param.name + '<br>' + (param.data.coord || '');"'
		fw `"                    }"'
		fw `"                }"'
		fw `"            },"'
		fw `"            markLine: {"'
		fw `"                symbol: ['none', 'none'],"'
		fw `"                data: ["'
		fw `"                    ["'
		fw `"                        {"'
		fw `"                            name: 'from lowest to highest',"'
		fw `"                            type: 'min',"'
		fw `"                            valueDim: 'lowest',"'
		fw `"                            symbol: 'circle',"'
		fw `"                            symbolSize: 10,"'
		fw `"                            label: {"'
		fw `"                                normal: {show: false},"'
		fw `"                                emphasis: {show: false}"'
		fw `"                            }"'
		fw `"                        },"'
		fw `"                        {"'
		fw `"                            type: 'max',"'
		fw `"                            valueDim: 'highest',"'
		fw `"                            symbol: 'circle',"'
		fw `"                            symbolSize: 10,"'
		fw `"                            label: {"'
		fw `"                                normal: {show: false},"'
		fw `"                                emphasis: {show: false}"'
		fw `"                            }"'
		fw `"                        }"'
		fw `"                    ],"'
		fw `"                    {"'
		fw `"                        name: 'min line on close',"'
		fw `"                        type: 'min',"'
		fw `"                        valueDim: 'close'"'
		fw `"                    },"'
		fw `"                    {"'
		fw `"                        name: 'max line on close',"'
		fw `"                        type: 'max',"'
		fw `"                        valueDim: 'close'"'
		fw `"                    }"'
		fw `"                ]"'
		fw `"            }"'
		fw `"        },"'
		fw `"        {"'
		fw `"            name: 'MA5',"'
		fw `"            type: 'line',"'
		fw `"            data: calculateMA(5),"'
		fw `"            smooth: true,"'
		fw `"            lineStyle: {"'
		fw `"                normal: {opacity: 0.5}"'
		fw `"            }"'
		fw `"        },"'
		fw `"        {"'
		fw `"            name: 'MA10',"'
		fw `"            type: 'line',"'
		fw `"            data: calculateMA(10),"'
		fw `"            smooth: true,"'
		fw `"            lineStyle: {"'
		fw `"                normal: {opacity: 0.5}"'
		fw `"            }"'
		fw `"        },"'
		fw `"        {"'
		fw `"            name: 'MA20',"'
		fw `"            type: 'line',"'
		fw `"            data: calculateMA(20),"'
		fw `"            smooth: true,"'
		fw `"            lineStyle: {"'
		fw `"                normal: {opacity: 0.5}"'
		fw `"            }"'
		fw `"        },"'
		fw `"        {"'
		fw `"            name: 'MA30',"'
		fw `"            type: 'line',"'
		fw `"            data: calculateMA(30),"'
		fw `"            smooth: true,"'
		fw `"            lineStyle: {"'
		fw `"                normal: {opacity: 0.5}"'
		fw `"            }"'
		fw `"        },"'
		fw `"    ]"'
		fw `"};"'
		fw `"if (option && typeof option === "object") {"'
		fw `"    myChart.setOption(option, true);"'
		fw `"}"'
		fw `"       </script>"'
		fw `"   </body>"'
		fw `"</html>"'
		file close myfile
		drop open1-date1
	}
	local name = "`=name[`=_N']'"
	di "点击打开：" "{browse `name'.html:`name'.html}"
	noi di in yellow "数据来源：网易财经"
	if "`c(os)'" == "MacOSX"{
		cap qui drm __MACOSX
	}
	copen `name'.html
end
