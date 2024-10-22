clc
%calculate the eigenvalue of Jacobi matrix 
% C2 = 0.1;
% s1 = 4.14667;
% s2 = 8.63162;
% a = -1-2*s1+3*0.31142*s1*s1;
% b = -C2;
% c = -C2;
% d = 0.00222+3*0.000615*s2*s2;
% 
% lambda1 = ((a+d)+sqrt((a+d)*(a+d)-4*(a*d-b*c)))/2
% lambda2 = ((a+d)-sqrt((a+d)*(a+d)-4*(a*d-b*c)))/2

% -y1-y1^2+0.31142*y1^3 - C2*y2 - 0.034=0, 
% 0.00222*y1 + 0.000615*y1^3 - C2*y1 - 0.00453=0

x = [0,0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1,0.12,0.14,0.15,0.17,0.19,0.2];
y1_1 = [-0.770846,-0.780755,-0.809014,-0.841167,-0.875425,-0.910731,-0.946475,-0.982298,-1.01798,-1.05339,-1.08844,-1.1573,-1.22439,-1.25727,-1.32172,-1.38449,-1.41528];
y2_1 = [1.35355,-1.10381,-2.21939,-2.85819,-3.346894,-3.75885,-4.12305,-4.45406,-4.7603,-5.04714,-5.31823,-5.82287,-6.28831,-6.50917,-6.93108,-7.33043,-7.52279];
y1_2 = [-0.0352567,-0.0490675,-0.0599761,-0.0662477,-0.06748,-0.0650149,-0.0607478,-0.0560155,-0.0514551,-0.0472982,-0.0435948,-0.0374385,-0.0326338,-0.0306264,-0.0272252,-0.024466,-0.023276];
y2_2 = [1.35355,1.26231,1.11559,0.925612,0.72085,0.534047,0.383128,0.2689,0.184563,0.122535,0.0766851,0.0168375,-0.017443,-0.02880035,-0.0442487,-0.0533535,-0.0563484];
y1_3 = [4.0172,4.02362,4.03344,4.04509,4.05805,4.07206,4.08689,4.10242,4.11853,4.13516,4.15221,4.18741,4.22375,4.24226,4.27982,4.31793,4.33716];
y2_3 = [1.35355,3.88765,4.94193,5.68928,6.28788,6.79613,7.24279,7.64439,8.01139,8.35088,8.66787,9.24838,9.77354,10.0196,10.4847,10.9194,11.1271];

figure(1)
plot(x*0.04,y1_1*2/17,'Linewidth',3)
hold on 
plot(x*0.04,y1_2*2/17,'--','Linewidth',3)
hold on
plot(x*0.04,y1_3*2/17,'Linewidth',3)
xlabel('D','FontSize', 16, 'FontWeight', 'bold');  
ylabel('Sg','FontSize', 16, 'FontWeight', 'bold');  
ax = gca;   
ax.LineWidth = 2; 
ax.FontSize = 24;
hold off

figure(2)
plot(x*0.04,y2_1*2/17,'Linewidth',3)
hold on
plot(x*0.04,y2_2*2/17,'--','Linewidth',3)
hold on
plot(x*0.04,y2_3*2/17,'Linewidth',3)
xlabel('D','FontSize', 16, 'FontWeight', 'bold');  
ylabel('Sc','FontSize', 16, 'FontWeight', 'bold');  
ax = gca;
ax.LineWidth = 2;
ax.FontSize = 24;
hold off


figure(3)
plot(x*0.04,(0.9*y1_1+0.1*y2_1)*2/17,'Linewidth',3)
hold on
plot(x*0.04,(0.9*y1_2+0.1*y2_2)*2/17,'--','Linewidth',3)
hold on
plot(x*0.04,(0.9*y1_3+0.1*y2_3)*2/17,'Linewidth',3)
xlabel('D','FontSize', 16, 'FontWeight', 'bold');  
ylabel('Sm','FontSize', 16, 'FontWeight', 'bold');  
ax = gca;
ax.LineWidth = 2;
ax.FontSize = 24;
hold off

figure(4)
plot(x*0.04,(-y1_1.^2/2-y1_1.^3/3+0.31142*y1_1.^4/4 - 0.034*y1_1 + 0.00222*y2_1.^2/2 + 0.000615*y2_1.^4/4 - 0.00453333*y2_1 - x.*y1_1.*y2_1)*0.04^3/0.34^2,'Linewidth',3)
hold on 
plot(x*0.04,(-y1_2.^2/2-y1_2.^3/3+0.31142*y1_2.^4/4 - 0.034*y1_2 + 0.00222*y2_2.^2/2 + 0.000615*y2_2.^4/4 - 0.00453333*y2_2 - x.*y1_2.*y2_2)*0.04^3/0.34^2,'--','Linewidth',3)
hold on
plot(x*0.04,(-y1_3.^2/2-y1_3.^3/3+0.31142*y1_3.^4/4 - 0.034*y1_3 + 0.00222*y2_3.^2/2 + 0.000615*y2_3.^4/4 - 0.00453333*y2_3 - x.*y1_3.*y2_3)*0.04^3/0.34^2,'Linewidth',3)
xlabel('D','FontSize', 16, 'FontWeight', 'bold');  
ylabel('Energy','FontSize', 16, 'FontWeight', 'bold');  
ax = gca;
ax.LineWidth = 2;
ax.FontSize = 24;
hold off