filename = 'C:\Users\Rufus Sam A\Downloads\Lincoln\Computer Vision\Assessments\x.csv';
x = csvread(filename);
filename = 'C:\Users\Rufus Sam A\Downloads\Lincoln\Computer Vision\Assessments\y.csv';
y = csvread(filename);
filename = 'C:\Users\Rufus Sam A\Downloads\Lincoln\Computer Vision\Assessments\a.csv';
a = csvread(filename);
filename = 'C:\Users\Rufus Sam A\Downloads\Lincoln\Computer Vision\Assessments\b.csv';
b = csvread(filename);

%%
nx = a - x;
ny = b - y;

%%
figure;
plot(x, y, 'xb');
hold all;
plot(a, b, '+r');
title('noisy co-ordinates vs real co-ordinates')


%%
z= [a; b];
[px, py] = kalmanTracking_assess(z);

%%
figure;
plot(x, y, 'xb');
hold all;
plot(px, py, 'xm');
title('Estimated (magenta) vs real co-ordinates (blue)')
%%
figure;
plot(px, py, 'xm');
hold all;
plot(a, b, '+r');
title('Estimated (magenta) vs noisy (red) co-ordinates')

%%
figure;
plot(x, y, 'xb');
hold all;
plot(a, b, '+r');
title('Estimated (yellow) vs Noisy (red) vs actual (blue) with validation gating >50')
hold all;
plot(px, py, 'oy');

%%
fprintf('Quality of tracking between estimated and real')
e = sqrt ((x-px).^2 + (y-py).^2);
fprintf('\nError-');
disp(round(e,3));
abs = (x-px) + (y -py);
RMS = rms(e)
m = mean(abs) %%----
s = std(abs) %%----

%%
fprintf('Values of noisy and predicted co-ordinates are');
e1 = sqrt ((a-px).^2 + (b-py).^2)
abs_1 = (a-px) + (b-py)
RMS1 = rms(e1)
m1 = mean(abs_1) %%---
s1 = std(abs_1) %%--

%%
d2_mahal = mahal([x,y],[px,py]);