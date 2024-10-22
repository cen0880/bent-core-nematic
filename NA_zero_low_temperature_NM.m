clc
%calculate the eigenvalue of Jacobi matrix 
% C2 = 0.1;
% s1 = 0;
% s2 = 0;
% a = -0.5-2*0.34*s1+3*s1*s1;
% b = -C2*0.04;
% c = -C2*0.04;
% d = -9.7e-5+3*0.0178*s2*s2;
% 
% lambda1 = ((a+d)+sqrt((a+d)*(a+d)-4*(a*d-b*c)))/2
% lambda2 = ((a+d)-sqrt((a+d)*(a+d)-4*(a*d-b*c)))/2

%-0.5*y1 − 0.34*y1^2 + y1^3 − C2*0.04*y2 = 0,
%-9.7e−5*y2 + 0.0178*y2^3 − C2*0.04*y1 = 0.

x = [0,0.02,0.04,0.06,0.08,0.1,0.15,0.174,0.18,0.2]*0.04;
xx = [0,0.02,0.04,0.06,0.08,0.1,0.15,0.174]*0.04;
y1_1 = [-0.557255, -0.55755, -0.557991, -0.558514, -0.55973, -0.559098, -0.561484, -0.562398, -0.562633, -0.563433];
y2_1 = [-0.0738203, -0.298836, -0.373712, -0.426589, -0.468856, -0.504666, -0.577311, -0.606603, -0.613513, -0.635532];
y1_2 = [0, -0.00011734, -0.000229941, -0.000332702, -0.000419725, -0.000483553, -0.000449658, -0.0000353015];
y2_2 = [0.0738203, 0.0733316, 0.0718453, 0.0692972, 0.0655633, 0.0604243, 0.0374601, 0.00253597];
y1_3 = zeros(1,10);
y2_3 = zeros(1,10);
y1_4 = [0, 0.000117321, 0.000229871, 0.000332562, 0.000419518, 0.000483314, 0.000449779, 0.0000360169];
y2_4 = [-0.0738203, -0.0733317, -0.071846, -0.0692993, -0.0655683, -0.0604341, -0.0374931, -0.00258749];
y1_5 = [0.897255, 0.897469, 0.89779, 0.89817, 0.898595, 0.899057, 0.90034, 0.90101, 0.901182, 0.90177];
y2_5 = [-0.0738203, 0.348246, 0.436344, 0.498419, 0.547961, 0.589876, 0.674718, 0.708845, 0.716888, 0.742495];

figure(1)
plot(x,y1_1,'Linewidth',3)
hold on 
plot(x,y1_3,'--','Linewidth',3)
hold on
plot(x,y1_5,'Linewidth',3)
hold on
plot(xx,y1_2,'--','Linewidth',3)
hold on 
plot(xx,y1_4,'--','Linewidth',3)

xlabel('D','FontSize', 16, 'FontWeight', 'bold');  
ylabel('Sg','FontSize', 16, 'FontWeight', 'bold');  
ax = gca;   
ax.LineWidth = 2; 
ax.FontSize = 24;
hold off

figure(2)
plot(x,y2_1,'Linewidth',3)
hold on
plot(x,y2_3,'--','Linewidth',3)
hold on
plot(x,y2_5,'Linewidth',3)
hold on
plot(xx,y2_2,'--','Linewidth',3)
hold on 
plot(xx,y2_4,'--','Linewidth',3)

xlabel('D','FontSize', 16, 'FontWeight', 'bold');  
ylabel('Sc','FontSize', 16, 'FontWeight', 'bold');  
ax = gca;
ax.LineWidth = 2;
ax.FontSize = 24;
hold off

figure(3)
plot(x,(0.9*y1_1+0.1*y2_1),'Linewidth',3)
hold on
plot(x,(0.9*y1_3+0.1*y2_3),'--','Linewidth',3)
hold on
plot(x,(0.9*y1_5+0.1*y2_5),'Linewidth',3)
hold on
plot(xx,(0.9*y1_2+0.1*y2_2),'--','Linewidth',3)
hold on
plot(xx,(0.9*y1_4+0.1*y2_4),'--','Linewidth',3)

xlabel('D','FontSize', 16, 'FontWeight', 'bold');  
ylabel('Sm','FontSize', 16, 'FontWeight', 'bold');  
ax = gca;
ax.LineWidth = 2;
ax.FontSize = 24;
hold off

figure(4)
plot(x,-0.5*y1_1.^2/2 - 0.34*y1_1.^3/3 + y1_1.^4/4 - 9.7e-5*y2_1.^2/2 + 0.0178*y2_1.^4/4 - x.*y1_1.*y2_1,'Linewidth',3)
hold on 
plot(x,-0.5*y1_3.^2/2 - 0.34*y1_3.^3/3 + y1_3.^4/4 - 9.7e-5*y2_3.^2/2 + 0.0178*y2_3.^4/4 - x.*y1_3.*y2_3,'--','Linewidth',3)
hold on
plot(x,-0.5*y1_5.^2/2 - 0.34*y1_5.^3/3 + y1_5.^4/4 - 9.7e-5*y2_5.^2/2 + 0.0178*y2_5.^4/4 - x.*y1_5.*y2_5,'Linewidth',3)
hold on
plot(xx,-0.5*y1_2.^2/2 - 0.34*y1_2.^3/3 + y1_2.^4/4 - 9.7e-5*y2_2.^2/2 + 0.0178*y2_2.^4/4 - xx.*y1_2.*y2_2,'--','Linewidth',3)
hold on 
plot(xx,-0.5*y1_4.^2/2 - 0.34*y1_4.^3/3 + y1_4.^4/4 - 9.7e-5*y2_4.^2/2 + 0.0178*y2_4.^4/4 - xx.*y1_4.*y2_4,'--','Linewidth',3)

xlabel('D','FontSize', 16, 'FontWeight', 'bold');  
ylabel('Energy','FontSize', 16, 'FontWeight', 'bold');  
ax = gca;
ax.LineWidth = 2;
ax.FontSize = 24;
hold off


