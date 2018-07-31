*! 绘制温度计
*! 程振兴 2018年7月13日
*! 绘制温度计
*! ========================================= !*
*! weatherglass 36.5
*! ========================================= !*
cap prog drop weatherglass
prog define weatherglass
	version 14.0
	syntax anything [, HTMLname(string)]
	qui{
		cap fw, e
		fw, s h(`htmlname')
		jscopy
		lib, b
		fw `"var value = `anything';"'
		fw `"var kd = [];"'
		fw `"for (var i = 0, len = 130; i <= len; i++) {"'
		fw `"    if (i > 100 || i < 30) {"'
		fw `"        kd.push('0')"'
		fw `"    } else {"'
		fw `"        if (i % 5 === 0) {"'
		fw `"            kd.push('5');"'
		fw `"        } else {"'
		fw `"            kd.push('3');"'
		fw `"        }"'
		fw `"    }"'
		fw `"}"'
		fw `"console.log(kd)"'
		fw `"function getData(value) {"'
		fw `"    return [value + 30];"'
		fw `"}"'
		fw `"var data = getData(value);"'
		fw `"var mercuryColor = '#fd4d49';"'
		fw `"var borderColor = '#fd4d49';"'
		fw `"option = {"'
		fw `"    title: {"'
		fw `"        text: '温度计',"'
		fw `"        show: false"'
		fw `"    },"'
		fw `"    yAxis: [{"'
		fw `"        show: false,"'
		fw `"        min: 0,"'
		fw `"        max: 130,"'
		fw `"    }, {"'
		fw `"        show: false,"'
		fw `"        data: [],"'
		fw `"        min: 0,"'
		fw `"        max: 130,"'
		fw `"    }],"'
		fw `"    xAxis: [{"'
		fw `"        show: false,"'
		fw `"        data: []"'
		fw `"    }, {"'
		fw `"        show: false,"'
		fw `"        data: []"'
		fw `"    }, {"'
		fw `"        show: false,"'
		fw `"        data: []"'
		fw `"    }, {"'
		fw `"        show: false,"'
		fw `"        min: -110,"'
		fw `"        max: 100,"'
		fw `"    }],"'
		fw `"    series: [{"'
		fw `"        name: '条',"'
		fw `"        type: 'bar',"'
		fw `"        xAxisIndex: 0,"'
		fw `"        data: data,"'
		fw `"        barWidth: 18,"'
		fw `"        itemStyle: {"'
		fw `"            normal: {"'
		fw `"                color: mercuryColor,"'
		fw `"                barBorderRadius: 0,"'
		fw `"            }"'
		fw `"        },"'
		fw `"        label: {"'
		fw `"            normal: {"'
		fw `"                show: true,"'
		fw `"                position: 'top',"'
		fw `"                formatter: function(param) {"'
		fw `"                    return param.value - 30 + '°C';"'
		fw `"                },"'
		fw `"                textStyle: {"'
		fw `"                    color: '#ccc',"'
		fw `"                    fontSize: '10',"'
		fw `"                }"'
		fw `"            }"'
		fw `"        },"'
		fw `"        z: 2"'
		fw `"    }, {"'
		fw `"        name: '白框',"'
		fw `"        type: 'bar',"'
		fw `"        xAxisIndex: 1,"'
		fw `"        barGap: '-100%',"'
		fw `"        data: [129],"'
		fw `"        barWidth: 28,"'
		fw `"        itemStyle: {"'
		fw `"            normal: {"'
		fw `"                color: '#ffffff',"'
		fw `"                barBorderRadius: 50,"'
		fw `"            }"'
		fw `"        },"'
		fw `"        z: 1"'
		fw `"    }, {"'
		fw `"        name: '外框',"'
		fw `"        type: 'bar',"'
		fw `"        xAxisIndex: 2,"'
		fw `"        barGap: '-100%',"'
		fw `"        data: [130],"'
		fw `"        barWidth: 38,"'
		fw `"        itemStyle: {"'
		fw `"            normal: {"'
		fw `"                color: borderColor,"'
		fw `"                barBorderRadius: 50,"'
		fw `"            }"'
		fw `"        },"'
		fw `"        z: 0"'
		fw `"    }, {"'
		fw `"        name: '圆',"'
		fw `"        type: 'scatter',"'
		fw `"        hoverAnimation: false,"'
		fw `"        data: [0],"'
		fw `"        xAxisIndex: 0,"'
		fw `"        symbolSize: 48,"'
		fw `"        itemStyle: {"'
		fw `"            normal: {"'
		fw `"                color: mercuryColor,"'
		fw `"                opacity: 1,"'
		fw `"            }"'
		fw `"        },"'
		fw `"        z: 2"'
		fw `"    }, {"'
		fw `"        name: '白圆',"'
		fw `"        type: 'scatter',"'
		fw `"        hoverAnimation: false,"'
		fw `"        data: [0],"'
		fw `"        xAxisIndex: 1,"'
		fw `"        symbolSize: 60,"'
		fw `"        itemStyle: {"'
		fw `"            normal: {"'
		fw `"                color: '#ffffff',"'
		fw `"                opacity: 1,"'
		fw `"            }"'
		fw `"        },"'
		fw `"        z: 1"'
		fw `"    }, {"'
		fw `"        name: '外圆',"'
		fw `"        type: 'scatter',"'
		fw `"        hoverAnimation: false,"'
		fw `"        data: [0],"'
		fw `"        xAxisIndex: 2,"'
		fw `"        symbolSize: 70,"'
		fw `"        itemStyle: {"'
		fw `"            normal: {"'
		fw `"                color: borderColor,"'
		fw `"                opacity: 1,"'
		fw `"            }"'
		fw `"        },"'
		fw `"        z: 0"'
		fw `"    }, {"'
		fw `"        name: '刻度',"'
		fw `"        type: 'bar',"'
		fw `"        yAxisIndex: 1,"'
		fw `"        xAxisIndex: 3,"'
		fw `"        label: {"'
		fw `"            normal: {"'
		fw `"                show: true,"'
		fw `"                position: 'right',"'
		fw `"                distance: 5,"'
		fw `"                color: '#525252',"'
		fw `"                fontSize: 10,"'
		fw `"                formatter: function(params) {"'
		fw `"                    if (params.dataIndex > 100 || params.dataIndex < 30) {"'
		fw `"                        return '';"'
		fw `"                    } else {"'
		fw `"                        if (params.dataIndex % 5 === 0) {"'
		fw `"                            return params.dataIndex - 30;"'
		fw `"                        } else {"'
		fw `"                            return '';"'
		fw `"                        }"'
		fw `"                    }"'
		fw `"                }"'
		fw `"            }"'
		fw `"        },"'
		fw `"        barGap: '-100%',"'
		fw `"        data: kd,"'
		fw `"        barWidth: 1,"'
		fw `"        itemStyle: {"'
		fw `"            normal: {"'
		fw `"                color: borderColor,"'
		fw `"                barBorderRadius: 10,"'
		fw `"            }"'
		fw `"        },"'
		fw `"        z: 0"'
		fw `"    }]"'
		fw `"};"'
		fw, e t
	}
	if "`htmlname'" !="" di `"点击{browse `htmlname'.html:`htmlname'.html}即可打开结果文件"'
	if "`htmlname'" =="" di `"点击{browse fw_example.html:fw_example.html}即可打开结果文件"'
	if "`htmlname'" !="" copen `htmlname'.html
	if "`htmlname'" =="" copen fw_example.html
	if "`c(os)'" == "MacOSX"{
		cap qui drm __MACOSX
	}
end


