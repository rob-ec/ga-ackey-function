function main ()
    plotAckley(-10,10,-10,10,50)
end

function f = ackley(x, y)

    % Ackley
    f = -20.0 * exp(-0.2 * sqrt(0.5*(x^2 + y^2))) - exp(0.5 * (cos(2 * pi) + cos(2 * pi))) + exp(1) + 20;

end

function plotAckley(xmin, xmax, ymin, ymax, n)

    % Interval x, y
    x = linspace(xmin, xmax, n);
    y = linspace(xmin, xmax, n);
    
    % Values x, y
    [X, Y] = meshgrid(x, y);
    
    % Zeros Z
    Z = zeros(size(X));
    
    for i = 1:size(X, 1)
        for j = 1:size(X, 2)
            Z(i, j) = ackley(X(i, j), Y(i, j));
        end
    end
    
    % Plot 3D Chart
    figure;
    surf(X, Y, Z);
    colormap gray;
    title('Gráfico da Função Ackley');
    xlabel('Eixo X');
    ylabel('Eixo Y');
    zlabel('Função Ackley');

end

