# Matlab 入门教程
> 参考文档[《Matlab基础及其应用教程》](docs/Matlab%E5%9F%BA%E7%A1%80%E5%8F%8A%E5%85%B6%E5%BA%94%E7%94%A8%E6%95%99%E7%A8%8B.pdf)（链接到 pdf 文件下载）

<div align="center">
    <img src="pics/titlepic.jpg" width="200">
</div>

## 📚 目录

💡 [**温馨提示：**](#welcome)此文章不完全参考上述文档，下面介绍会尽量体现实用性，不保证完整性，必要知识点还请在文档中查看。

+ [Matlab 发展简介](#matlab-发展简介)

+ [Matlab 安装教程](#matlab-安装教程)

+ [Matlab 数据类型之矩阵](#matlab-数据类型之矩阵)

+ [Matlab 矩阵（数值）运算](#matlab-矩阵数值运算)

+ [Matlab 图形与可视化](#matlab-图形与可视化)

+ [Matlab 符号运算（Symbolic）](#matlab-符号运算symbolic)

## Matlab 发展简介

&emsp;&emsp;20 世纪 70 年代中后期，曾在密西根大学、斯坦福大学和新墨西哥大学担任数学与计算机科学教授的 Cleve Moler 博士，为讲授矩阵理论和数值分析课程的需要，他和同事用 Fortran 语言编写了两个子程序库，这便是构思和开发 Matlab 的起点。Matlab 一词是对 Matrix Laboratory（矩阵实验室）的缩写，由此可以看出 Matlab 与矩阵计算的渊源。

&emsp;&emsp;为进一步推动 Matlab 应用，在 20 世纪 80 年代初，John Little 等人将先前的 Matlab 全部用 C 语言进行改写，形成了新一代的 Matlab。1984 年，Cleve Moler 和 John Little 等人成立 MathWorks 公司，并于同年向市场推出了第一个 Matlab 的商业版本。

&emsp;&emsp;发展到今天版本，Matlab 已经不再是仅仅解决矩阵与数值计算的软件了，更是一种集数值与符号运算、数据可视化图形表示与图形界面设计、程序设计、仿真等多种功能于一体的集成软件。

<div align="right">
    <a href="#-目录">返回目录⬆</a>
</div>

## Matlab 安装教程

&emsp;&emsp;这儿给别人家打个广告（更或者说是一种安利），微信公众号搜索：[软件安装管家](#welcome)。

&emsp;&emsp;以我安装的 R2015a 版本为例，

<div align="right">
    <a href="#-目录">返回目录⬆</a>
</div>

## Matlab 数据类型之矩阵

+ **定义矩阵**：直接输入法

    ```matlab
    >> A = [1 2 3; 4 5 6; 7 8 9]
    ```

    + 矩阵用方括号 “[[ ]](#welcome)” 括起
    + 矩阵同一行中的元素之间用 [空格](#welcome) 或 [逗号](#welcome) 分隔
    + 矩阵行与行之间用 [分号](#welcome) 分开
    + 直接输入法中，分号可以用 [回车](#welcome) 代替，例：
        ```matlab
        >> A = [1 2 3
        4 5 6
        7 8 9; 1 2 3]
        ```

+ **矩阵元素赋值**

    + 矩阵元素可以是任何数值表达式，例：
        ```matlab
        >> x = [-1.3, sqrt(3), (1+2+3)*4/5]
        ```
    
    + 矩阵元素单独的赋值，例：
        ```matlab
        >> x(5) = abs(x(1))
        ```
        > Matlab 自动将向量 x 的长度扩展到 5，并将未赋值部分置零。

    + 大矩阵可以把小矩阵作为其元素，例：
        ```matlab
        >> A = [A ; 11 12 13]
        ```
        > 等同于在原矩阵 A 的下方新加一行 

+ **矩阵元素的引用**

    + 单个元素的引用，例：
        ```matlab
        >> A(2,3)
        ```
        > x(i):向量 x 中第 i 个元素；A(i,j):矩阵 A 中第 i 行，第 j 列元素

    + 多个元素的引用：冒号的特殊用法
        ```matlab
        >> x = 1:2:5
        >> y = 2:1:5
        >> z = 3:2:1 
        ```
        > 产生一个由等差序列组成的向量：a 是首项，b 是公差，c 确定最后一项（若 b=1，则 b 可以省略）

        ```matlab
        >> x(1:3)
        >> A(3, 1:3)
        ```
        > A(i:j, m:n) 表示由矩阵 A 的第 i 到第 j 行和第 m 到第 n 列交叉线上的元素组成的子矩阵。

        可以利用冒号提取矩阵的整行或整列：
        ```matlab
        >> A(1, :)
        >> A(:, 1:3)
        >> A(:, :)
        ```

<div align="right">
    <a href="#-目录">返回目录⬆</a>
</div>

## Matlab 矩阵（数值）运算

+ **建立矩阵的常用函数**

    |函数名|作用|
    |:--:|:--:|
    |zeros(m,n)|生成一个 m 行 n 列的零矩阵，<br>m=n 时可简写成 zeros(n)|
    |ones(m,n)|生成一个 m 行 n 列的元素全为 1 的矩阵，<br>m=n 时可写成 ones(n)|
    |eye(m,n)|生成一个主对角线全为 1 的 m 行 n 列矩阵，<br>m=n 时可简写成 eye(n)，即为 n 维单位矩阵|
    |diag(X)|若 X 是矩阵，则 diag(X) 为 X 的主对角线向量<br>若 X 是向量，则 diag(X) 产生以 X 为主对角线的对角矩阵|
    |tril(A)|提取一个矩阵的下三角部分|
    |triu(A)|提取一个矩阵的上三角部分|
    |rand(m,n)|产生 0~1 间均匀分布的随机矩阵，<br>m=n 时简写成 rand(n)|
    |randn(m,n)|产生均值为 0，方差为 1 的标准正态分布随机矩阵，<br>m=n 时简写成 randn(n)|
    |其它特殊矩阵生成函数：magic、hilb、pascal|（可使用如 help magic、doc magic 等命令来查看指令帮助说明）|


<div align="right">
    <a href="#-目录">返回目录⬆</a>
</div>

## Matlab 图形与可视化

<div align="right">
    <a href="#-目录">返回目录⬆</a>
</div>

## Matlab 符号运算（Symbolic）

<div align="right">
    <a href="#-目录">返回目录⬆</a>
</div>

<div align="center">
    <hr>--完--
</div>