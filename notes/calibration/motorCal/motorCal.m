load('motorCalData.mat')

clf;
timeAdj = (time - 3001)/1000;

% find the mean between the two lines
speedNorm = (speedR - speedL)/2 + speedL;
% cftool(timeAdj, speedNorm) % find the curve to fit the motor
a = 0.8024;
b = 0.004539;
c = -0.8429;
d = -19.56;
fit = a.*exp(b.*timeAdj) + c.*exp(d.*timeAdj);

K = max(fit); % steady state
steadyState = .985*K;
timeConstantPos = find(fit>steadyState,1);
tau = timeAdj(timeConstantPos); % time constant: find the time where is practicially at steady state
a = 1/tau;
b = K;

hold on;
plot(timeAdj, speedR, 'bo')
plot(timeAdj, speedL, 'go')
plot(timeAdj, fit, 'k')
scatter(tau, steadyState, '*')
% plot(timeAdj, speedNorm, 'mo')
hold off;

title('Motor Speed vs Time (fit)')
xlabel('Time (s)')
ylabel('Motor Speed (m/s)')
legend({'Speed Right', 'Speed Left', 'Fit', 'Time Constant Position'}, 'Location','southeast')

str = ["Steady state: " + num2str(K) + " m/s", "Time Constant: " + num2str(tau), "a: " + num2str(a), "b: " + num2str(b)];
t = annotation('textbox', 'String', str, 'BackgroundColor', 'white', 'Position', [.21, .18, .1, .1]);
sz = t.FontSize;
t.FontSize = 10;