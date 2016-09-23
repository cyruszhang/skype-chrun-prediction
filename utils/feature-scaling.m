active = csvread('C:\Users\Cyrus\Downloads\activeUser_1p.csv');
inactive = csvread('C:\Users\Cyrus\Downloads\inactiveUser_1p.csv');

active = [active(:,1:19) active(:, 22:end)];
inactive = [inactive(:,1:19) inactive(:, 22:end)];

active_max = max(active);
inactive_max = max(active);

active = active ./ active_max;
inactive = inactive ./ inactive_max;

csvwrite(active, 'C:\Users\Cyrus\Downloads\active.csv');
csvwrite(inactive, 'C:\Users\Cyrus\Downloads\inactive.csv');