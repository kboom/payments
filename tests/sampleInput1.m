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




objectives = {}
objectives.desiredPayments = [70, 45, 65, 50] % suma = 230
%suma requiredMoney = 225

meetings = []

meeting = {}
meeting.requiredMoney = 100.0;
meeting.assets = [50.0, 0.0, 4.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0;   %suma = 55, zostalo = 15
                  2.0, 0.0, 2.0, 0.0, 20.0, 0.0, 0.0, 0.0, 0.0, 0.0;   %suma = 24, zostalo = 21
                  1.0, 0.0, 10.0, 0.0, 2.0, 0.0, 0.0, 0.0, 0.0, 0.0;   %suma = 13, zostalo = 52
                  8.0, 0.0, 2.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0]    %suma = 11, zostalo = 39
meeting.means = [1, 3, 5]                                              %suma = 103
%suma1 = 61.0 suma3 = 18.0  suma5 = 24.0
meetings = [meeting];




meeting = {}
meeting.requiredMoney = 35.0;
meeting.assets = [1.0, 5.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0;    %suma = 6, zostalo = 9
                  9.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0;    %suma = 9, zostalo = 12
                  20.0, 10.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0;  %suma = 30, zostalo = 22
                  1.0, 10.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]   %suma = 11, zostalo = 28
meeting.means = [1, 2]                                                 %suma = 56
%suma1 = 31.0 suma3 = 25.0
meetings = [meetings, meeting];




meeting = {}
meeting.requiredMoney = 90.0;
meeting.assets = [3.00, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0;   %suma = 6, zostalo = 3
                  15.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0;   %suma = 20, zostalo = -6
                  30.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0;   %suma = 30, zostalo = -9
                  5.00, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 30.0]  %suma = 35, zostalo = -7
meeting.means = [1, 10]                                                %suma = 91
%suma1 = 53.0 suma3 = 38.0
meetings = [meetings, meeting];





options = {}
options.selectionRatio = 0.5
options.populationSize = 16
options.mutationRetryCount = 10
options.transferOffset = 2
options.maxIterationCount = 20;
options.fitnessThreshold = 0.06;
options.crossoverMethod = 'crossover1';
options.mutateMethod = 'mutate1';