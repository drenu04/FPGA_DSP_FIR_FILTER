% FIR Coefficients
h = [1 2 1];

% Input
x = [1 2 3 4 0];

% Filter Output
y = conv(x, h);

disp('Expected Output:');
disp(y(1:length(x)));

% Optional: Plot
stem(0:length(x)-1, y(1:length(x)), 'filled');
xlabel('Time');
ylabel('y[n]');
title('FIR Filter Output in MATLAB');
grid on;
