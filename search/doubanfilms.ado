*! 执行豆瓣电影搜索
cap prog drop doubanfilms
prog define doubanfilms
	version 14.0
	syntax anything
	copen "http:\/\/movie.douban.com\/subject_search?search_text=`anything'\&cat=1002"
end
