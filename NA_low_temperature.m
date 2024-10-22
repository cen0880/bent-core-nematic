clc
%calculate the eigenvalue of Jacobi matrix 
% C2 = 0.1;
% s1 = 0.899182;
% s2 = 0.59094;
% a = -0.5-2*0.34*s1+3*s1*s1;
% b = -C2*0.04;
% c = -C2*0.04;
% d = 9.7e-5+3*0.0178*s2*s2;
% 
% lambda1 = ((a+d)+sqrt((a+d)*(a+d)-4*(a*d-b*c)))/2
% lambda2 = ((a+d)-sqrt((a+d)*(a+d)-4*(a*d-b*c)))/2

%-0.5*y1 − 0.34*y1^2 + y1^3 − C2*0.04*y2 − 0.00016 = 0,
%9.7e−5*y2 + 0.0178*y2^3 − C2*0.04*y1 − 0.0000192 = 0.

x = [0,0.02,0.04,0.06,0.08,0.1,0.12,0.14,0.16,0.18,0.2]*0.04;
y1_1 = [-0.557058, -0.557336, -0.55777, -0.558287, -0.558865, -0.559493, -0.560163, -0.56087, -0.56161, -0.56238, -0.563177];
y2_1 = [0.0850488, -0.282031, -0.361113, -0.415881, -0.459294, -0.495897, -0.527883, -0.556498, -0.582528, -0.6065, -0.628789];
y1_2 = [-0.00032007, -0.000455005, -0.000586064, -0.000711035, -0.000827731, -0.000934044, -0.00102802, -0.00110795, -0.00117255, -0.00122103, -0.00125335];
y2_2 = [0.0850488, 0.0842902, 0.083072, 0.0813939, 0.07926, 0.0766811, 0.0736767, 0.0702782, 0.0665318, 0.0625012, 0.0582674];
y1_3 = [0.897378, 0.897586, 0.897904, 0.898282, 0.898704, 0.899163, 0.899654, 0.900172, 0.900715, 0.90128, 0.901865];
y2_3 = [0.0850488, 0.340744, 0.429891, 0.492572, 0.542529, 0.584756, 0.6217, 0.654766, 0.684844, 0.712535, 0.73827];


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
plot(x,-0.5*y1_1.^2/2 - 0.34*y1_1.^3/3 + y1_1.^4/4 + 9.7e-5*y2_1.^2/2 + 0.0178*y2_1.^4/4 - x.*y1_1.*y2_1 - 0.00016*y1_1 - 0.0000192*y2_1,'Linewidth',3)
hold on 
plot(x,-0.5*y1_2.^2/2 - 0.34*y1_2.^3/3 + y1_2.^4/4 + 9.7e-5*y2_2.^2/2 + 0.0178*y2_2.^4/4 - x.*y1_1.*y2_2 - 0.00016*y1_1 - 0.0000192*y2_1,'--','Linewidth',3)
hold on
plot(x,-0.5*y1_3.^2/2 - 0.34*y1_3.^3/3 + y1_3.^4/4 + 9.7e-5*y2_3.^2/2 + 0.0178*y2_3.^4/4 - x.*y1_1.*y2_3 - 0.00016*y1_1 - 0.0000192*y2_1,'Linewidth',3)
xlabel('D','FontSize', 16, 'FontWeight', 'bold');  
ylabel('Energy','FontSize', 16, 'FontWeight', 'bold');  
ax = gca;
ax.LineWidth = 2;
ax.FontSize = 24;
hold off


