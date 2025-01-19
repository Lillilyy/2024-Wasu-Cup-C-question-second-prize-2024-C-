% 读取Excel文件
filename = '标准化后的数据.xlsx';
data = readtable(filename);

% 提取城市名和指标数据
cityNames = data.Properties.VariableNames(1);
indicators = data.Properties.VariableNames(2:end);

% 指标数据已经标准化，可以直接用于计算
indicatorData = table2array(data(:, 2:end));

% 给定的权重向量
weights = [-0.000987129, 0.04808937, 0.054443271, 0.055851603, 0.059409305, ...
           0.055663136, 0.059451093, 0.057764652, 0.058091559, 0.059332093, ...
           0.060251779, 0.061540179, 0.060416399, 0.025632307, 0.003199023, ...
           0.044416636, 0.060288426, 0.05888687, 0.059799835, 0.058459594];

% 标准化指标数据（如果尚未标准化）
% indicatorData = indicatorData ./ sqrt(sum(indicatorData.^2));

% 加权标准化指标数据
weightedData = indicatorData .* weights;

% 计算正理想解和负理想解
idealPositive = max(weightedData);
idealNegative = min(weightedData);

% 计算每个城市到正理想解和负理想解的距离
distancePositive = sqrt(sum((weightedData - idealPositive).^2, 2));
distanceNegative = sqrt(sum((weightedData - idealNegative).^2, 2));

% 计算TOPSIS得分
topsisScores = distanceNegative ./ (distancePositive + distanceNegative);

% 创建结果表格
resultTable = table(data.(cityNames{1}), topsisScores, 'VariableNames', [cityNames, {'TOPSISScore'}]);

% 保存结果到新的Excel文件
outputFilename = 'TOPSIS得分结果.xlsx';
writetable(resultTable, outputFilename);

disp('TOPSIS得分计算完成，并已保存到文件。');


