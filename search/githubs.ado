*! 执行github搜索
cap prog drop githubs
prog define githubs
	version 14.0
	syntax anything
	copen "https:\/\/github.com\/search?utf8=%E2%9C%93\&q=`anything'\&type="
end
