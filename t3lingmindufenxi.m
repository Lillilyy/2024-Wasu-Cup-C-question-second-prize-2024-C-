% 读取数据
data = xlsread('C:\Users\HUAWEI\Desktop\华数杯\第三问\灵敏度数据.xlsx');

% 提取倍率和数值
percentage_change = data(:, 1);
values = data(:, 2);

% 绘制灵敏度分析图
figure;
plot(percentage_change, values, 'k-');
xlabel('单个城市的游玩时间');
ylabel('游玩总时间');
grid on;

% 提高y轴的上下限
ylim([min(values) - 15, max(values) + 15]);








