clc
% calculate the eigenvalue of Jacobi matrix at (s1,s2) with C2
% if both lambda1 and lambda2 are positive (s1,s2) at C2 is stable otherwise unstable.
% C2 = 0.1;
% s1 = 0;
% s2 = 0;
% a = 1-2*s1+3*0.31142*s1*s1;
% b = -C2;
% c = -C2;
% d = 0.00222+3*0.000615*s2*s2;
% lambda1 = ((a+d)+sqrt((a+d)*(a+d)-4*(a*d-b*c)))/2
% lambda2 = ((a+d)-sqrt((a+d)*(a+d)-4*(a*d-b*c)))/2

% data from alphawolfram the solution of
% y1-y1^2+0.31142*y1^3 - C2*y2 - 0.034=0, 
% 0.00222*y1 + 0.000615*y1^3 - C2*y1 - 0.00453=0

% xi, i = 1,cdots,5 is C2
% (y1_i, y2_i), i = 1,cdots,5 are five branches of solutions

x1 = [0,0.02,0.04,0.05,0.054,0.06,0.069,0.0695];
y1_1 = [0.0352274,0.0704759,0.132931,0.187275,0.2171718,0.277428,0.49243,0.576265];
y2_1 = [1.35355,1.5809,2.04979,2.40497,2.57781,2.88519,3.66853,3.86282];

x2 = [0.053,0.054,0.06,0.069,0.0695];
y1_2 = [1.446715,1.38873,1.06101,0.6601,0.576265];
y2_2 = [4.987345,4.81897,4.55392,4.05711,3.86282];

x3 = [0.053,0.054,0.06,0.069,0.07,0.08,0.097,0.1,0.12,0.14,0.16,0.18,0.2];
y1_3 = [1.446715,1.5047,1.7574,1.9215,1.93602,2.06115,2.22669,2.25223,2.40492,2.53635,2.65376,2.76101,2.86043];
y2_3 = [4.987345,4.95427,5.42037,5.8653,5.90907,6.32189,6.935,7.03511,7.65728,8.21836,8.73398,9.21383,9.66454];

x4 = [0.097,0.1,0.12,0.14,0.16,0.18,0.2];
y1_4 = [-0.118097,-0.158785,-0.274675,-0.369207,-0.457427,-0.54148,-0.622149];
y2_4 = [-1.71709,-2.19244,-3.2548,-3.96567,-4.57645,-5.10068,-5.59106];

x5 = [0.097,0.1,0.12,0.14,0.16,0.18,0.2];
y1_5 = [-0.115384,-0.0870551,-0.0540083,-0.0419068,-0.0346959,-0.0297545,-0.0261107];
y2_5 = [-1.68222,-1.28839,-0.758199,-0.5549,-0.436955,-0.359156,-0.30399];

% Sg plot
figure(1)
plot(x1*0.04,y1_1*2/17,'Linewidth',3)
hold on 
plot(x2*0.04,y1_2*2/17,'--','Linewidth',3)
hold on
plot(x3*0.04,y1_3*2/17,'Linewidth',3)
hold on 
plot(x4*0.04,y1_4*2/17,'Linewidth',3)
hold on
plot(x5*0.04,y1_5*2/17,'--','Linewidth',3)
xlabel('D','FontSize', 16, 'FontWeight', 'bold');  
ylabel('Sg','FontSize', 16, 'FontWeight', 'bold');  
ax = gca;   
ax.LineWidth = 2; 
ax.FontSize = 24;

% Sc plot
figure(2)
plot(x1*0.04,y2_1*2/17,'Linewidth',3)
hold on 
plot(x2*0.04,y2_2*2/17,'--','Linewidth',3)
hold on
plot(x3*0.04,y2_3*2/17,'Linewidth',3)
hold on 
plot(x4*0.04,y2_4*2/17,'Linewidth',3)
hold on
plot(x5*0.04,y2_5*2/17,'--','Linewidth',3)
xlabel('D','FontSize', 16, 'FontWeight', 'bold');  
ylabel('Sc','FontSize', 16, 'FontWeight', 'bold');  
ax = gca;
ax.LineWidth = 2;
ax.FontSize = 24;

% Sm = (1-a)*Sg + a*Sc plot
figure(3)
plot(x1*0.04,(0.9*y1_1+0.1*y2_1)*2/17,'Linewidth',3)
hold on
plot(x2*0.04,(0.9*y1_2+0.1*y2_2)*2/17,'--','Linewidth',3)
hold on
plot(x3*0.04,(0.9*y1_3+0.1*y2_3)*2/17,'Linewidth',3)
hold on 
plot(x4*0.04,(0.9*y1_4+0.1*y2_4)*2/17,'Linewidth',3)
hold on
plot(x5*0.04,(0.9*y1_5+0.1*y2_5)*2/17,'--','Linewidth',3)
xlabel('D','FontSize', 16, 'FontWeight', 'bold');  
ylabel('Sm','FontSize', 16, 'FontWeight', 'bold');  
ax = gca;
ax.LineWidth = 2;
ax.FontSize = 24;
hold off

% Energy plot
% (y1^2/2-y1^3/3+0.31142*y1^4/4 - 0.034*y1 + 0.00222*y2^2/2 + 0.000615*y2^4/4 - 0.00453333*y2 - C2*y1*y2)
figure(4)
plot(x1*0.04,(y1_1.^2/2-y1_1.^3/3+0.31142*y1_1.^4/4 - 0.034*y1_1 + 0.00222*y2_1.^2/2 + 0.000615*y2_1.^4/4 - 0.00453333*y2_1 - x1.*y1_1.*y2_1)*0.04^3/0.34^2,'Linewidth',3)
hold on 
plot(x2*0.04,(y1_2.^2/2-y1_2.^3/3+0.31142*y1_2.^4/4 - 0.034*y1_2 + 0.00222*y2_2.^2/2 + 0.000615*y2_2.^4/4 - 0.00453333*y2_2 - x2.*y1_2.*y2_2)*0.04^3/0.34^2,'--','Linewidth',3)
hold on
plot(x3*0.04,(y1_3.^2/2-y1_3.^3/3+0.31142*y1_3.^4/4 - 0.034*y1_3 + 0.00222*y2_3.^2/2 + 0.000615*y2_3.^4/4 - 0.00453333*y2_3 - x3.*y1_3.*y2_3)*0.04^3/0.34^2,'Linewidth',3)
hold on 
plot(x4*0.04,(y1_4.^2/2-y1_4.^3/3+0.31142*y1_4.^4/4 - 0.034*y1_4 + 0.00222*y2_4.^2/2 + 0.000615*y2_4.^4/4 - 0.00453333*y2_4 - x4.*y1_4.*y2_4)*0.04^3/0.34^2,'Linewidth',3)
hold on
plot(x5*0.04,(y1_5.^2/2-y1_5.^3/3+0.31142*y1_5.^4/4 - 0.034*y1_5 + 0.00222*y2_5.^2/2 + 0.000615*y2_5.^4/4 - 0.00453333*y2_5 - x5.*y1_5.*y2_5)*0.04^3/0.34^2,'--','Linewidth',3)
xlabel('D','FontSize', 16, 'FontWeight', 'bold');  
ylabel('Energy','FontSize', 16, 'FontWeight', 'bold');  
ax = gca;
ax.LineWidth = 2;
ax.FontSize = 24;
hold off

