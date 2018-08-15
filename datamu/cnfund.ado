*! 获取全部基金及代码
*! 程振兴 2018年8月15日
*! 使用 cnfund
*! 仅用于Mac OS
*! 简单修改t参数就可以获取其他市场的
cap prog drop cnfund
prog def cnfund
version 14.0
	!curl "http://quote.cfi.cn/stockList.aspx?t=2" | tr "<tr>" "\n" > temp.txt
	infix strL v 1-20000 using temp.txt, clear
	drop if v == ""
	keep if ustrregexm(v,"\(\d\d\d\d")
	split v, parse("(" ")")
	keep v1 v2
	replace v2 = substr(v2, 1, 6)
	drop if index(v2, "-")
	ren v1 fundname
	label var fundname "基金名称"
	label var v2 "基金代码"
	ren v2 fundcode
	erase temp.txt
end
