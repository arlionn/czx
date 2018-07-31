* 将当前数据集中的所有变量的名称组成一个局部宏czx，并存入返回值r(czx)
* 程振兴 2018年7月13日
cap prog drop varreturn
prog define varreturn, rclass
	version 14.0
	local czx
	foreach i of varlist _all{
		local czx "`czx' `i'"
	}
	return local czx = "`czx'"
	di "`czx'"
end
