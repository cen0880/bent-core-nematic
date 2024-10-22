clc
%calculate the eigenvalue of Jacobi matrix 
% C2 = 0.1;
% s1 = 0;
% s2 = 0;
% a = -0.5-2*0.34*s1+3*s1*s1;
% b = -C2*0.04;
% c = -C2*0.04;
% d = 9.7e-5+3*0.0178*s2*s2;
% 
% lambda1 = ((a+d)+sqrt((a+d)*(a+d)-4*(a*d-b*c)))/2
% lambda2 = ((a+d)-sqrt((a+d)*(a+d)-4*(a*d-b*c)))/2

%-0.5*y1 − 0.34*y1^2 + y1^3 − C2*0.04*y2 = 0,
%9.7e−5*y2 + 0.0178*y2^3 − C2*0.04*y1 = 0.

x = [0,0.02,0.04,0.06,0.08,0.1,0.12,0.14,0.16,0.18,0.2]*0.04;
y1_1 = [-0.557255, -0.557538, -0.557972, -0.558489, -0.559067, -0.559695, -0.560365, -0.561072, -0.561812, -0.562581, -0.563378];
y2_1 = [0, -0.286421, -0.363858, -0.41798, -0.461034, -0.497405, -0.529226, -0.557718, -0.58365, -0.607544, -0.629769];
y1_2 = zeros(1,11);
y2_2 = zeros(1,11);
y1_3 = [0.897255, 0.897462, 0.897779, 0.898157, 0.898579, 0.899038, 0.899529, 0.900047, 0.90059, 0.901155, 0.90174];
y2_3 = [0, 0.337652, 0.427935, 0.491073, 0.541287, 0.583681, 0.620744, 0.6539, 0.684047, 0.711795, 0.737577];

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
plot(x,-0.5*y1_1.^2/2 - 0.34*y1_1.^3/3 + y1_1.^4/4 + 9.7e-5*y2_1.^2/2 + 0.0178*y2_1.^4/4 - x.*y1_1.*y2_1,'Linewidth',3)
hold on 
plot(x,-0.5*y1_2.^2/2 - 0.34*y1_2.^3/3 + y1_2.^4/4 + 9.7e-5*y2_2.^2/2 + 0.0178*y2_2.^4/4 - x.*y1_1.*y2_2,'--','Linewidth',3)
hold on
plot(x,-0.5*y1_3.^2/2 - 0.34*y1_3.^3/3 + y1_3.^4/4 + 9.7e-5*y2_3.^2/2 + 0.0178*y2_3.^4/4 - x.*y1_1.*y2_3,'Linewidth',3)
xlabel('D','FontSize', 16, 'FontWeight', 'bold');  
ylabel('Energy','FontSize', 16, 'FontWeight', 'bold');  
ax = gca;
ax.LineWidth = 2;
ax.FontSize = 24;
hold off


