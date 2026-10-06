%% 1. Definición de Matrices del Sistema
% Matriz de capacidad térmica / masa
M = [1, 0, 0;
     0, 2, 0;
     0, 0, 1];

% Matriz de conductancia / rigidez
K1 = [-11,  1,   0; 
       1, -2,  1; 
        0,  1, -11]; 


% Matriz dinámica del sistema: du/dt = A * u
A = M \ K1;  % Equivalente a inv(M)*K1, pero más eficiente

%% 2. Descomposición Modal (Autovalores y Autovectores)
[vec, lambda] = eig(A, "vector");

%% 3. Condición Inicial y Proyección al Espacio Modal
u0 = [1; 1; 1];

% Como A no es simétrica, los autovectores no son ortogonales.
% Se DEBE usar vec \ u0 (o inv(vec)*u0), NUNCA vec' * u0:
alpha = vec \ u0;

%% 4. Evaluación Temporal Vectorizada
t = linspace(0, 6, 1000); % 6 segundos para capturar el decaimiento completo
u_t = vec * (alpha .* exp(lambda * t));

%% 5. Visualización: Subplots Individuales
figure('Color', 'w');

subplot(3, 1, 1);
plot(t, u_t(1,:), 'b', 'LineWidth', 1.4);
grid on;
ylabel('u_1(t)');
title('Evolución Térmica - Nodo 1');
ylim([0, 1.05]);

subplot(3, 1, 2);
plot(t, u_t(2,:), 'r', 'LineWidth', 1.4);
grid on;
ylabel('u_2(t)');
title('Evolución Térmica - Nodo 2 (Capacidad M_2 = 2)');
ylim([0, 1.05]);

subplot(3, 1, 3);
plot(t, u_t(3,:), 'g', 'LineWidth', 1.4);
grid on;
xlabel('Tiempo [s]');
ylabel('u_3(t)');
title('Evolución Térmica - Nodo 3');
ylim([0, 1.05]);

%% 6. Visualización: Comparativa Superpuesta
figure('Color', 'w');
plot(t, u_t(1,:), 'b-',  'LineWidth', 2.0, 'DisplayName', 'Nodo 1 (Extremo)'); hold on;
plot(t, u_t(2,:), 'r--', 'LineWidth', 2.0, 'DisplayName', 'Nodo 2 (Centro, doble masa)');
plot(t, u_t(3,:), 'g:',  'LineWidth', 2.5, 'DisplayName', 'Nodo 3 (Extremo)');
grid on;
xlabel('Tiempo [s]');
ylabel('Temperatura u(t)');
title('Decaimiento Térmico con masas diferentes (M_2 = 2)');
legend('Location', 'northeast');
ylim([0, 1.05]);