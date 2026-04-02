clear;
clc;
%A1和A2为参考点在FRIDGE中的坐标，B1和B2为参考点在电镜下的坐标
A1 = [-23.319, 8.529];
A2 = [-10.892, 33.42];
B1 = [90.414,65.950];
B2 = [71.246, 85.225];
% 计算向量 V1 和 V2
V1 = A2 - A1;
V2 = B2 - B1;

% 计算旋转角度 theta
cos_theta = dot(V1, V2) / (norm(V1) * norm(V2));
sin_theta = sqrt(1 - cos_theta^2);
theta = atan2(sin_theta, cos_theta);

% 计算旋转矩阵 R
R = [cos(theta), -sin(theta); sin(theta), cos(theta)];

% 计算缩放比例 S
S = norm(V2) / norm(V1);
P = B1' - S*R*A1';
%A3和B3为冰核在FRIDGE和电镜下的坐标
A3 = [-17.378, 42.119
    ];
B3 = S*R*A3' + P;
fprintf('B3 的坐标为：(%f, %f)\n', B3(1), B3(2));