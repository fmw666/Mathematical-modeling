# Matlab 入门教程
> 参考文档[《Matlab基础及其应用教程》](#welcome)（链接到 pdf 文件下载）

+ 在命令窗口（Command Window）中依次键入以下命令：
    ```matlab
    >> x = 1

    x = 

        1
        
    >> y = [1 2 3
            4 5 6
            7 8 9];

    >> z1 = [1:10], z2 = [1:2:5];

    z1 =

        1   2   3   4   5   6   7   8   9   10

    >> w = linspace(1,10,10);

    >> t1 = ones(3), t2 = ones(1,3), t3 = ones(3,1)

    >> t4 = zeros(3); t5 = eye(4);
    ```
    + 变量如何声明，变量名须遵守什么规则、是否区分大小写？
        - 变量通过赋予它某类数据类型来进行申明，如 x=1 （赋予整型数值1给变量x）。
        - 变量名命名规则为字母+下划线+数字的组合，其中只有字母才能作为首字母，区分大小写。
    + 试说明分号、逗号、冒号的用法。
        - 分号用于当前语句的分割，但不在这条语句结束时执行，例如要在一条语句中申明x和y两个值为1的变量并执行。则可以’x = 1; y= 1;’。
        - 逗号用于当前语句的分割，但会在这条语句结束时执行，例如要在一条语句中申明x和y两个值为1的变量并不执行，则可以’x = 1, y = 1’。
        - 冒号用于对数段进行分割划分，例如’z = [1:10]’ 表示z为1到10，长度单位为1的行向量,z = [1,2,3,…,10]，其中可以在数值前后端中间添加数以改变分割的长度单位，如’z = [1:3:10]’，z = [1 4 7 10]。
    + linspace()称为“线性等分”函数，说明它的用法。可使用help命令，格式如下：`help linspace`
        - 和上面说的冒号用法大体类似，linspace(a,b,*n)，其中n为可选参数，a、b表示被等分分割的起始和终止位置，若不带可选参数n，则默认等分100份，若带上可选参数n，如n=1，则在a到b之间等分10（n）份