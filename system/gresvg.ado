*! 更快捷的图片保存为svg的方法
*! 程振兴 2018年7月13日
cap prog drop gresvg
prog def gresvg
	version 14.0
	syntax anything(name = filename)
	gr export "`filename'.svg", replace width(600) height(400) as(svg)
	di `"<iframe src="http:\/\/www.czxa.top/mr/`filename'.svg" width="100%" height="420px" frameborder="0" allowfullscreen></iframe>"'
end
