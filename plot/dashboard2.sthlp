{smcl}
{* 2018年3月27日}
{hline}
{cmd:help dashboard2}{right: }
{hline}

{title:标题}

{phang}
{bf:dashboard2} {hline 2} Stata+ECharts绘制仪表盘。（这个比较扁平化）{p_end}

{pstd}{browse "https://github.com/czxa/dashboard2/raw/master/dashboard2.png":示例图片}{p_end}


{title:语法}

{p 8 18 2}
{cmd:dashboard2} {bf: arg} {bf: [, {opt ti:tle}(}{it:string}{bf:) {opt html:name}(}{it:string}{bf:)}{bf: {opt sch:eme}(}{it:string}{bf:)]}

{pstd}{cmd: 描述:}{p_end}

{pstd}{space 3}{cmd: arg}: 指定仪表盘指针的位置。{p_end}


{marker options}{...}
{title:选项}

{phang} {bf: {opt ti:tle}(}{it:string}{bf:)}: 指定仪表盘上的文字      {p_end}
{phang} {bf: {opt html:name}(}{it:string}{bf:)}:设置html文件的名称，默认值为fw_example.html；{p_end}
{phang} {bf: {opt sch:eme}(}{it:string}{bf:)}:控制绘图的主题，有dark/roma/vintage/macarons/infographic/shine六种可选，默认值为macarons；{p_end}

{title:示例}

{phang}
{stata `"dashboard2 15.6, ti(利率) html(仪表盘)"'}
{p_end}
{phang}
{stata `"dashboard2 15.6, ti(利率) html(仪表盘) sch(dark)"'}
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
