*! 执行有道词典搜索
cap prog drop youdaos
prog define youdaos
	version 14.0
	syntax anything
	copen "http:\/\/dict.youdao.com\/search?le=eng\&q=`anything'\&keyfrom=dict2.index"
end
