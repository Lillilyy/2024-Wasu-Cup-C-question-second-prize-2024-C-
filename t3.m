clc                 
clear
load('t2.mat');
[data,txt]=xlsread('area.xlsx');
% 定义城市标签
cityLabels = txt(1,2:end);
for i=1:285 
    cityLabels{i}=cityLabels{i}(1:end-1);
end
distanceMatrix=data;
top_50_cities{4}='广州';
% 找到感兴趣的城市的索引
citiesOfInterest = top_50_cities;
indices = find(ismember(cityLabels, citiesOfInterest));

% 过滤距离矩阵，仅保留感兴趣城市的行和列
filteredMatrix = distanceMatrix(indices, indices);

% 显示过滤后的矩阵
disp('过滤后的距离矩阵:');
disp(filteredMatrix);

% 显示过滤后的城市标签
disp('过滤后的城市标签:');
disp(cityLabels(indices));
city=cityLabels(indices);
ecost=0.4;
costM=ecost*filteredMatrix;%高铁花费
timeM=filteredMatrix/200;%高铁时间


% 定义城市数量
numCities = 38;

% 定义城市之间的高铁行程时间和费用矩阵
% (假设已经从数据集中提取了相关数据)
t_ij = timeM; % 高铁行程时间矩阵（示例数据）
c_ij = costM; % 高铁费用矩阵（示例数据）

% 定义每个城市的最佳景点游玩时间和门票费用
t_i = rand(numCities, 1) * 12; % 每个城市的游玩时间（小时）（示例数据）
p_i = rand(numCities, 1) * 100; % 每个城市的门票费用（示例数据）
s_i = top_50_value(1:38) * 10; % 每个城市的评分（示例数据）

% 定义城市数量
numCities = 38;


% 定义总时间限制（144小时）
T = 144;

% 初始城市
currentCity = 22;

% 初始化总时间和费用
totalTime = 0;
totalTicketCost = 0;
totalTransportCost = 0;
visitedCities = [];

% 贪心算法选择城市
while true
    % 标记当前城市已访问
    visitedCities = [visitedCities, currentCity];
    
    % 更新总时间和费用
    if length(visitedCities) > 1
        totalTime = totalTime + t_i(currentCity) + t_ij(visitedCities(end-1), currentCity);
        totalTransportCost = totalTransportCost + c_ij(visitedCities(end-1), currentCity);
    else
        totalTime = totalTime + t_i(currentCity);
    end
    totalTicketCost = totalTicketCost + p_i(currentCity);
    
    % 检查是否时间已超限
    if totalTime > T
        break;
    end
    
    % 找到评分最高且未访问且时间可行的城市
    bestCity = -1;
    bestScore = -inf;
    for i = 1:numCities
        if ~ismember(i, visitedCities) && (totalTime + t_ij(currentCity, i) + t_i(i)) <= T
            if s_i(i) > bestScore
                bestScore = s_i(i);
                bestCity = i;
            end
        end
    end
    
    % 如果没有找到合适的下一个城市，则结束
    if bestCity == -1
        break;
    end
    
    % 更新当前城市为选择的最佳城市
    currentCity = bestCity;
end

% 输出结果
disp('求解成功');
disp('游玩城市:');
disp(city(visitedCities));
disp('总花费时间:');
disp(totalTime);
disp('总门票费用:');
disp(totalTicketCost);
disp('总交通费用:');
disp(totalTransportCost);