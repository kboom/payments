function [ fitness ] = calculateFitness(solution, objectives, memberCount, meetingCount, meansCount)
    fitnessPenalty = 0;
    for l = 1 : memberCount
        totalPayment = 0;
        for p = 1 : meetingCount
            for x = 1 : meansCount
                totalPayment = totalPayment + solution.meeting(p).charges(l, x);
            end
        end
        paymentDifference = totalPayment - objectives.desiredPayments(l);
        fitnessPenalty = fitnessPenalty + paymentDifference^2;
    end
    fitness = 1 / sqrt(fitnessPenalty);
end