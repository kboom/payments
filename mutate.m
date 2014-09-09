function [ mutatedPopulation ] = mutate(population, meetings, options, memberCount, meetingCount, meansCount)

    functionHandler = str2func(options.mutateMethod);
    mutatedPopulation = functionHandler(population, meetings, options, memberCount, meetingCount, meansCount);

end