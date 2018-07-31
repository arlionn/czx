*! 更快捷的图片保存方法
*! 程振兴 2018年7月13日
cap prog drop gre
prog def gre
	version 14.0
	syntax anything(name = filename)
	gr export "`filename'.png", replace width(2600) height(1800)
end
