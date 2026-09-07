% 1. Matriz del sistema
K1 = [-11,  10,   0; 
       10, -20,  10; 
        0,  10, -11]; 

% 2. Autovalores y autovectores ortonormales
[Q, lambda] = eig(K1, "vector");

% 3. Condición inicial y proyección modal
u0 = [1; 1; 1];
alpha = Q' * u0;

% 4. Vector de tiempo (con t = 4 s se aprecia todo el decaimiento)
t = linspace(0, 4, 1000);

% Evaluación vectorizada
u_t = Q * (alpha .* exp(lambda * t));

% 5. Visualización: Opción en subplots limpios
figure('Color', 'w');

subplot(3, 1, 1);
plot(t, u_t(1,:), 'b', 'LineWidth', 1.4);
grid on;
ylabel('u_1(t)');
title('Evolución Térmica - Masa 1');

subplot(3, 1, 2);
plot(t, u_t(2,:), 'r', 'LineWidth', 1.4);
grid on;
ylabel('u_2(t)');
title('Evolución Térmica - Masa 2 (Centro)');

subplot(3, 1, 3);
plot(t, u_t(3,:), 'g', 'LineWidth', 1.4);
grid on;
xlabel('Tiempo [s]');
ylabel('u_3(t)');
title('Evolución Térmica - Masa 3');

% Gráfica conjunta de los 3 nodos en una sola figura
figure('Color', 'w');

plot(t, u_t(1,:), 'b-',  'LineWidth', 2.0, 'DisplayName', 'Nodo 1 (Extremo)'); hold on;
plot(t, u_t(2,:), 'r--', 'LineWidth', 2.0, 'DisplayName', 'Nodo 2 (Centro)');
plot(t, u_t(3,:), 'g:',  'LineWidth', 2.5, 'DisplayName', 'Nodo 3 (Extremo)');

grid on;
xlabel('Tiempo [s]');
ylabel('Temperatura u(t)');
title('Decaimiento Térmico del Sistema');
legend('Location', 'northeast');
ylim([0, 1.05]);