clc
clear

% �趨�ļ���
filename = 't1.xlsx';

% ʹ��xlsread��ȡ����
[num, txt, raw] = xlsread(filename);

% �����һ���ǳ��������ڶ����Ǿ�������������������
% txt�����ı����ݣ�num������ֵ���ݣ�raw�����������
cities = raw(2:end, 1); % �������ڵ�һ��
scores = num(:, 2); % ������������ֵ���ݵĵڶ���

% �ҳ��������
maxScore = max(scores);

% ������������ֵľ�������
numMaxScoreSites = sum(scores == maxScore);

% ʶ��ӵ��������־����������ĳ���
uniqueCities = unique(cities); % ���г��е��б�
cityCount = zeros(length(uniqueCities), 1); % �洢ÿ������������־��������

for i = 1:length(uniqueCities)
    citySites = scores(strcmp(cities, uniqueCities{i})); % ѡȡ�ó��е����о�������
    cityCount(i) = sum(citySites == maxScore); % ����ó��л��������ֵľ�������
end

% ����һ���¾��󣬰������кͶ�Ӧ��������־�������
cityScores = [uniqueCities, num2cell(cityCount)];

% �����ҳ�ӵ��������־�����������ǰ10������
% ���ݵڶ��У����о���������������
[~, idx] = sort(cell2mat(cityScores(:, 2)), 'descend');
sortedCityScores = cityScores(idx, :);

% ��ʾӵ��������־�����������ǰ10������
disp(sortedCityScores(1:10, :));
