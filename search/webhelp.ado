*! 搜索Stata命令网络帮助文件
cap prog drop webhelp
prog define webhelp
	version 14.0
	syntax anything
	copen "https:\/\/www.stata.com\/help.cgi?`anything'"
end
