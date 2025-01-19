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
% 找到感兴趣的城市的索引
citiesOfInterest = top_50_cities;
indices = find(ismember(cityLabels, citiesOfInterest));

% 过滤距离矩阵，仅保留感兴趣城市的行和列
filteredMatrix = data;


city=cityLabels;
ecost=0.4;
costM=ecost*filteredMatrix;%高铁花费
timeM=filteredMatrix/200;%高铁时间

% 参数设置
numCities = 285; 
T = 144; % 总时间限制

t_ij = timeM; % 高铁行程时间矩阵
c_ij = costM; % 高铁费用矩阵（示例数据）
t_i = rand(numCities, 1) * 12; % 每个城市的山景游玩时间（小时）
p_i = rand(numCities, 1) * 100; % 每个城市的山景门票费用
s_i = rand(numCities, 1) * 10; % 每个城市的山景评分

% 初始化
bestRoute = [];
minCost = inf;
bestTime = 0;
startCities = 1:numCities; % 假设可以从任意城市入境

% 贪心算法
for startCity = startCities
    currentCity = startCity;
    totalTime = 0;
    totalCost = 0;
    visitedCities = [];
    remainingCities = 1:numCities;

    while totalTime < T
        % 标记当前城市已访问
        visitedCities = [visitedCities, currentCity];
        remainingCities(remainingCities == currentCity) = [];

        % 更新总时间和费用
        if length(visitedCities) > 1
            totalTime = totalTime + t_i(currentCity) + t_ij(visitedCities(end-1), currentCity);
            totalCost = totalCost + c_ij(visitedCities(end-1), currentCity) + p_i(currentCity);
        else
            totalTime = totalTime + t_i(currentCity);
            totalCost = totalCost + p_i(currentCity);
        end

        % 检查是否时间已超限
        if totalTime > T
            break;
        end

        % 找到评分最高且交通费用最低的城市
        bestCity = -1;
        bestScore = -inf;
        for i = remainingCities
            travelTime = t_ij(currentCity, i);
            visitTime = t_i(i);
            if totalTime + travelTime + visitTime <= T
                score = s_i(i) - c_ij(currentCity, i); % 综合评分减去交通费用
                if score > bestScore
                    bestScore = score;
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

    % 更新最佳路线和最小费用
    if totalCost < minCost
        minCost = totalCost;
        bestRoute = visitedCities;
        bestTime = totalTime;
    end
end

% 输出结果
disp('求解成功');
disp('最佳入境城市:');
disp(city(bestRoute(1)));

disp('游玩城市:');
disp(city(bestRoute));
disp('总花费时间:');
disp(bestTime);
disp('总费用:');
disp(minCost);