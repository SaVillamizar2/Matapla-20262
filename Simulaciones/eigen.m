% 1. Guardas las matrices directamente en una celda
m{3} = crear_K(3);
m{4} = crear_K(4);
m{5} = crear_K(5);

% 2. Creas celdas vacías para guardar los resultados de cada iteración
Evec = cell(1, 5);
Eval = cell(1, 5);

% 3. Corres el ciclo extraiendo y guardando con llaves {}
for i = 3:5
    [Evec{i}, Eval{i}] = eig(m{i}, "vector");
end

% 4. Procesar los resultados obtenidos
for i = 3:5
    disp(['Eigenvalues for matrix K(' num2str(i) '):']);
    disp(Eval{i});
end


N = 3; % Dimensión del sistema (puedes cambiarlo a 4, 5, etc.)

% 1. Definir el eje espacial incluyendo las fronteras fijas (0 y N+1)
x_completo = 0:(N+1);

% 2. Generar un mapa de colores (N colores distintos distribuidos uniformemente)
colores = lines(N); 

% 3. Ciclo para graficar cada modo en su propia figura
for modo = 1:N
    % Generar una nueva ventana de figura para cada modo
    figure(modo);
    clf; % Limpiar la ventana por seguridad
    
    % Extraer el autovector del modo actual (columna de la matriz)
    u_lambda = Evec{N}(:, modo);

    % Imponer condiciones de frontera fijas (u=0 en los extremos)
    u_completo = [0; u_lambda; 0];
    
    % Extraer el autovalor correspondiente a este modo
    lambda_actual = Eval{N}(modo);
    
    % Graficar con el color asignado a este modo
    plot(x_completo, u_completo, 'o-', ...
        'Color', colores(modo, :), ...
        'LineWidth', 2, ...
        'MarkerSize', 7, ...
        'MarkerFaceColor', colores(modo, :), ...
        'DisplayName', ['Modo ' num2str(modo) ' (\lambda = ' num2str(lambda_actual, '%.3f') ')']);
    
    % Formato y documentación visual de la gráfica
    grid on;
    xlabel('Posición en el sistema (Nodo / Masa)');
    ylabel('Amplitud del autovector (u_\lambda)');
    title(['Modo de Vibración / Perfil Modal ' num2str(modo) ' (N = ' num2str(N) ')']);
    legend('Location', 'best');
    
    % Ajustar límites de ejes para mejorar la lectura espacial
    xlim([0, N+1]);
    xticks(x_completo); % Mostrar ticks explícitos para cada nodo
end

