多重共线性的判断——辅助回归的方法：auxreg命令<img src="https://github.com/czxa/Web_data_Source/raw/master/e_learning.png" align="right" />
========================================================
[![Travis](https://img.shields.io/travis/rust-lang/rust.svg?style=plastic)](http:www.czxa.top) [![](https://img.shields.io/badge/Stata-auxreg-brightgreen.svg?style=plastic)](http://www.czxa.top) [![](https://img.shields.io/badge/github-Stata-orange.svg?style=plastic)](http://www.czxa.top) [![](https://img.shields.io/badge/platform-Windows_os|Mac_os-orange.svg?style=plastic)](http://www.czxa.top) [![](https://img.shields.io/badge/Fork-302-orange.svg?style=social)](http://www.czxa.top)

### 该命令用于进行检验多重共线性的辅助回归，也就是做每一个数值型变量对其余所有数值型变量的回归，返回所有辅助回归的拟合优度、校正拟合优度或F值。注意运行该命令前需要先导入数据。

### 安装：

#### 首先你需要安装github命令，这个命令是用来安装github上的命令的：
```stata
net install github, from("https://haghish.github.io/github/")
```

#### 然后就可以安装这个命令了：
```stata
github install czxa/auxreg, replace
```
<!--more-->
#### 或者下载安装：
* 另外你也可以从这里把ado文件和sthlp文件下载下来，然后放在你的Stata安装目录里面的ado文件夹中，如果你的电脑是Mac系统，那么你需要把这两个文件放在这个文件夹里：

```
/Users/mr.cheng/Library/Application Support/Stata/ado/plus/
```

* 注意把“mr.cheng”改成你自己的电脑名字。

#### 用法：
##### 基本语法：

> auxreg[, return(string)]

* 由于多重共线性来自于某些回归元是其余回归元的准确或近似线性组合，为了找出究竟是哪一个X变量和其余X变量存在这种关系，方法之一就是做每一个X对其余X变量的回归，并计算出相应的R^2，这样的回归叫做辅助回归（auxiliary regression），以辅助Y对诸X的主回归，然后我们通过计算出的F值进行形式检验，因此本命令也提供F值。
* 除了对所有辅助回归的R^2做行驶检验外，还可采取克莱因的经验法则（Klein's rule of thumb），仅当来自一个辅助回归的R^2大于得自Y对全部回归元之间的回归的总R^2值时，多重共线性才是一个麻烦的问题。

##### 选项

* **return(string)**: 设置最终输出的是R^2、Adjusted_R^2还是F值，因此它有如下几个选项：

  * **r2**：最终输出的是所有辅助回归的R^2,同时这也是默认选项。
  * **r2_a**：最终输出的是所有辅助回归的Adjusted_R^2。
  * **F**：最终输出的是所有辅助回归的F值。
* **display**：可以简写为di。用于指定显示辅助回归的结果。
#### 示例

```js
sysuse auto, clear
auxreg
auxreg, return(r2_a)
auxreg, return(F)
auxreg, di
```

参考
----
* [__`Gujarati: Basic Econometrics, Fourth Edition, page：365`__](https://github.com/czxa/auxreg/raw/master/Gujarati-Basic-Econometrics(4E).pdf)
* [__`auxiliary regression`__](https://github.com/czxa/auxreg/raw/master/auxreg.png)
* __`这个命令是赠送给我的好朋友丁文亮的一个礼物。同时也是受他启发编写的。`__
