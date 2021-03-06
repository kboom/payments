function [ mutatedPopulation ] = mutate1(population, meetings, options, memberCount, meetingCount, meansCount)

    mutatedPopulation(length(population)).solution = {};
    for p = 1 : length(population)
        currentIndividual = population(p);
        for l = 1 : meetingCount
            currentMeeting = currentIndividual.solution.meeting(l);
            for m = 1 : memberCount
                for r = 1 : meansCount
                    meansCharge = currentMeeting.charges(m, r);
                    if meansCharge > 0
                        % Pick a random person which can be charged
                        % with some of this
                        for z = 1 : options.mutationRetryCount;
                            randomPersonIndex = randi([1 memberCount],1,1);
                            randomAssetIndex = currentMeeting.means(randi([1 length(currentMeeting.means)],1,1));
                            if r == randomAssetIndex
                                continue;
                            end
                            
                            affordableCharge = meetings(l).assets(randomPersonIndex, randomAssetIndex) - currentMeeting.charges(randomPersonIndex, randomAssetIndex);
                            if affordableCharge > 0
                                % Transfer a part of it
                                transferRatio = randi([1 100],1,1) / 100 - options.transferOffset;
                                if transferRatio <= 0
                                    continue;
                                end
                                transferValue = affordableCharge * transferRatio;
                                if meansCharge - transferValue < 0
                                    transferValue = meansCharge;
                                end
                                currentMeeting.charges(m, r) = meansCharge - transferValue;
                                currentMeeting.charges(randomPersonIndex, randomAssetIndex) = currentMeeting.charges(randomPersonIndex, randomAssetIndex) + transferValue;
                            end
                        end
                    end
                end
            end
            currentIndividual.solution.meeting(l) = currentMeeting;
        end
        mutatedPopulation(p) = currentIndividual;
    end
end