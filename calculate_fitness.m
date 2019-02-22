function fitness = calculate_fitness( pop, x, y )
  fitness = 0;
  for i = 1:size(x,2)
    fitness -= (y(i)-polyval(pop, x(i)))^2;
  endfor
  return;
endfunction
