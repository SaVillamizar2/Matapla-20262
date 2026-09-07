% 1. Parámetros temporales y frecuencias
w1 = 1;
w2 = sqrt(11/10);

% Intervalo suficiente para ver 1 o 2 ciclos completos de transferencia de energía
t = linspace(0, 150, 2000); 

% 2. Evaluación de las soluciones exactas
u1 = 0.5 * cos(w1 * t) + 0.5 * cos(w2 * t);
u2 = 0.5 * cos(w1 * t) - 0.5 * cos(w2 * t);

% 3. Gráfica de los desplazamientos
figure('Color', 'w');

subplot(2, 1, 1);
plot(t, u1, 'b', 'LineWidth', 1.2);
grid on;
ylabel('u_1(t)');
title('Respuesta de la Masa 1 (Inicia con desplazamiento)');
ylim([-1.1, 1.1]);

subplot(2, 1, 2);
plot(t, u2, 'r', 'LineWidth', 1.2);
grid on;
xlabel('Tiempo [s]');
ylabel('u_2(t)');
title('Respuesta de la Masa 2 (Inicia en reposo)');
ylim([-1.1, 1.1]);