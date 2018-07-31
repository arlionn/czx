{smcl}
{* 2018年3月27日}
{hline}
{cmd:help rainbowbar}{right: }
{hline}

{title:标题}

{phang}
{bf:rainbowbar} {hline 2} Stata + Echarts绘制彩虹柱条图{p_end}

{pstd}{browse "https://github.com/czxa/rainbowbar/raw/master/rainbowbar.png":示例图片}{p_end}


{title:语法}

{p 8 18 2}
{cmd:rainbowbar} {bf: 一到两个变量} {bf: [, {opt ti:tle}(}{it:string}{bf:) {opt html:name}(}{it:string}{bf:)}{bf: text1(}{it:string}{bf:)}{bf: text2(}{it:string}{bf:)}{bf: bargap(}{it:string}{bf:)}{bf: sort]}

{pstd}{cmd: 描述:}{p_end}

{pstd}{space 3}{cmd: arg}: 需要可视化的变量，可以是一个变量例如auto数据集里面的rep78变量，也可以是两个变量，例如contract rep78得到的两个变量。{p_end}

{title:示例}

{phang}
{stata `"sysuse auto, clear"'}
{p_end}
{phang}
{stata `"rainbowbar rep78, html(temp1) ti(汽车维修次数柱形图) text1(维修次数) text2(样本数) bargap(20)"'}
{p_end}

{phang}
{stata `"sysuse auto, clear"'}
{p_end}
{phang}
{stata `"contract rep78"'}
{p_end}
{phang}
{stata `"rainbowbar rep78 _freq, html(temp2) ti(汽车维修次数柱形图) text1(维修次数) text2(样本数) bargap(10)"'}
{p_end}


{title:作者}

{pstd}程振兴{p_end}
{pstd}暨南大学·经济学院·金融学{p_end}
{pstd}中国·广州{p_end}
{pstd}{browse "http://www.czxa.top":个人网站}{p_end}
{pstd}Email {browse "mailto:czxjnu@163.com":czxjnu@163.com}{p_end}

{title:Also see}
{phang}
{stata `"help fw"'}
{p_end}
