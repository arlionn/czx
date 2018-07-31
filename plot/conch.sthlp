{smcl}
{* 2018年4月16日}
{hline}
{cmd:help conch}{right: }
{hline}

{title:标题}

{phang}
{bf:conch} {hline 2} 绘制一幅海螺图，差不多是极坐标系的柱形图。{p_end}

{phang}
{stata `"clear"'}
{p_end}
{phang}
{stata `"input strL 国家 比例"'}
{p_end}
{phang}
{stata `""中国" 100"'}
{p_end}
{phang}
{stata `""美国" 50"'}
{p_end}
{phang}
{stata `""日本" 70"'}
{p_end}
{phang}
{stata `""俄罗斯" 80"'}
{p_end}
{phang}
{stata `""印度" 90"'}
{p_end}
{phang}
{stata `""德国" 60"'}
{p_end}
{phang}
{stata `""英国" 40"'}
{p_end}
{phang}
{stata `"end"'}
{p_end}
{phang}
{stata `"conch 国家 比例, title(一个示例)"'}
{p_end}

{title:作者}

{pstd}程振兴{p_end}
{pstd}暨南大学·经济学院·金融学{p_end}
{pstd}中国·广州{p_end}
{pstd}{browse "http://www.czxa.top":个人网站}{p_end}
{pstd}Email {browse "mailto:czxjnu@163.com":czxjnu@163.com}{p_end}
