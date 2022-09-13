end_point = input('Input end point: ');

x = 0:0.01:end_point;
[y, iter_y] = sinus(x);
[f, iter_f] = bad_sinus(x);
g = sin(x);

subplot(2, 2, 2), plot(x, y, x, g, 'r--'), hold on, grid on, title('Good sinus');
axis([0 end_point -3 3]), legend('My sin', 'sin');
subplot(2, 2, 1), plot(x, f, x, g, 'r--'), hold on, grid on, title('Bad sinus');
axis([0 end_point -3 3]), legend('My sin', 'sin');

subplot(2, 2, 3), plot(x, iter_f), grid on, title('Bad sinus iterations');
subplot(2, 2, 4), plot(x, iter_y), grid on, title('My sinus iterations');
