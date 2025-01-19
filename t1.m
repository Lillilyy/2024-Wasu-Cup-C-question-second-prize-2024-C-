clc
clear

% 设定文件名
filename = 't1.xlsx';

% 使用xlsread读取数据
[num, txt, raw] = xlsread(filename);

% 假设第一列是城市名，第二列是景点名，第三列是评分
% txt包含文本数据，num包含数值数据，raw包含混合数据
cities = raw(2:end, 1); % 城市名在第一列
scores = num(:, 2); % 假设评分在数值数据的第二列

% 找出最高评分
maxScore = max(scores);

% 计算获得最高评分的景点总数
numMaxScoreSites = sum(scores == maxScore);

% 识别拥有最高评分景点数量最多的城市
uniqueCities = unique(cities); % 所有城市的列表
cityCount = zeros(length(uniqueCities), 1); % 存储每个城市最高评分景点的数量

for i = 1:length(uniqueCities)
    citySites = scores(strcmp(cities, uniqueCities{i})); % 选取该城市的所有景点评分
    cityCount(i) = sum(citySites == maxScore); % 计算该城市获得最高评分的景点数量
end

% 创建一个新矩阵，包含城市和对应的最高评分景点数量
cityScores = [uniqueCities, num2cell(cityCount)];

% 排序，找出拥有最高评分景点数量最多的前10个城市
% 根据第二列（城市景点数）降序排列
[~, idx] = sort(cell2mat(cityScores(:, 2)), 'descend');
sortedCityScores = cityScores(idx, :);

% 显示拥有最高评分景点数量最多的前10个城市
disp(sortedCityScores(1:10, :));
