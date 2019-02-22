x = linspace(-pi, pi, 20);
y = sin(x);

f = 4

population = randn(f,500);

topPop = population(:,1);
topPopFitness = calculate_fitness(topPop, x, y);

for g = 1:1000
  
  bestPop = population(:,1);
  bestPopFitness = calculate_fitness(bestPop, x, y);
  bestPop2 = population(:,2);
  bestPop2Fitness = calculate_fitness(bestPop, x, y);
  for pop = population
    fitness = calculate_fitness(pop, x, y);
    if fitness > bestPop2Fitness
      bestPop2 = pop;
      bestPopFitness2 = fitness;
    endif
    if fitness > bestPopFitness
      bestPop2 = bestPop;
      bestPopFitness2 = bestPopFitness;
      bestPop = pop;
      bestPopFitness = fitness;
    endif
  endfor
  
  for i = 2:size(population,2)
    if bestPop2Fitness < 2*bestPopFitness
      mask = rand(f,1);
      population(:,i) = mask.*bestPop.+(1-mask).*bestPop2.+0.1*(rand(f,1)-0.5);
      if i < size(population,2)/10
        population(:,i) = population(:,i).+(rand(f,1)-0.5);
      endif
    else
      population(:,i) = bestPop.+0.3*(rand(f,1)-0.5);
    endif
  endfor
  
  population(:,1) = bestPop;
  
  if bestPopFitness > topPopFitness
    topPop = bestPop;
    topPopFitness = bestPopFitness;
  endif
  
  disp("Generation: "), disp(g);
  polyout(bestPop, "x");
  plot(x,y,x,polyval(bestPop, x),x,polyval(topPop, x));
  refresh();
  
endfor


