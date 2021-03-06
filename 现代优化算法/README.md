## 现代优化算法

&emsp;&emsp;优化算法我们要优化个啥？啥又是现代优化算法？

&emsp;&emsp;优化算法呢通俗来讲，一个带参数 θ（theta）的目标函数，我想求该函数的最小值（或最大值，也可称为最优值），有时，该函数会存在一定量局部最小值，我们为了找到导致最小值的参数集的算法称为优化算法。而现代优化算法旨在基于直观或经验构造的算法，在可接受的花费（指计算时间和空间）下给出待解决组合优化问题每一个实例的一个可行解，该可行解与最优解的偏离程度一般不能被预计，即该可行解不一定是我们所需的最优解。

&emsp;&emsp;打个比方来说，对于一元二次方程：`f(x) = x²` （定义域为实属 R 集）来说，当其 `x = 0` 时存在最优解（最小值解）。当然，这个方程是我们心算可知的最优值答案，这儿只做举例指出。但对于我的现代优化算法，旨在构建一个优化模型，能帮助我找到一定量的可行解（前提是误差结果可接受），所以我的可行解集合可能为 `{0.00012, 0.00009, -0.00011, -0.00007, ...}`。相干概念还有很多很多，但我不做过多介绍，更深层次的对于我本科非数学专业来说也了解甚少，下面我们直接来看相关算法和示例，这样更能让我们对其更好地加强理解。

&emsp;&emsp;比较常见的现代优化算法有很多，这里只介绍三种，[遗传算法]()、[模拟退火算法]()、[蚁群算法]()。特别强调，现代优化算法也可称为启发式算法，什么意思呢？就是现代人受到了某些外在启发而发明了一系列算法。看上面算法名字你也许也能感受到，遗传借鉴生物的物竞天择、自然进化，模拟退火借鉴的是金属受热原子为趋于稳定的运动状态规律，退火一词来源于冶金学，蚁群算法则是借鉴蚂蚁寻找最短路径的方法...如果你觉得是偶然，那么我再说几种启发式算法（现代优化算法）的名字，自己感受一下？鱼群算法、粒子群算法、人工神经网络算法...