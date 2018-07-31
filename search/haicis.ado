*! 执行海词词典搜索
cap prog drop haicis
prog define haicis
	version 14.0
	syntax anything
	copen "http:\/\/dict.cn\/`anything'"
end
