*! 执行百度搜索
cap prog drop bds
prog define bds
	version 14.0
	syntax anything
	copen "http:\/\/www.baidu.com\/s?wd=`anything'"
end
