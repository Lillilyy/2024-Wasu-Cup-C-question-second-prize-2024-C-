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
top_50_cities{4}='����';
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


% �����������
numCities = 38;

% �������֮��ĸ����г�ʱ��ͷ��þ���
% (�����Ѿ������ݼ�����ȡ���������)
t_ij = timeM; % �����г�ʱ�����ʾ�����ݣ�
c_ij = costM; % �������þ���ʾ�����ݣ�

% ����ÿ�����е���Ѿ�������ʱ�����Ʊ����
t_i = rand(numCities, 1) * 12; % ÿ�����е�����ʱ�䣨Сʱ����ʾ�����ݣ�
p_i = rand(numCities, 1) * 100; % ÿ�����е���Ʊ���ã�ʾ�����ݣ�
s_i = top_50_value(1:38) * 10; % ÿ�����е����֣�ʾ�����ݣ�

% �����������
numCities = 38;


% ������ʱ�����ƣ�144Сʱ��
T = 144;

% ��ʼ����
currentCity = 22;

% ��ʼ����ʱ��ͷ���
totalTime = 0;
totalTicketCost = 0;
totalTransportCost = 0;
visitedCities = [];

% ̰���㷨ѡ�����
while true
    % ��ǵ�ǰ�����ѷ���
    visitedCities = [visitedCities, currentCity];
    
    % ������ʱ��ͷ���
    if length(visitedCities) > 1
        totalTime = totalTime + t_i(currentCity) + t_ij(visitedCities(end-1), currentCity);
        totalTransportCost = totalTransportCost + c_ij(visitedCities(end-1), currentCity);
    else
        totalTime = totalTime + t_i(currentCity);
    end
    totalTicketCost = totalTicketCost + p_i(currentCity);
    
    % ����Ƿ�ʱ���ѳ���
    if totalTime > T
        break;
    end
    
    % �ҵ����������δ������ʱ����еĳ���
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
    
    % ���û���ҵ����ʵ���һ�����У������
    if bestCity == -1
        break;
    end
    
    % ���µ�ǰ����Ϊѡ�����ѳ���
    currentCity = bestCity;
end

% ������
disp('���ɹ�');
disp('�������:');
disp(city(visitedCities));
disp('�ܻ���ʱ��:');
disp(totalTime);
disp('����Ʊ����:');
disp(totalTicketCost);
disp('�ܽ�ͨ����:');
disp(totalTransportCost);