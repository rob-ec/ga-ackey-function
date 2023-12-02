% Equipe: Mariana Teixeira de Castro - 403363
%         Robson Mesquita Gomes - 399682
% 
% implementar um script seguindo um algoritmo genético para minimizar a função 
% f(x,y) = -20*exp(-0.2*sqrt(0.5*(Xi^2 + Yi^2))) - exp(0.5*(cos(2*pi*Xi)+cos(2*pi*Yi)))+exp(1)+20

function main()

    geracoes = 10;
    tamanho_populacao = 100;

    % Inicializar população aleatória
    populacao = randi([0, 1], tamanho_populacao, 20);

    for geracao = 1:geracoes
        % Avaliar a aptidão de cada indivíduo na população
        notas = avaliar_populacao(populacao);

        % Seleção de pais para a próxima geração
        pais = selecao_roleta(notas, tamanho_populacao);

        % Operação de crossover
        filhos = crossover(populacao(pais, :));

        % Operação de mutação
        filhos = mutacao(filhos);

        populacao = filhos;
    end

    % Identificar o melhor indivíduo
    notas = avaliar_populacao(populacao);
    [melhor_nota, ind_melhor_nota] = min(notas);

    X_melhor_bin = populacao(ind_melhor_nota, 1:10);
    Y_melhor_bin = populacao(ind_melhor_nota, 11:20);

    X_melhor = binario_para_decimal(X_melhor_bin, 0, 20);
    Y_melhor = binario_para_decimal(Y_melhor_bin, 0, 20);

    Z_melhor = funcao_objetivo(X_melhor, Y_melhor);

    % Gerar superfície da função e mostrar onde a solução se encontra na superfície
    [X, Y] = meshgrid(-10:0.5:10, -10:0.5:10);
    Z = funcao_objetivo(X, Y);

    mesh(X, Y, Z)
    hold on
    plot3(X_melhor, Y_melhor, Z_melhor, '*r')

    xlabel('Eixo x')
    ylabel('Eixo y')
    zlabel('Eixo z')
    title(strcat('X = ', num2str(X_melhor), ', Y = ', num2str(Y_melhor)))
end

function f = funcao_objetivo(X, Y)
    % Ackley
    f = -20.0 * exp(-0.2 * sqrt(0.5*(X.^2 + Y.^2))) - exp(0.5 * (cos(X.* 2 * pi) + cos(Y.* 2 * pi))) + exp(1) + 20;
end

function notas = avaliar_populacao(populacao)
    X_bin = populacao(:, 1:10);
    Y_bin = populacao(:, 11:20);

    X = binario_para_decimal(X_bin, 0, 20);
    Y = binario_para_decimal(Y_bin, 0, 20);

    notas = funcao_objetivo(X, Y);
end

function individuo = crossover(pais)
    filhos = [];
    for j = 1:2:100
        % Filhos de X
        X_filho1 = [pais(j, 1:5) pais(j+1, 6:10)];
        X_filho2 = [pais(j+1, 1:5) pais(j, 6:10)];
        % Filhos de Y
        Y_filho1 = [pais(j, 11:15) pais(j+1, 16:20)];
        Y_filho2 = [pais(j+1, 11:15) pais(j, 16:20)];

        n_filho = [X_filho1 Y_filho1; X_filho2 Y_filho2];

        filhos = [filhos; n_filho];
    end
    individuo = filhos;
end

function individuo_mutado = mutacao(individuo)
    prob_mutacao = 0.005;
    individuo_mutado = individuo;

    for j = 1:100
        for k = 1:20
            if rand() < prob_mutacao
                individuo_mutado(j, k) = ~individuo_mutado(j, k);
            end
        end
    end
end

function indice_selecionado = roleta(notas)
    probabilidade_selecao = notas / sum(notas);
    acumulado_probabilidade = cumsum(probabilidade_selecao);
    aleatorio = rand();
    indice_selecionado = find(acumulado_probabilidade >= aleatorio, 1);
end

function pais_selecionados = selecao_roleta(notas, quantidade)
    pais_selecionados = zeros(quantidade, 1);

    for i = 1:quantidade
        pais_selecionados(i) = roleta(notas);
    end
end

function decimal = binario_para_decimal(binario, limite_inferior, limite_superior)
    [n, m] = size(binario);
    expoentes = 2 .^ (m-1:-1:0);
    decimal = limite_inferior + binario * ((limite_superior - limite_inferior) / (2^m - 1));
end
