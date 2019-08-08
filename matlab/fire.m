% 从起点处出发，访问多个目标点后，回到起点的最短路径及长度
% 输入：
%   目标点坐标的文本文件
%   起、止点
%
% 输出：
%   最短路径及长度
% Author:fmw666
% Date:2019/8/8

%% 清除工作区、清屏
clear
pack
clc
%% 数据准备
startP = [70 40];
endP = [70,40];
dt = load('sj.txt');
jd2 = dt(:,1:2:8);
jd = jd2(:);
wd2 = dt(:,2:2:8);
wd = wd2(:);
dt = [jd wd];
dt = [startP; dt; endP]
dt = dt*pi/180;  %经纬度换为角度

numOfcity = size(dt,1); %访问行数
d = zeros(numOfcity,numOfcity); %距离矩阵

for i = 1:numOfcity - 1
    for j = i + 1:numOfcity
        d(i,j) = 6370*acos(cos(dt(i,1)-dt(j,1))*cos(dt(i,2))*cos(dt(j,2))+sin(dt()));
    end
end
d = d + d';

%% 生产初始解
S = [];        %初始路径
f = inf;       %初始路径长度

fir k = 1:1000
    v = 1 + randperm(numOfcity-2);
    newS = [1, v, numOfcity]
    newf = 0;
    for j = 1:numOfcity
        newf = newf + d(newS(j, newS(j+1)));
    end
    if newf < f
        S = newS;
        f = newf;
    end
end

%% 模拟退火算法
T = 1;         %初始温度
Tf = 0.0001;   %终止温度
alpha = 0.99;  %降温速率
L = 100;       %每个温度点迭代次数

while T>Tf
    for k = 1:L;
        %随机产生(2变换法)两个点 u,v
        c = 2 + floor((numOfcity-2)*rand(1,2));
        c = sort(c);
        u = c(1);
        v = c(2);
        %计算代价函数值的增量（u,v两点间的所有点逆序后与前的路径长度差）
        df = d(S(u-1),S(v))+d(S(u),S(v+1))-d(S(u-1),S(u))-d(S(v),S(v+1));
        if df < 0 || exp(-df/T) > rand   %接受准则
            S = [S(1:u-1), S(v:-1:u), S(v+1:numOfcity)]   %接受新路径
            f = f + df;                                   %新路径长度
        end
    end
    T = T*alpha;   %降温
end

%% 输出最短路径巡视图及路径长度
disp(['路径长度=', num2str(f)]);
xx = dt(S, 1);
xx = xx*180/pi;      %经度化为角度
yy = dt(S, 2);
yy = yy*180/pi;      %纬度化为角度
plot(xx,yy,'- o')

hold on

text(xx(1)-4,yy(1)-2,'起(止)点', 'FontSize', 10, 'Color', [1 0 0]);

legend('巡视路线', '起(止)点', 0);

xlabel('经度');
ylabel('纬度');
title(['巡视路线图    ', '路径长度=', num2str(f)]);