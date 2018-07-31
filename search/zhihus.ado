*! 执行知乎搜索
cap prog drop zhihus
prog define zhihus
	version 14.0
	syntax anything
	copen "https:\/\/www.zhihu.com\/search?type=content\&q=`anything'"
end
