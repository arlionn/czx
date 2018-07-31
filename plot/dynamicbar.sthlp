{smcl}
{* 2018年4月16日}
{hline}
{cmd:help dynamicbar}{right: }
{hline}

{title:标题}

{phang}
{bf:dynamicbar} {hline 2} 绘制可伸缩的柱形图。{p_end}

{phang}
{stata `"sysuse auto, clear"'}
{p_end}
{phang}
{stata `"dynamicbar rep78"'}
{p_end}
{phang}
{stata `"dynamicbar rep78, sch(macarons)"'}
{p_end}
{phang}
{stata `"sysuse auto, clear"'}
{p_end}
{phang}
{stata `"contract rep78"'}
{p_end}
{phang}
{stata `"dynamicbar rep78 _freq, html(test2)"'}
{p_end}

{title:作者}

{pstd}程振兴{p_end}
{pstd}暨南大学·经济学院·金融学{p_end}
{pstd}中国·广州{p_end}
{pstd}{browse "http://www.czxa.top":个人网站}{p_end}
{pstd}Email {browse "mailto:czxjnu@163.com":czxjnu@163.com}{p_end}
