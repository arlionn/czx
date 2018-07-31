{smcl}
{* 2018年3月9日}
{hline}
{cmd:help fangjias}{right: }
{hline}

{title:标题}

{phang}
{bf:fangjias} {hline 2} 根据给定的城市首字母缩写绘制房价走势图。{p_end}

{title:语法}

{p 8 18 2}
{cmd:fangjias} {bf: 城市的中文拼音首字母组合} {bf: [,{opt y:ear}(}{it:string}{bf:)}{bf: {opt h:eight}(}{it:string}{bf:)}{bf: {opt w:idth}(}{it:string}{bf:)}]

{pstd}{cmd: 描述:}{p_end}

{pstd}{space 3}{cmd: 城市的中文拼音首字母组合}：例如北京(bj)，上海(sh)，广州(gz)。{p_end}

{marker options}{...}
{title:选项}

{phang} {bf: {opt y:ear}(}{it:string}{bf:)}: 选择年限的长度，默认为10年。{p_end}
{phang} {bf: {opt h:eight}(}{it:string}{bf:)}: 指定图表的高度，默认为560。{p_end}
{phang} {bf: {opt w:idth}(}{it:string}{bf:)}: 指定图表的宽度，默认为680。{p_end}


{title:示例}

{phang}
{stata `"fangjias gz, y(5)"'}
{p_end}

{title:作者}

{pstd}程振兴{p_end}
{pstd}暨南大学·经济学院·金融学{p_end}
{pstd}中国广州{p_end}
{pstd}{browse "http://czxa.top":个人网站}{p_end}
{pstd}Email {browse "mailto:czxjnu@163.com":czxjnu@163.com}{p_end}
