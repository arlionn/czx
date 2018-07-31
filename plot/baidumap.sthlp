{smcl}
{* 2018年3月22日}
{hline}
{cmd:help baidumap}{right: }
{hline}

{title:标题}

{phang}
{bf:baidumap} {hline 2} Stata+ECharts调用指定位置的百度地图。{p_end}

{pstd}{browse "https://github.com/czxa/baidumap/raw/master/baidumap.png":示例图片}{p_end}


{title:语法}

{p 8 18 2}
{cmd:baidumap}{bf: [, {opt add:ress}(}{it:string}{bf:) {opt html:name}(}{it:string}{bf:) zoom(}{it:numeric}{bf:)]}


{marker options}{...}
{title:选项}

{phang} {bf: {opt add:ress}(}{it:string}{bf:)}: 指定百度地图的中心位置，默认值为暨南大学番禺校区；{p_end}
{phang} {bf: {opt html:name}(}{it:string}{bf:)}: 设置html文件的名称，默认值为fw_example.html；{p_end}
{phang} {bf: zoom(}{it:string}{bf:)}: 指定地图的放大倍数，默认值为16；{p_end}

{title:示例}

{phang}
{stata `"baidumap, add(暨南大学番禺校区) html(暨南大学番禺校区) zoom(16)"'}
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
