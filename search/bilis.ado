*! 执行哔哩哔哩搜索
cap prog drop bilis
prog define bilis
	version 14.0
	syntax anything
	copen "http:\/\/search.bilibili.com\/all?keyword=`anything'"
end
