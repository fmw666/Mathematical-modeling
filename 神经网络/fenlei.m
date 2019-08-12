%traingd
clear;
clc;
%P=[1.24 1.36 1.38 1.38	1.38 1.40 1.48 1.54	1.56 1.14 1.18 1.20	1.26 1.28 1.30; 1.27 1.74 1.64 1.82	1.90 1.70 1.82 1.82	2.08 1.78 1.96 1.86 2.00 2.00 1.96 ]
P=[-1 -1 2 2 4;0 5 0 5 7];
%T=[ones(1,9) zeros(1,6)]
T=[-1 -1 1 1 -1];
%利用minmax函数求输入样本范围
net = newff(minmax(P),[5,1],{'tansig','purelin'},'trainrp');

net.trainParam.show=50;
net.trainParam.lr=0.05;
net.trainParam.epochs=500;
net.trainParam.goal=1e-5;
[net,tr]=train(net,P,T);

b1=net.iw{1,1}%隐层权值
b0=net.b{1}%隐层阈值

b2=net.lw{2,1}%输出层权值
b20=net.b{2}%输出层阈值

sim(net,P)