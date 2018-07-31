*! sysdir的加强版——可以直接打开各个系统文件夹
*! 程振兴 2018年7月13日
cap prog drop sysdir2
prog def sysdir2, rclass
	version 12.0
	if "`c(os)'" != "MacOSX"{
		di "Windows系统可能不能使用该命令！"
	}
	di `"STATA: {stata copen `c(sysdir_stata)':`c(sysdir_stata)'}"'
	di `"BASE: {stata copen `c(sysdir_base)':`c(sysdir_base)'}"'
	di `"SITE: {stata copen `c(sysdir_site)':`c(sysdir_site)'}"'
	di `"PLUS: {stata copen `c(sysdir_plus)':`c(sysdir_plus)'}"'
	di `"PERSONAL: {stata copen `c(sysdir_personal)':`c(sysdir_personal)'}"'
	di `"OLDPLACE: {stata copen `c(sysdir_oldplace)':`c(sysdir_oldplace)'}"'
	di `"当前工作目录: {stata copen `c(pwd)':`c(pwd)'}"'
end
