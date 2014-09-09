function [ crossoverPopulation ] = crossover(parents, options, meetingCount)
    parentCount = length(parents);
    crossoverPopulation(options.populationSize).solution = {};
    for p = 1 : options.populationSize
        motherIndex = randi([1 parentCount],1,1);
        fatherIndex = randi([1 parentCount],1,1);

        child = struct();
        for l = 1 : meetingCount
            if randi([0 1],1,1) == 0
                child.solution.meeting(l) = parents(motherIndex).solution.meeting(l);
            else
                child.solution.meeting(l) = parents(fatherIndex).solution.meeting(l);
            end
        end

        crossoverPopulation(p) = child;
    end
end