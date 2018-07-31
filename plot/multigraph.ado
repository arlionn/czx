*! multigraph 
*! version 1.0
*! 作者：程振兴
*! 中国广州
*! 暨南大学经济学院
*! 功能：获取内存中的变量，筛选出数值型变量，然后绘制出每个变量的直方图或者核密度图并合并到一张图上
capture program drop multigraph
program define multigraph
	version 14.0
	syntax, [GRAPHType(string) DENsity]
	if "`graphtype'" == "" local graphtype = "hist"
	if "`graphtype'" == "kdensity" & "density" != ""{
		di as error "kdensity绘图时不能使用density选项！"
		exit 198
	}
	graph drop _all
	foreach i of varlist _all{
		cap confirm numeric variable `i'
		if _rc == 0{
			if "`graphtype'" == "hist"{
				if "`density'" == ""{
					qui hist `i', name(`i') freq nodraw
					local z "`z' `i'"
				}
				else{
					qui hist `i', name(`i') nodraw
					local z "`z' `i'"
				}
				
			}
			if "`gt'" == "kdensity"{
				qui kdensity `i', name(`i') nodraw
				local z "`z' `i'"
			}
		}
	}
	graph combine `z'
	graph export "`title'.`fmt'" , replace as(`fmt')	
end
