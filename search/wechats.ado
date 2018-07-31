*! 执行微信推文搜索
cap prog drop wechats
prog define wechats
	version 14.0
	syntax anything
	copen "http:\/\/weixin.sogou.com\/weixin?query=`anything'\&_asf=www.sogou.com\&_ast=\&w=01019900\&p=40040100\&ie=utf8\&type=2&sut=1415\&sst0=1414592863512\&lkt=7%2C1414592862099%2C1414592862951"
end
