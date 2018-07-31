*! 根据给定的城市首字母缩写绘制房价走势图
cap prog drop fangjias
prog define fangjias
	version 14.0
	syntax anything [, Year(string) Height(string) Width(string)]
	if "`year'" == "" local year = 10
	if "`cityshort'" == "" local cityshort = "gz"
	if "`height'" == "" local height = 560
	if "`width'" == "" local width = 680
	copen "http:\/\/fangjia.fang.com\/pinggu\/chart\/ChartDefaultNew.aspx?dataType=city\&height=`height'\&width=`width'\&year=`year'\&cityshort=`anything'"
end
