# Algoritmo Genético para função Ackey
Algoritmo genético para achar o mínimo da **Função Ackey**

$$ f(x,y) = -20\exp{ [ -2.0 \sqrt{ 0.5( x^2 + y^2 ) } ] } -\exp{ [ 0.5( \cos{ 2\pi x} + \cos{2 \pi y} ) ] } + \exp{ (1) } + 20 $$

No intervalo $x$ $\in$ $[-10,10]$ e $y$ $\in$ $[-10,10]$

## Requisitos

  - [ ] `Requisito 01`: Encontrar o mínimo da função no intervalo $x$ $\in$ $[-10,10]$ e $y$ $\in$ $[-10,10]$;
  - [ ] `Requisito 02`: O programa deverá efetuar a seleção dos pais por meio do **método da roleta**;
  - [ ] `Requisito 03`: A cada geração, o algoritmo deverá exibir:
    - [ ] Nota média de avaliação da população
    - [ ] Nota do pior indivíduo (com a percentagens de roleta)
    - [ ] Nota do melhor indivíduo (com a percentagens de roleta)
  - [ ] Cada indivíduo da população deve ser um vetor binário de `40 bits`
    - [ ] Os vinte primeiros representam $x$
    - [ ] Os vinte últimos representam $y$
  - [ ] Exibir os valores $x$ e $y$ do menor valor encontrado para $f(x, y)$

 
