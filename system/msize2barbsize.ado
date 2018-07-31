* 绘制一幅msize选项和barbsize选择之间的关系图
cap prog drop msize2barbsize
prog define msize2barbsize
	version 14.0
	cap preserve
	clear all
	local cmd
	qui forval x = 1/7{
		forval y = 0/`x'{
			local x1 = `x' + 0.5
			local cmd (pcarrowi `y' `x' `y' `x1', msize(`x') barbsize(`y')) `cmd' 
		}
	}
	qui gr tw `cmd', yla(0(1)8, ang(0)) xla(1(1)8) leg(off) yti("barbsize()") xti("msize()") plotr(color(white)) ti(msize选项和barbsize选择之间的关系图)
end
