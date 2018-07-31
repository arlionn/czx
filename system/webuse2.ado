*! 这个是是对系统的webuse程序的改进
*! 该命令的改进思路是首先在系统文件里面寻找文件，如果查找失败再到网络上查找，最后结束。
*! 另外可以选择选项s，将查找到的数据保存到本地的系统文件夹里，方便下次查找。
*! 程振兴 2018年7月13日
program webuse2
	version 8
	if `"`0'"' == "" {
		error 198
	}
	gettoken sub : 0, parse(" ,") quotes

	if `"`sub'"'=="set" | `"`sub'"'=="query" {
		gettoken sub 0 : 0, parse(" ,")
		if "`sub'"=="set" {
			Set `0'
		}
		else	Query `0'
		exit
	}

	local 0 `"using `0'"'
	syntax using/ [, CLEAR noLabel Savetosystem]
	cap sysuse "`using'", `clear' `label'
	if _rc == 601{

		GetDefault prefix

		capture noisily use `"`prefix'/`using'"', `clear' `label'
		if _rc==0 {
			capture window menu add_recentfiles `"`prefix'/`using'"', rlevel(1)
		}
		else{
			exit _rc
		}
	}
	if "`savetosystem'" != ""{
		local prefix = substr("`using'", 1, 1)
		local syspath "`c(sysdir_plus)'"
		save "`syspath'`prefix'/`using'", replace
	}
end

program GetDefault
	args d
	if `"$S_WEB"'=="" {
		c_local `d' "http://www.stata-press.com/data/r14"
	}
	else	c_local `d' `"$S_WEB"'
end


program Set
	gettoken prefix 0 : 0, parse(" ")
	if `"`0'"' != "" {
		error 198
	}
	if `"`prefix'"'=="" {
		global S_WEB
		Query
		exit
	}
	if bsubstr(`"`prefix'"',-1,1)=="/" {
		local prefix = substr(`"`prefix'"',1,length(`"`prefix'"')-1)
	}
	if "`prefix'"=="" {
		error 198
	}
	if bsubstr(`"`prefix'"',1,7)!="http://" 			///
			& bsubstr(`"`prefix'"',1,8)!="https://" 	///
			& bsubstr(`"`prefix'"',1,6)!="ftp://"	{
		local prefix `"http://`prefix'"'
	}
	global S_WEB `"`prefix'"'
	Query
end

program Query, rclass
	syntax [, return]
	GetDefault prefix
	di as txt `"(prefix now ""' as res `"`prefix'"' as txt `"")"'
	return local prefix `"`prefix'"'
end
