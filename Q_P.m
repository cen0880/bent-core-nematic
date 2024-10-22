% Define grid parameters  
NUM = 100; % Number of grid points per direction  
L = 1; % Domain size  
dx = L / (NUM - 1); % Grid spacing  
dy = dx; % Assume square grid  
[x, y] = meshgrid(0:dx:1, 0:dy:1); % Create grid points  

% the critical point Sg^*
%PA D0
%Sg = 0;
%A4e-2 D4e-3
%Sg = 0.0129566;
%A4e-2 D8e-3
%Sg = 0.0524761;

%A-4e-2 D0
%Sg = 0.2;
%A-4e-2 D4e-3
%Sg = 0.216015;
%A-4e-2 D8e-3
%Sg = 0.236426;

%A-5e-1 D0
%Sg = 0.707107;
%A-5e-1 D4e-3
%Sg = 0.709252;
%A-5e-1 D8e-3
Sg = 0.712497;

%A-5e-1 M-9.7e-5 D0
%Sg = 0.707107;
%A-5e-1 M-9.7e-5 D4e-3
%Sg = 0.709279;
%A-5e-1 M-9.7e-5 D8e-3
%Sg = 0.712539;


% initial conditions 
% D
Q1 = zeros(NUM, NUM);
Q2 = Sg/sqrt(2)*ones(NUM, NUM);
% R
% Q1(1:NUM/4,:) = zeros(NUM/4, NUM);
% Q1(NUM/4+1:3*NUM/4,:) = Sg/sqrt(2)*ones(NUM/2, NUM);
% Q1(3*NUM/4+1:end,:) = zeros(NUM/4, NUM);
% Q2(1:NUM/4,:) = -Sg/sqrt(2)*ones(NUM/4, NUM);
% Q2(NUM/4+1:3*NUM/4,:) = zeros(NUM/2, NUM);
% Q2(3*NUM/4+1:end,:) = Sg/sqrt(2)*ones(NUM/4, NUM);
% P1(1:NUM/4,:) = zeros(NUM/4, NUM);
% P1(NUM/4+1:3*NUM/4,:) = Sg/sqrt(2)*ones(NUM/2, NUM);
% P1(3*NUM/4+1:end,:) = zeros(NUM/4, NUM);
% P2(1:NUM/4,:) = -Sg/sqrt(2)*ones(NUM/4, NUM);
% P2(NUM/4+1:3*NUM/4,:) = zeros(NUM/2, NUM);
% P2(3*NUM/4+1:end,:) = Sg/sqrt(2)*ones(NUM/4, NUM);

% boundary conditions 
Q1(:, 1) = Sg/sqrt(2);    % q1 = Sg/sqrt(2) on y = 0  
Q1(:, NUM) = Sg/sqrt(2);    % q1 = Sg/sqrt(2) on y = 1  
Q1(1, :) = -Sg/sqrt(2);   % q1 = -Sg/sqrt(2) on x = 0  
Q1(NUM, :) = -Sg/sqrt(2);   % q1 = -Sg/sqrt(2) on x = 1  

Q2(:, 1) = 0; Q2(:, NUM) = 0; Q2(1, :) = 0; Q2(NUM, :) = 0;
P1(:, 1) = 0; P1(:, NUM) = 0; P1(1, :) = 0; P1(NUM, :) = 0;
P2(:, 1) = 0; P2(:, NUM) = 0; P2(1, :) = 0; P2(NUM, :) = 0;

% parameters
lambdasquare = 1e2;
A = -0.5;
D = 0.2*0.04;
N = 9.7e-5;
M = 0.0178;
% Iterate to update q1, q2, p1, p2
max_iter = 1e8; % Maximum number of iterations  
tolerance = 1e-8; % Convergence tolerance  
step_size = 1e-6; % Smaller step size for slower evolution

for iter = 1:max_iter  
    Q1_old = Q1; % Save the old q1 for convergence check  
    Q2_old = Q2; % Save the old q2 for convergence check  
    P1_old = P1; % Save the old p1 for convergence check  
    P2_old = P2; % Save the old p2 for convergence check  

    % Update q1, q2, p1, p2 using finite difference  
    for i = 2:NUM-1  
        for j = 2:NUM-1  
            LapQ1 = (Q1_old(i+1,j) + Q1_old(i-1,j) + Q1_old(i,j+1) + Q1_old(i,j-1) - 4*Q1_old(i,j)) / (dx^2);  
            LapQ2 = (Q2_old(i+1,j) + Q2_old(i-1,j) + Q2_old(i,j+1) + Q2_old(i,j-1) - 4*Q2_old(i,j)) / (dy^2);  
            LapP1 = (P1_old(i+1,j) + P1_old(i-1,j) + P1_old(i,j+1) + P1_old(i,j-1) - 4*P1_old(i,j)) / (dx^2);  
            LapP2 = (P2_old(i+1,j) + P2_old(i-1,j) + P2_old(i,j+1) + P2_old(i,j-1) - 4*P2_old(i,j)) / (dy^2);  

            % Update equations for q1 and q2
            Q1(i,j) = Q1_old(i,j) + step_size * (LapQ1 - lambdasquare*(Q1_old(i,j)*(Q1_old(i,j)^2 + Q2_old(i,j)^2+A/2)-D/2*P1_old(i,j)));
            Q2(i,j) = Q2_old(i,j) + step_size * (LapQ2 - lambdasquare*(Q2_old(i,j)*(Q1_old(i,j)^2 + Q2_old(i,j)^2+A/2)-D/2*P2_old(i,j)));
            P1(i,j) = P1_old(i,j) + step_size * (LapP1 - lambdasquare*(N*P1_old(i,j)*(P1_old(i,j)^2 + P2_old(i,j)^2+M/2/N)-D/2*Q1_old(i,j)));
            P2(i,j) = P2_old(i,j) + step_size * (LapP2 - lambdasquare*(N*P2_old(i,j)*(P1_old(i,j)^2 + P2_old(i,j)^2+M/2/N)-D/2*Q2_old(i,j)));

        end  
    end  


    % Check for convergence  
    if max(max(abs(Q1 - Q1_old))) < tolerance && max(max(abs(Q2 - Q2_old))) < tolerance && ...
       max(max(abs(P1 - P1_old))) < tolerance && max(max(abs(P2 - P2_old))) < tolerance  
        disp(['Converged after ', num2str(iter), ' iterations.']); 
        break;  
    end  
end  
save('D8e3_AN05_lambda1e2.mat',"Q1","Q2","P1","P2")

% plots of Qg and Qc
S_g = sqrt(2 * (Q1.^2 + Q2.^2));
S_c = sqrt(2 * (P1.^2 + P2.^2));

h = figure;
subplot(2, 1, 1)
imagesc(x(1,:), y(:,1), S_g');
title('Qg');
xlabel('x');
ylabel('y');
colorbar;
axis equal tight;
hold on
% calculating n = (v1,v2) or (-v1,-v2)
    v1 = sqrt(0.5 + Q1./S_g/sqrt(2));v2 = sqrt(0.5 - Q1./S_g/sqrt(2)) .* (1-2*(Q2<0));
    % plot n(x,y) with white lines, the points (x,y) are chosen randomly
    rng(0); str=(S_g(2:end-1,2:end-1)).^0.25; len=S_g(2:end-1,2:end-1)+0.1;
    rnd=double((randn(98)./str)>1.63);rnd(rnd==0)=NaN;
    quiver(x(2:end-1,2:end-1), y(2:end-1,2:end-1),  0.25 * v1(2:end-1,2:end-1)'.*rnd'.*len',...
    0.25 * v2(2:end-1,2:end-1)'.*rnd'.*len', 3, 'color',[0.99 0.99 0.99],...
    'ShowArrowHead', 'off','LineWidth',1);
    quiver(x(2:end-1,2:end-1), y(2:end-1,2:end-1), -0.25 * v1(2:end-1,2:end-1)'.*rnd'.*len',...
    -0.25 * v2(2:end-1,2:end-1)'.*rnd'.*len', 3, 'color',[0.99 0.99 0.99],...
    'ShowArrowHead', 'off','LineWidth',1);
    axis off;
    axis equal;
    ax = gca;
    ax.FontSize = 18;
    hold off


subplot(2, 1, 2)
imagesc(x(1,:), y(:,1), S_c');
title('Qc');
xlabel('x');
ylabel('y');
colorbar;
axis equal tight;
hold on
% calculating n = (v1,v2) or (-v1,-v2)
    v1 = sqrt(0.5 + P1./S_c/sqrt(2));v2 = sqrt(0.5 - P1./S_c/sqrt(2)) .* (1-2*(Q2<0));
    % plot n(x,y) with white lines, the points (x,y) are chosen randomly
    rng(0); str=(S_c(2:end-1,2:end-1)).^0.25; len=S_c(2:end-1,2:end-1)+0.01;
    rnd=double((randn(98)./str)>1.63);rnd(rnd==0)=NaN;
    quiver(x(2:end-1,2:end-1), y(2:end-1,2:end-1),  0.25 * v1(2:end-1,2:end-1)'.*rnd'.*len',...
    0.25 * v2(2:end-1,2:end-1)'.*rnd'.*len', 2, 'color',[0.99 0.99 0.99],...
    'ShowArrowHead', 'off','LineWidth',0.6);
    quiver(x(2:end-1,2:end-1), y(2:end-1,2:end-1), -0.25 * v1(2:end-1,2:end-1)'.*rnd'.*len',...
    -0.25 * v2(2:end-1,2:end-1)'.*rnd'.*len', 2, 'color',[0.99 0.99 0.99],...
    'ShowArrowHead', 'off','LineWidth',0.6);
    axis off;
    axis equal;
    ax = gca;
    ax.FontSize = 18;
    hold off
saveas(h,'D8e3_AN05_lambda1e2.png')