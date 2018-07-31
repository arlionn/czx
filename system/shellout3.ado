*! 可供Mac使用的shellout命令
*! 程振兴 2018年7月14日
program define shellout3
    version 7.0
    syntax [anything] [using/] [,cd]
    if "`c(os)'"=="Windows" | "$S_MACH"=="PC" {
        if "`using'"~="" {
            winexec cmd /c start ""  "`using'"
        }
        else{
            if "`cd'"~="cd"{
                cap winexec `anything'
                    if _rc==193{
                        winexec cmd /c start ""  "`anything'"
                    }
                    if _rc==601{
                        noi di in yel "Cannot find `anything'. Make sure typed the name correctly."
                    }
            }
            else{
                winexec cmd /c cd `c(pwd)'\ &  `anything'
            }
        }
    }
    if "`c(os)'"=="MacOSX"{
          !open "`anything'"
    }
end
