{smcl}
{* 2018年3月8日}
{hline}
{cmd:help stcnmap}{right: }
{hline}

{title:标题}

{phang}
{bf:stcnmap} {hline 2} 在Stata中进行中英文单词词语句子互译。{p_end}

{pstd}{browse "https://github.com/czxa/stcnmap/raw/master/stcnmap.png": 示例图片}{p_end}

{title:语法}

{p 8 18 2}
{cmdab:stcnmap} {cmd: 省份} {cmd: 值} {cmd:,} [{cmd:{opt ti:tle}} {cmd:{opt subti:tle}} {cmd:{opt html:name}}]

{marker options}{...}
{title:选项}

{phang}
{cmd: {opt ti:tle}}: 图表标题。{p_end}

{phang}
{cmd:{opt subti:tle}}: 图表副标题。{p_end}

{phang}
{opt html:name}: html文件的名称。{p_end}

{title:示例}

{phang}
{stata `"cuse jd2017zsjh, c w"'}
{p_end}
{phang}
{stata `"stcnmap 省份 年计划数"'}
{p_end}

{title:作者}

{pstd}程振兴{p_end}
{pstd}暨南大学·经济学院·金融学{p_end}
{pstd}中国·广州{p_end}
{pstd}{browse "http://www.czxa.top":个人网站}{p_end}
{pstd}Email {browse "mailto:czxjnu@163.com":czxjnu@163.com}{p_end}
