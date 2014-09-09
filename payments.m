% http://www.doc.ic.ac.uk/~nd/surprise_96/journal/vol1/hmw/article1.html#se
% lection
function [ solution ] = payments( objectives, meetings, options )
    addpath('crossover');
    addpath('mutation');

    memberCount = length(objectives.desiredPayments);
    meetingCount = length(meetings);
    meansCount = size(meetings(1).assets, 2);

    %% Make some assertions about the data
    checkData(objectives, meetings, options, memberCount, meetingCount, meansCount);

    %% Generate initial population
    % The most basic implementation of it is just to iterate through the users
    % charging them with some random part of their assets until the required
    % payment is not collected.

    population = init(objectives, meetings, options, memberCount, meetingCount, meansCount);

    %% Run genetic algorithm
    % The operations are as follows:
    %    1. randomly initialize population(t)
    %    2. determine fitness of population(t)
    %    3. repeat
    %        select parents from population(t)
    %        perform crossover on parents creating population(t+1)
    %        perform mutation of population(t+1)
    %        determine fitness of population(t+1)
    %       until best individual is good enough

    for i = 1 : options.maxIterationCount

        %% Select parents from population(t)
        parents = selectFittest(population, options);

        %% Perform crossover on parents creating population(t+1)
        population = crossover(parents, options, meetingCount);

        %% Perform mutation of population(t+1)
        population = mutate(population, meetings, options, memberCount, meetingCount, meansCount);

        %% Calculate the fitness of each individual in the population
        for j = 1 : length(population)
            currentSolution = population(j).solution;
            population(j).solution.fitness = calculateFitness(currentSolution, objectives, memberCount, meetingCount, meansCount);
        end

        %% See if there is a solution which is satisfactory
        fitnesses = zeros(1, length(population));

        for n = 1 : length(population)
            fitnesses(n) = population(n).solution.fitness;
        end

        [output, order] = sort(fitnesses,'descend');
        orderedPopulation = population(order);
        if orderedPopulation(1).solution.fitness >= options.fitnessThreshold
            solution = orderedPopulation(1).solution
            break;
        end
    end
end

