function [ crossoverPopulation ] = crossover(parents, options, meetingCount)

    functionHandler = str2func(options.crossoverMethod);
    crossoverPopulation = functionHandler(parents, options, meetingCount);

end