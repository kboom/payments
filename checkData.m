function [] = checkData(objectives, meetings, options, memberCount, meetingCount, meansCount)
  for i = 1 : meetingCount
      % Check if there is enough money in people pockets to pay for the meeting
      collectedMoney = 0;
      currentMeeting = meetings(i);
      for j = 1 : size(currentMeeting.assets, 1)
          for k = 1 : length(currentMeeting.means)
              collectedMoney = collectedMoney + currentMeeting.assets(j,  currentMeeting.means(k));
          end
      end

      assert (collectedMoney >= currentMeeting.requiredMoney, strcat('There is not enough money available to pay charge for the meeting : ', num2str(i)));
  end
end