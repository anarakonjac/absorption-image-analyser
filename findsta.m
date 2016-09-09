function v = findsta(data)

% This function finds appropriate starting values for least square interation

v = zeros(1,4);
sizeofdata = size(data);
v(1) = min(data);             % background 
% v(1) = mean(data);             % background (New 13/06/12)
[maxdata,v(3)] = max(data);   % x centre
v(2) = maxdata-v(1);         % amplitude          
value_to_find = v(1) + v(2)*1/exp(1);
a = find(data >= value_to_find);
asize = size(a);
v(4) = (a(asize(2))-a(1))/2;    % sigmax