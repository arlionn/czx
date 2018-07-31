capture program drop auxreg
program define auxreg
	version 12.0
	syntax, [Return(string) DIsplay]
	if "`return'" == ""{
		local return = "r2"
	}
	foreach i of varlist _all{ 
		cap confirm numeric variable `i'
		if _rc == 0{
			preserve
			drop `i'
			global z = ""
			foreach j of varlist _all{
				cap confirm numeric variable `j'
				if _rc == 0{
					global z = "$z `j'"
				}
			}
			restore
			if 	"`di'" == ""{
				qui reg `i' $z
			}
			else{
				reg `i' $z
			}
			if "`return'" == "r2"{
				global a = e(r2)
				di "以`i'为被解释变量的回归的R^2为" $a
			}
			if "`return'" == "F"{
				global a = e(F)
				di "以`i'为被解释变量的回归的F值为" $a
			}
			if "`return'" == "r2_a"{
				global a = e(r2_a)
				di "以`i'为被解释变量的回归的Adjusted_R^2值为" $a
			}
			if "`return'" != "r2" & "`return'" != "F" & "`return'" != "r2_a"{
				di "你输入了错误的选项！请重新输入！"
			}
		}
	}
end
