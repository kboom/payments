%objectives
%  objectives.desiredPayments
%
%  meetings = [
%    meeting.assets = [][]
%    meeting.means = []
%    meeting.requiredMoney ]
%
%
%
%  options
%    options.selectionRatio
%    options.populationSize
%    options.mutationRetryCount
%    options.transferOffset
%    options.maxIterationCount
%    options.fitnessThreshold

function [tests] = testsGenerator(membersNo, meetingsNo, meansNo)
    initValues = {};
    initValues.membersNo = membersNo;
    initValues.meetingsNo = meetingsNo;
    initValues.meansNo = meansNo;

    testSchema = {};

    testSchema.objectives.desiredPayments.sizeX = 'membersNo';
    testSchema.objectives.desiredPayments.sizeY = 1;
    testSchema.objectives.desiredPayments.max   = 1000.0;
    testSchema.objectives.desiredPayments.min   = 0.0;



    testSchema.meetings.assets.sizeX = 'meansNo';
    testSchema.meetings.assets.sizeY = 'membersNo';
    testSchema.meetings.assets.max   = 5000.0;
    testSchema.meetings.assets.min   = 0.0;

    testSchema.meetings.means.sizeX = 1;
    testSchema.meetings.means.sizeY = 1;
    testSchema.meetings.means.max   = 10;
    testSchema.meetings.means.min   = 1;

    testSchema.meetings.requiredMoney.sizeX = 1;
    testSchema.meetings.requiredMoney.sizeY = 1;
    testSchema.meetings.requiredMoney.max   = 1000.0;
    testSchema.meetings.requiredMoney.min   = 1.0;



    testSchema.options.selectionRatio.sizeX = 1;
    testSchema.options.selectionRatio.sizeY = 1;
    testSchema.options.selectionRatio.max   = 1.0;
    testSchema.options.selectionRatio.min   = 0.1;

    testSchema.options.populationSize.sizeX = 1;
    testSchema.options.populationSize.sizeY = 1;
    testSchema.options.populationSize.max   = 100;
    testSchema.options.populationSize.min   = 1;

    testSchema.options.mutationRetryCount.sizeX = 1;
    testSchema.options.mutationRetryCount.sizeY = 1;
    testSchema.options.mutationRetryCount.max   = 20;
    testSchema.options.mutationRetryCount.min   = 1;

    testSchema.options.transferOffset.sizeX = 1;
    testSchema.options.transferOffset.sizeY = 1;
    testSchema.options.transferOffset.max   = 20;
    testSchema.options.transferOffset.min   = 1;

    testSchema.options.maxIterationCount.sizeX = 1;
    testSchema.options.maxIterationCount.sizeY = 1;
    testSchema.options.maxIterationCount.max   = 100;
    testSchema.options.maxIterationCount.min   = 1;

    testSchema.options.fitnessThreshold.sizeX = 1;
    testSchema.options.fitnessThreshold.sizeY = 1;
    testSchema.options.fitnessThreshold.max   = 0.3;
    testSchema.options.fitnessThreshold.min   = 0.01;

    %testSchema

    function [value] = randomGenerator(min, max)
      if mod(min, 1) == 0 && mod(max, 1) == 0
          value = randi([min max], 1, 1)(1,1);
      else
          value = min + mod(max * rand(), min + max);
      end
    end


    function [param] = generateParam(obj, initValues, range)
      names = fieldnames(obj);

      for i = 1 : length(names)
        fieldName = names{i,1};
        rangeItem = getfield(range, fieldName);

        max = rangeItem.max;
        min = rangeItem.min;
        field = {};

        if strcmp(class(rangeItem.sizeX), 'char') == 1
          rangeItem.sizeX = getfield(initValues, rangeItem.sizeX);
        end

        if strcmp(class(rangeItem.sizeY), 'char') == 1
          rangeItem.sizeY = getfield(initValues, rangeItem.sizeY);
        end

        field = zeros(rangeItem.sizeY, rangeItem.sizeX);

        for j = 1 : rangeItem.sizeX
          for k = 1 : rangeItem.sizeY
            field(k, j) = randomGenerator(min, max);
          end
        end

        obj = setfield(obj, fieldName, field);

      end

      param = obj;
    end


    function [test] = generateTest(testSchema, initValues)
      test = {};

      objectives.desiredPayments = {};
      test.objectives = generateParam(objectives, initValues, testSchema.objectives);

      test.meetings = [];
      for i = 1 : initValues.meetingsNo
        meeting = {};
        meeting.assets = {};
        meeting.means = {};
        meeting.requiredMoney = {};

        test.meetings(i) = generateParam(meeting, initValues, testSchema.meetings);
      end;

      options = {};
      options.selectionRatio = {};
      options.populationSize = {};
      options.mutationRetryCount = {};
      options.transferOffset = {};
      options.maxIterationCount = {};
      options.fitnessThreshold = {};

      test.options = generateParam(options, initValues, testSchema.options);
    end

% TODO
%    function [tests] = generateTestScenario(testsNo, testSchema, minMeetingsNo, maxMeetingsNo, minMembersNo, maxMembersNo)
%      tests = [];
%      meetingsNo = randomGenerator(minMeetingsNo, maxMeetingsNo);
%
%      testSchema.objectives.desiredPayments.sizeX = randomGenerator(minMembersNo, maxMembersNo);
%
%      for i = 1 : testsNo
%        tests(i) =  generateTest(testSchema, initValues);
%      end
%    end

% TODO
%    function [results] = runTestScenario(tests)
%      results = [];
%
%      for i = 1 : length(tests)
%        test = tests(i);
%        results(i) =  payments(test.objectives, test.meetings, test.options);
%      end
%    end

    tests = generateTest(testSchema, initValues)
end
