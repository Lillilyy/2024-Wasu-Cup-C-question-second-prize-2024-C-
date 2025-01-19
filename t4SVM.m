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


numCities = 38;
T=144;
% 定义城市之间的高铁行程时间和费用矩阵
% (假设已经从数据集中提取了相关数据)
t_ij = timeM; % 高铁行程时间矩阵
c_ij = costM; % 高铁费用矩阵

% 定义每个城市的最佳景点游玩时间和门票费用
t_i = rand(numCities, 1) * 12; % 每个城市的游玩时间（小时）
p_i = rand(numCities, 1) * 100; % 每个城市的门票费用
s_i = top_50_value(1:38) ; % 每个城市的评分

% 初始化
currentCity = 17;
totalTime = 0;
totalCost = 0;
visitedCities = [];
remainingCities = 1:numCities;

% 贪心算法
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

% SVM分类器
% 提取特征和标签
X = [t_i, p_i, s_i]; % 特征矩阵
Y = zeros(numCities, 1); % 标签矩阵，这里假设所有城市的标签都是0（可以根据实际需求修改）

% 划分训练集和测试集
cv = cvpartition(size(X, 1), 'HoldOut', 0.2);
idx = cv.test;
XTrain = X(~idx, :);
YTrain = Y(~idx, :);
XTest = X(idx, :);
YTest = Y(idx, :);

% 训练SVM模型
SVMModel = fitcsvm(XTrain, YTrain);

% 预测测试集结果
YPred = predict(SVMModel, XTest);



% 可视化结果
figure;
scatter(XTrain(:, 1), XTrain(:, 2), 'filled', 'b');
hold on;
scatter(XTest(:, 1), XTest(:, 2), 'filled', 'r');
for i = 1:length(YTrain)
    text(XTrain(i, 1), XTrain(i, 2), num2str(YTrain(i)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
end
for i = 1:length(YTest)
    text(XTest(i, 1), XTest(i, 2), num2str(YTest(i)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
end
legend('训练集', '测试集');
xlabel('每个城市的最佳景点游玩时间');
ylabel('每个城市的最佳景点门票费用');
% 其他代码保持不变

% 计算准确率
accuracy = sum(YPred == YTest) / length(YTest);
format long;
disp(['准确率： ', sprintf('%.10f', accuracy)]);





