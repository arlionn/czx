*! 执行博客园搜索
cap prog drop bkys
prog define bkys
	version 14.0
	syntax anything
	copen "http://zzk.cnblogs.com/s/blogpost?Keywords=`anything'"
end
