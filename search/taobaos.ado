*! 执行淘宝搜索
cap prog drop taobaos
prog define taobaos
	version 14.0
	syntax anything
	copen "https://s.taobao.com/search?q=`anything'&imgfile=&commend=all&ssid=s5-e&search_type=item&sourceId=tb.index&spm=a21bo.50862.201856-taobao-item.1&ie=utf8&initiative_id=tbindexz_20170420"
end
