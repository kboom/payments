function [ initialPopulation ] = init(objectives, meetings, options, memberCount, meetingCount, meansCount)
  initialPopulation(options.populationSize).solution = {};

  for i = 1 : options.populationSize
      currentSolution = {};
      currentSolution.meeting = meetings;
      currentSolution.fitness = 0.0;

      for j = 1 : meetingCount
          currentMeeting = meetings(j);
          currentSolution.meeting(j).charges = zeros (memberCount, meansCount);
          currentAssets = currentMeeting.assets;
          totalMembers = size(currentMeeting.assets, 1);
          collectedMoney = 0;
          while collectedMoney ~= currentMeeting.requiredMoney
              % Pick up a random person
              memberIndex = randi([1 totalMembers],1,1);
              % Pick random payment method from accessible ones
              meansIndex = currentMeeting.means(randi([1 length(currentMeeting.means)],1,1));

              % Find out what the contribution should be
              if currentAssets(memberIndex, meansIndex) >= (currentMeeting.requiredMoney - collectedMoney)
                  % He has enough money to finish up the payment by himself
                  % so take it all
                  contribution = currentMeeting.requiredMoney - collectedMoney;
              else
                  % He don't have enough money to finish up the payment by
                  % himself so take a random part of what he's got
                  chargeRatio = rand();
                  % Get the contribution
                  contribution = chargeRatio * currentAssets(memberIndex, meansIndex);
              end

              currentSolution.meeting(j).charges(memberIndex, meansIndex) = currentSolution.meeting(j).charges(memberIndex, meansIndex) + contribution;
              currentAssets(memberIndex, meansIndex) = currentAssets(memberIndex, meansIndex) - contribution;
              collectedMoney = collectedMoney + contribution;
          end
      end

      % Determine fitness
      currentSolution.fitness = calculateFitness(currentSolution, objectives, memberCount, meetingCount, meansCount);

      % Add solution to array
      initialPopulation(i).solution = currentSolution;
  end
end