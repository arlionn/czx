*! exrate3: 从雅虎财经获取汇率数据
*! 程振兴 2018年8月20日
*! 示例：
*!	获取美元兑换人民币的数据：exrate3 USDCNY
*!	获取美元兑换俄罗斯卢布的数据：exrate3 USDRUB
cap prog drop exrate3
prog def exrate3
syntax anything
	qui{
		!curl "https://query1.finance.yahoo.com/v8/finance/chart/`anything'=X?region=US&lang=en-US&includePrePost=false&interval=1d&range=60y&corsDomain=finance.yahoo.com&.tsrc=finance" --progress | tr "," "\n" | tr "]" "\n" | tr "[" "\n"> temp.txt
		infix strL v 1-20000 using temp.txt, clear
		replace v = "-9" if v == "null"
		destring, replace force
		drop if v == .
		tostring _all, replace force
		local count = _N/7
		forval i = 0/6{
			preserve
			local j = `i' * (`count'-1) + `i' + 1
			keep if inrange(_n, `j', `j'+(`count'-1))
			gen n = _n
			ren v v`i'
			save `i', replace
			restore
		}
		use 0, clear
		forval i = 1/6{
			merge 1:1 n using `i'
			drop _m
		}
		drop n
		ren v0 date
		ren v1 open
		ren v2 volume
		ren v3 high
		ren v4 low
		ren v5 close
		ren v6 adjclose
		!rm *.dta
		!rm *.txt
		destring, replace
		* 算好差值把时间戳转为北京时间
		replace date = date * 1000 + tc(1 jan 1970 00:00:00) + 28827000
		tostring date, replace force format(%tCCCYY-NN-DD_HH:MM:SS)
		replace date = substr(date, 1, 10)
		compress
		foreach i of varlist _all{
			cap replace `i' = . if `i' < 0
		}
	}
	di "数据来源：雅虎财经"
end

* exrate3 USDRUB
exrate3 USDCNY