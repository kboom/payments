function [ parents ] = selectFittest(oldPopulation, options)
      fitnesses = zeros(1, length(oldPopulation));

      for m = 1 : length(oldPopulation)
          fitnesses(m) = oldPopulation(m).solution.fitness;
      end

      [output, order] = sort(fitnesses,'descend');
      sortedOldPopulation = oldPopulation(order);
      selectionCount = floor(length(oldPopulation) * options.selectionRatio);
      parents = sortedOldPopulation(1:selectionCount);
  end