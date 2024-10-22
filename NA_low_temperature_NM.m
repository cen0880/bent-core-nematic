clc
%calculate the eigenvalue of Jacobi matrix 
% C2 = 0.1;
% s1 = 0.899182;
% s2 = 0.59094;
% a = -0.5-2*0.34*s1+3*s1*s1;
% b = -C2*0.04;
% c = -C2*0.04;
% d = -9.7e-5+3*0.0178*s2*s2;
% 
% lambda1 = ((a+d)+sqrt((a+d)*(a+d)-4*(a*d-b*c)))/2
% lambda2 = ((a+d)-sqrt((a+d)*(a+d)-4*(a*d-b*c)))/2

%-0.5*y1 − 0.34*y1^2 + y1^3 − C2*0.04*y2 − 0.00016 = 0,
%-9.7e−5*y2 + 0.0178*y2^3 − C2*0.04*y1 − 0.0000192 = 0.

x = [0,0.02,0.04,0.06,0.08,0.1,0.15,0.2]*0.04;
y1_1 = [-0.557058, -0.557348, -0.557789, -0.558312, -0.558895, -0.559528, -0.561282, -0.563232];
y2_1 = [0.120121, -0.294632, -0.371041, -0.424533, -0.467145, -0.50318, -0.576155, -0.634561];
y1_2 = [-0.00032007, -0.000511395, -0.000699319, -0.000881558, -0.00105576, -0.0012195, -0.00156635, -0.0017912];
y2_2 = [0.120121, 0.11951, 0.118433, 0.116881, 0.114844, 0.11231, 0.103723, 0.0918129];
y1_3 = [0.897378, 0.897593, 0.897914, 0.898295, 0.89872, 0.899182, 0.900465, 0.901895];
y2_3 = [0.120121, 0.351244, 0.438262, 0.499895, 0.549188, 0.59094, 0.675541, 0.743182];

figure(1)
plot(x,y1_1,'Linewidth',3)
hold on 
plot(x,y1_2,'--','Linewidth',3)
hold on
plot(x,y1_3,'Linewidth',3)
xlabel('D','FontSize', 16, 'FontWeight', 'bold');  
ylabel('Sg','FontSize', 16, 'FontWeight', 'bold');  
ax = gca;   
ax.LineWidth = 2; 
ax.FontSize = 24;
hold off

figure(2)
plot(x,y2_1,'Linewidth',3)
hold on
plot(x,y2_2,'--','Linewidth',3)
hold on
plot(x,y2_3,'Linewidth',3)
xlabel('D','FontSize', 16, 'FontWeight', 'bold');  
ylabel('Sc','FontSize', 16, 'FontWeight', 'bold');  
ax = gca;
ax.LineWidth = 2;
ax.FontSize = 24;
hold off

figure(3)
plot(x,(0.9*y1_1+0.1*y2_1),'Linewidth',3)
hold on
plot(x,(0.9*y1_2+0.1*y2_2),'--','Linewidth',3)
hold on
plot(x,(0.9*y1_3+0.1*y2_3),'Linewidth',3)
xlabel('D','FontSize', 16, 'FontWeight', 'bold');  
ylabel('Sm','FontSize', 16, 'FontWeight', 'bold');  
ax = gca;
ax.LineWidth = 2;
ax.FontSize = 24;
hold off

figure(4)
plot(x,-0.5*y1_1.^2/2 - 0.34*y1_1.^3/3 + y1_1.^4/4 - 9.7e-5*y2_1.^2/2 + 0.0178*y2_1.^4/4 - x.*y1_1.*y2_1 - 0.00016*y1_1 - 0.0000192*y2_1,'Linewidth',3)
hold on 
plot(x,-0.5*y1_2.^2/2 - 0.34*y1_2.^3/3 + y1_2.^4/4 - 9.7e-5*y2_2.^2/2 + 0.0178*y2_2.^4/4 - x.*y1_1.*y2_2 - 0.00016*y1_1 - 0.0000192*y2_1,'--','Linewidth',3)
hold on
plot(x,-0.5*y1_3.^2/2 - 0.34*y1_3.^3/3 + y1_3.^4/4 - 9.7e-5*y2_3.^2/2 + 0.0178*y2_3.^4/4 - x.*y1_1.*y2_3 - 0.00016*y1_1 - 0.0000192*y2_1,'Linewidth',3)
xlabel('D','FontSize', 16, 'FontWeight', 'bold');  
ylabel('Energy','FontSize', 16, 'FontWeight', 'bold');  
ax = gca;
ax.LineWidth = 2;
ax.FontSize = 24;
hold off


