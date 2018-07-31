*! 执行百度汉语搜索
cap prog drop bdhys
prog define bdhys
	version 14.0
	syntax anything
	copen "http:\/\/hanyu.baidu.com\/s?wd=`anything'\&device=pc\&from=home`anything'"
end
