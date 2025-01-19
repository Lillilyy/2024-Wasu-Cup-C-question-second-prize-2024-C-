clc              
clear
load('t2.mat');
[data,txt]=xlsread('area.xlsx');
% ������б�ǩ
cityLabels = txt(1,2:end);
for i=1:285 
    cityLabels{i}=cityLabels{i}(1:end-1);
end
distanceMatrix=data;
% �ҵ�����Ȥ�ĳ��е�����
citiesOfInterest = top_50_cities;
indices = find(ismember(cityLabels, citiesOfInterest));

% ���˾�����󣬽���������Ȥ���е��к���
filteredMatrix = distanceMatrix(indices, indices);

% ��ʾ���˺�ľ���
disp('���˺�ľ������:');
disp(filteredMatrix);

% ��ʾ���˺�ĳ��б�ǩ
disp('���˺�ĳ��б�ǩ:');
disp(cityLabels(indices));
city=cityLabels(indices);
ecost=0.4;
costM=ecost*filteredMatrix;%��������
timeM=filteredMatrix/200;%����ʱ��


numCities = 38;
T=144;
% �������֮��ĸ����г�ʱ��ͷ��þ���
% (�����Ѿ������ݼ�����ȡ���������)
t_ij = timeM; % �����г�ʱ�����
c_ij = costM; % �������þ���

% ����ÿ�����е���Ѿ�������ʱ�����Ʊ����
t_i = rand(numCities, 1) * 12; % ÿ�����е�����ʱ�䣨Сʱ��
p_i = rand(numCities, 1) * 100; % ÿ�����е���Ʊ����
s_i = top_50_value(1:38) ; % ÿ�����е�����

% ��ʼ��
currentCity = 17;
totalTime = 0;
totalCost = 0;
visitedCities = [];
remainingCities = 1:numCities;

% ̰���㷨
while totalTime < T
    % ��ǵ�ǰ�����ѷ���
    visitedCities = [visitedCities, currentCity];
    remainingCities(remainingCities == currentCity) = [];
    
    % ������ʱ��ͷ���
    if length(visitedCities) > 1
        totalTime = totalTime + t_i(currentCity) + t_ij(visitedCities(end-1), currentCity);
        totalCost = totalCost + c_ij(visitedCities(end-1), currentCity) + p_i(currentCity);
    else
        totalTime = totalTime + t_i(currentCity);
        totalCost = totalCost + p_i(currentCity);
    end
    
    % ����Ƿ�ʱ���ѳ���
    if totalTime > T
        break;
    end
    
    % �ҵ���������ҽ�ͨ������͵ĳ���
    bestCity = -1;
    bestScore = -inf;
    for i = remainingCities
        travelTime = t_ij(currentCity, i);
        visitTime = t_i(i);
        if totalTime + travelTime + visitTime <= T
            score = s_i(i) - c_ij(currentCity, i); % �ۺ����ּ�ȥ��ͨ����
            if score > bestScore
                bestScore = score;
                bestCity = i;
            end
        end
    end
    
    % ���û���ҵ����ʵ���һ�����У������
    if bestCity == -1
        break;
    end
    
    % ���µ�ǰ����Ϊѡ�����ѳ���
    currentCity = bestCity;
end

% ������
disp('���ɹ�');
disp(' ÿ�����е�����ʱ��:');
disp(t_i);
disp('ÿ�����е���Ʊ����:');
disp(p_i);
disp('�������:');
disp(cityLabels(visitedCities));
disp('�ܻ���ʱ��:');
disp(totalTime);
disp('�ܷ���:');
disp(totalCost);