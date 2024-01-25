% 导入数据
x_all = xlsread("./data/附件1：154个地点的平面直角坐标及距离数据.xlsx", "地点（横、纵）坐标", "B2:B155");
y_all = xlsread("./data/附件1：154个地点的平面直角坐标及距离数据.xlsx", "地点（横、纵）坐标", "C2:C155");
start_points = xlsread("./data/附件1：154个地点的平面直角坐标及距离数据.xlsx", "地点间道路", "A2:A249"); % 起点编号
end_points = xlsread("./data/附件1：154个地点的平面直角坐标及距离数据.xlsx", "地点间道路", "B2:B249"); % 终点编号
dis_all = xlsread("./data/附件1：154个地点的平面直角坐标及距离数据.xlsx", "地点间道路", "C2:C249");
army_users = [125	106	73	31	141	150	85	79	1	130	36	27	34	42	94	11	24	75	145	22];

% 作图
P1 = plot(x_all, y_all, '.r'); % 普通点
hold on;
P2 = plot(x_all(16), y_all(16), '*r'); plot(x_all(63), y_all(63), '*r'); plot(x_all(120), y_all(120), '*r'); % 生产基地
hold on;
for i = 1:20 % 军队用户
    P3 = plot(x_all(army_users(i)), y_all(army_users(i)), 'or');
end
hold on;
% line([x_all(start_points(1)), x_all(end_points(1))], [y_all(start_points(1)), y_all(end_points(1))])
for i = 1:size(start_points) % 连线
    plot([x_all(start_points(i)), x_all(end_points(i))], [y_all(start_points(i)), y_all(end_points(i))], '-b')
end
hold on;

% 添加图例注记
title("154个地点的平面直角坐标图");
xlabel("横坐标x轴");
ylabel("纵坐标y轴");
legend([P1, P2, P3], "普通据点", "生产基地", "军队用户");
grid on;
