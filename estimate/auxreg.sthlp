{smcl}
{* 05Dec2017}{...}
{hline}
{cmd:help auxreg}{right: }
{hline}

{title:标题}

{phang}
{bf:czxah} {hline 2} 该命令用于进行检验多重共线性的辅助回归，也就是做每一个数值型变量对其余所有数值型变量的回归，返回所有辅助回归的R^2、Adjusted_R^2或F值。注意运行该命令前需要先导入数据。

{title:语法}

{p 8 18 2}
{cmdab:auxreg} {cmd:,} [{cmd:return(}{it:string}{cmd:)}]

{marker description}{...}
{title:描述}

{pstd}
{space 2}由于多重共线性来自于某些回归元是其余回归元的准确或近似线性组合，为了找出究竟是哪一个X变量和其余X变量存在这种关系，方法之一就是做每一个X对其余X变量的回归，并计算出相应的R^2，这样的回归叫做辅助回归（auxiliary regression），以辅助Y对诸X的主回归，然后我们通过计算出的F值进行形式检验，因此本命令也提供F值。
{p_end}
{pstd}
{space 2}除了对所有辅助回归的R^2做形式检验外，还可采取克莱因的经验法则（Klein's rule of thumb），仅当来自一个辅助回归的R^2大于得自Y对全部回归元之间的回归的总R^2值时，多重共线性才是一个麻烦的问题。
{p_end}

{marker options}{...}
{title:选项}

{phang}
{cmd:return(}{it:string}{cmd:)}: 设置最终输出的是R^2、Adjusted_R^2还是F值，因此它有如下几个选项：

{pstd} {hi:{space 4}r2} 最终输出的是所有辅助回归的R^2,同时这也是默认选项。 {p_end}
{pstd} {hi:{space 4}r2_a} 最终输出的是所有辅助回归的Adjusted_R^2。{p_end}
{pstd} {hi:{space 4}F} 最终输出的是所有辅助回归的F值。{p_end}

{phang}
{opt di:splay}:指定是否显示辅助回归的结果。

{title:示例}

{phang}
{stata `"sysuse auto, clear"'}
{p_end}
{phang}
{stata `"auxreg"'}
{p_end}
{phang}
{stata `"auxreg, return(r2_a)"'}
{p_end}
{phang}
{stata `"auxreg, return(F)"'}
{p_end}
{phang}
{stata `"auxreg, di"'}
{p_end}

{title:作者}

{pstd}程振兴{p_end}
{pstd}暨南大学·经济学院·金融学{p_end}
{pstd}中国·广州{p_end}
{pstd}{browse "http://www.czxa.top":个人网站}{p_end}
{pstd}Email {browse "mailto:czxjnu@163.com":czxjnu@163.com}{p_end}

{title:参考}
{phang} 
{space 2}{browse "https://github.com/czxa/auxreg/raw/master/Gujarati-Basic-Econometrics(4E).pdf":Gujarati: Basic Econometrics, Fourth Edition, page：365}
{p_end}
{phang} 
{space 2}{browse "https://github.com/czxa/auxreg/raw/master/auxreg.png":auxiliary regression}
{p_end}
{phang} 
{space 2}这个命令是赠送给我的好朋友丁文亮的一个礼物。同时也是受他启发编写的。
{p_end}