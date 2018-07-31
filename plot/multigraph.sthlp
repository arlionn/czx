{smcl}
{* 2017年11月30日}
{hline}
{cmd:help multigraph}{right: }
{hline}

{title:标题}

{phang}
{bf:multigraph} {hline 2} 这个命令的作用是获取内存中的变量，筛选出数值型变量，然后绘制出每个变量的直方图或者核密度图并合并到一张图上。{p_end}

{pstd}
这样可以更加直观的观察该数据集中的数值型变量的基本特征。
{p_end}

{pstd} 
这个命令的帮助文档完全使用中文书写，希望这样能方便我的朋友们使用。
{p_end}

{pstd}{browse "https://github.com/czxa/multigraph/raw/master/hist.png":示例结果图片}{p_end}

{title:语法}

{p 8 18 2}
{cmdab:multigraph} {cmd:,} [{cmd:graphtype(}{it:hist/kdensity}{cmd:)} {cmd:savegraph} {cmd:fmt(}{it:png/pdf/···}{cmd:)} {cmd:density} {cmd:title(}{it:string}{cmd:)}]

{marker options}{...}
{title:选项}

{phang}
{opt graphtype(string)}: 可以简写为{cmd:gt}， 用来选择绘图的类型，有hist（绘制直方图）和kdensity（绘制核密度图）两种选择。默认为hist。{p_end}

{phang}
{opt savegraph}: 可以简写为{cmd:sg}，用来指定是否保存最后生成的图片，默认不保存。{p_end}

{phang}
{opt density}: 只能在graphtype为hist的时候使用，如果gt(kdensity)和density同时出现，会自动忽略density。
在使用gt(hist)时，如果使用density，会绘制频率分布直方图而非频数分布直方图。{p_end}

{phang}
{opt title(string)}: 指定输出图片的标题。默认标题为绘图类型。{p_end}

{phang}
{opt fmt(string)}: 指定输出图片的格式，有ps/eps/wmf/emf/pdf/png/tif七种图片导出的格式。默认为png格式。{p_end}

{title:示例}

{phang}
{stata `"sysuse auto, clear"'}
{p_end}
{phang}
{stata `"multigraph"'}
{p_end}
{phang}
{stata `"multigraph, gt(kdensity)"'}
{p_end}
{phang}
{stata `"multigraph, gt(kdensity) sg"'}
{p_end}
{phang}
{stata `"multigraph, gt(kdensity) sg fmt(pdf)"'}
{p_end}
{phang}
{stata `"multigraph, gt(hist) sg fmt(pdf) density"'}
{p_end}
{phang}
{stata `"multigraph, gt(hist) sg fmt(pdf) density title(合并频率分布直方图)"'}
{p_end}

{p 4 4 2}
我们也可以提前删除我们不感兴趣的变量然后绘图：

{phang}
{stata `"drop foreign gear_ratio displacement"'}
{p_end}
{phang}
{stata `"multigraph, gt(hist) sg fmt(pdf) density"'}
{p_end}
{phang}
{stata `"keep price rep78"'}
{p_end}
{phang}
{stata `"multigraph, gt(hist) sg fmt(pdf) density"'}
{p_end}

{title:作者}

{pstd}程振兴{p_end}
{pstd}暨南大学·经济学院·金融学{p_end}
{pstd}中国·广州{p_end}
{pstd}{browse "http://www.czxa.top":个人网站}{p_end}
{pstd}Email {browse "mailto:czxjnu@163.com":czxjnu@163.com}{p_end}

{title:Also see}
{phang}
{stata `"help format"'}
{p_end}
{phang}
{stata `"help kdensity"'}
{p_end}
{phang}
{stata `"help histogram"'}
{p_end}