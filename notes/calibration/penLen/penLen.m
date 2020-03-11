load('penLenData.mat')

clf;
timeAdj = (time - 9020)/1000;
[pks, locs] = findpeaks(angle);

hold on
plot(timeAdj, angle, '.b')
plot(timeAdj, angle, 'c')
plot(timeAdj(locs), pks, 'b*')
hold off
xlabel('Time (s)')
ylabel('Angle (Reported from Rocky)')
title('Angle versus Time')

legend({'Data Points', 'Data Fit', 'Local Maxima'}, 'Location','southeast')

period = mean(diff(timeAdj(locs)));
wn = 1/period;
g = 9.85;
length = g/(wn*2*pi)^2;

x = 42;
str = ['Natural Frequency (mean): ', num2str(wn), ' Hz', '     Length: ', num2str(length), 'm'];
t = annotation('textbox', 'String', str, 'BackgroundColor', 'white', 'Position', [.15, .1, .1, .1]);
sz = t.FontSize;
t.FontSize = 10;