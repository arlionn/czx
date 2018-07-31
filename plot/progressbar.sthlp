{smcl}
{* 2018年4月16日}
{hline}
{cmd:help progressbar}{right: }
{hline}

{title:标题}

{phang}
{bf:progressbar} {hline 2} 绘制进度条柱形图。{p_end}

{phang}
{stata `"sysuse auto, clear"'}
{p_end}
{phang}
{stata `"progressbar rep78, html(test1)"'}
{p_end}
{phang}
{stata `"sysuse auto, clear"'}
{p_end}
{phang}
{stata `"contract rep78"'}
{p_end}
{phang}
{stata `"progressbar rep78 _freq, html(test2)"'}
{p_end}

{title:作者}

{pstd}程振兴{p_end}
{pstd}暨南大学·经济学院·金融学{p_end}
{pstd}中国·广州{p_end}
{pstd}{browse "http://www.czxa.top":个人网站}{p_end}
{pstd}Email {browse "mailto:czxjnu@163.com":czxjnu@163.com}{p_end}
