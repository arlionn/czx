*!删除一个非空文件夹
*!程振兴 2018年7月13日
cap prog drop drm
prog define drm
	version 14.0
	syntax anything(name = dir)
	if "`c(os)'" != "MacOSX"{
		di "Windows系统可能不能使用该命令！"
	}
	local pwd = c(pwd)
	cd "`pwd'/`dir'"
	qui rcd
	local num = `r(tdirs)'
	forval i = 1/`num'{
		cap qui cd `"`r(ndir`i')'"'
		!rm -f *
		!rm -d .*
	}
	forval i = `num'(-1)1{
		cap rmdir `"`r(ndir`i')'"'
	}
	cd "`pwd'"
end
