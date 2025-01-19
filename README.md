# 2024-Wasu-Cup-C-question-second-prize-2024年“华数杯”二等奖
2024 Second prize of "Wasu Cup", undergraduate group 
Keywords: tourism route planning Fuzzy comprehensive evaluation method multi-objective optimization greedy algorithm dynamic programming
Please note that it is for learning and communication only. Commercial use is strictly prohibited. Please delete it within 24 hours
For academic exchange, please send email to me (email: LillianKalisto@163.com)

2024年“华数杯”二等奖，本科生组
关键词：旅游路径规划  模糊综合评价法  多目标优化  贪心算法  动态规划
请注意，仅供学习交流，严禁用于商业用途，请于24小时内删除
若进行学术交流，可邮件交流（邮箱：LillianKalisto@163.com）


Abstract
For the problem of tourism route planning, this paper calculates the results of the related BS problem. A fuzzy comprehensive evaluation model was established to quantitatively analyze the attractiveness of 352 cities, and the model was verified by the TOPSIS method. According to the requirements of the problem, single-objective tourism route planning models, multi-objective tourism route planning models, and single-objective optimization models were respectively established to provide specific tourism route plans for tourists.

For problem one, the data was preprocessed first, removing the null values and “--” in the ratings. Then, the data was integrated and the duplicate items were deleted. A counter was created to select all the scenic spot ratings of the cities and obtain the highest rating of 5. A total of 2,563 scenic spots with the highest rating were stored in a matrix and sorted in descending order. The top 10 cities with the most scenic spots of the highest rating were selected: Sansha, Wujiaqu, Yuxi, Yiyang, Tianmen, Daxing'anling, Weifang, Yantai, Aletai and Xingtai.

For problem two, a fuzzy comprehensive evaluation model was established to quantitatively analyze the attractiveness of 352 cities to foreign tourists and determine the "50 most desirable cities for foreign tourists". Five indicators were extracted from the problem statement: city scale, environmental protection, cultural heritage, transportation convenience, climate comfort and food diversity. These five indicators were further divided into 21 secondary indicators. Firstly, principal component analysis was used to eliminate one indicator with a low correlation. Then, the remaining indicators were used to quantify the attractiveness of the cities. The weights of the secondary indicators were calculated using the principal component analysis method, and a fuzzy comprehensive evaluation model was established to give the comprehensive scores of the 352 cities. The top 50 most desirable cities for tourists were obtained by sorting the scores in descending order: Fuzhou, Wujiaqu, etc. Finally, the TOPSIS method was used to comprehensively evaluate the 352 cities and verify the fuzzy comprehensive evaluation model. The results of the 50 most desirable cities for tourists were completely consistent with those of the fuzzy comprehensive evaluation model.

For problem three, a single-objective path planning model was established to determine the best tourism route that visits the most cities within 144 hours and has the best overall experience. Firstly, the tourism goals were transformed into objective functions and the tourists' requirements were transformed into constraints to establish a single-objective path planning model. Then, the greedy algorithm was used to solve the model and obtain the optimal path: Guangzhou - Lvliang - Beijing -... - Baotou, a total of 23 cities, with a total travel time of 143.9206 hours and a total cost of 5,410.7 yuan. Finally, the model was subjected to sensitivity analysis, and the results showed that the total travel time was not highly sensitive to the travel time of a single city.

For problem four, a multi-objective path planning model was established to determine the optimal tourism route that visits as many cities as possible within 144 hours and has the lowest total cost of tickets and transportation. Based on problem three, the objective function of minimizing the total cost of tickets and transportation was added to establish a multi-objective path planning model. Then, a hybrid optimization strategy combining heuristic algorithms and dynamic programming was used to calculate the optimal path with the lowest cost and meeting the time constraints: Guangzhou - Changzhi - Datong -... - Tianjin, a total of 28 cities, with a total travel time of 142.2859 hours and a total cost of 4,423 yuan. Finally, the support vector machine method was used to verify the model, and the model fitting effect was good.

For problem five, a single-objective optimization model was established to determine the best tourism route that visits more mountainous scenic spots within 144 hours and has the lowest total cost of tickets and transportation. Based on problem four, the objective function of maximizing the tourists' mountain scenic experience was added, and the model was transformed into a single-objective optimization model. Then, a combination of the greedy algorithm and dynamic programming was used to calculate the specific travel route: Shantou - Jieyang -... - Zhuzhou, a total of 24 cities, with a total travel time of 143.4056 hours and a total cost of 1,702.3 yuan. 

Key words: Tourist route planning, Fuzzy comprehensive evaluation method, Multi-objective optimization, Greedy algorithm, Dynamic programming


摘  要

针对旅游路径规划问题，本文计算得出相关BS问题的结果。建立了模糊综合评价模型，量化分析了352座城市吸引力，并运用TOPSIS法对模型检验。根据题目要求分别建立了单目标旅游路径规划模型、多目标旅游路径规划模型以及单目标优化模型，为游客提供了具体旅游路径方案。
针对问题一，首先对数据进行预处理，将数据中评分的空值、“--”删除。接着，将数据进行集成，删除数据中的重复项。创建计数器，选取城市所有景点评分，求得最高评分为5，获得最高评分的景点总共2563个，将其储藏在矩阵中，并进行降序，选取最高评分景点数量最多的前10城市：三沙、五家渠、玉溪、益阳、天门、大兴安岭、潍坊、烟台、阿拉尔和邢台。

针对问题二，建立模糊综合评价模型，量化分析了352座城市的对外国游客的吸引力，确定了“最令外国游客向往的50个城市”。从题目中提取出城市规模、环境环保、人文底蕴、交通便利、气候舒适度和美食丰富度这5个指标，再对这5个指标下分共21个二级指标。首先通过主成分分析，剔除1个相关程度较低的指标，根据余下的指标对城市吸引力进行量化。再利用主成分分析法计算二级指标的权重，建立模糊综合评价模型，给出352座城市的综合得分，对其进行降序排序求得福州市、五家渠市等50座最令游客向往城市。最后，利用TOPSIS法对352座城市进行综合评价，对模糊综合评价模型进行检验，得到的50座最令游客向往的城市与模糊综合评价模型的结果完全一致。

针对问题三，建立单目标路径规划模型，确定了在144h内游玩最多的城市并且综合游玩体验最好的旅游路径。首先，将游览目标转化为目标函数，游客要求转化为约束条件，建立单目标路径规划模型。接着，用贪心算法对模型进行求解出最优路径：广州-吕梁-北京-…-包头，总计23个城市，总花费时间为143.9206h，总费用为5410.7元。最后，对模型进行灵敏度检验，结果表明总游玩时间对单个城市游玩时间灵敏度不高。

针对问题四，建立多目标路径规划模型，确定了在144h内游览尽可能多的城市并且门票和交通总费用尽可能少的最优旅游路径。本题在问题三的基础上，增加了最少化门票和交通总费用的目标函数，建立多目标路径规划模型。接着，运用混合优化策略，结合启发式算法和动态规划，算出成本最少且满足时间约束的最优路径：广州-长治-大同-…-天津，总计28个城市，总花费时间142.2859h，总费用4423元。最后，运用支持向量机法对模型进行检验，模型拟合效果较好。

针对问题五，建立单目标优化模型，确定了在144h内能够游览更多山景并且门票和交通的总费用尽可能少的旅游路径。在问题四的基础上新增最大化游客的山景体验的目标函数，在考虑成本和时间的基础上，转化为单目标优化模型。接着，运用贪心算法和动态规划相结合，计算出具体游玩路线：汕头-揭阳-…-株洲，总计24个城市，总花费时间143.4056 h，总费用为1702.3元。

关键词：旅游路径规划  模糊综合评价法  多目标优化  贪心算法  动态规划
