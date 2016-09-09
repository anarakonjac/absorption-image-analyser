% bimodal_findstart.m
% Finds starting values for bimodal fit.

[amp maxxpos] = max(max(Anew,[],1));
[amp maxzpos] = max(max(Anew,[],2));
background = mean(mean(Anew));
thermalamp = amp/2;
thermalxcen = Gfitx(3);
thermalxsig = 1.5*Gfitx(4); % 1.5*Gfitx(4); % Play with this to tweak initial fit guesses for thermal cloud size
thermalzcen = Gfitz(3);
thermalzsig = 1.5*Gfitz(4); % 1.5*Gfitz(4); % Play with this to tweak initial fit guesses for thermal cloud size
condamp = amp/2;
condxcen = maxxpos + ax(1) - 1;
condxsig = Gfitx(4);   % 0.25*Gfitx(4); % Play with this to tweak initial fit guesses for BEC size
condzcen = maxzpos + ax(3) - 1;
condzsig = Gfitz(4);   % 0.25*Gfitz(4); % Play with this to tweak initial fit guesses for BEC size

% Format:  DGguess/DGfit = [1.background, 2.thermal amplitude, 3.thermal x centre,
%               4.thermal x sigma, 5.thermal z centre, 6.thermal z sigma,
%               7.cond amplitude, 8.cond x centre, 9.cond x sigma,
%               10.cond z centre, 11.cond z sigma]

DGfit = [background, thermalamp, thermalxcen, thermalxsig, thermalzcen, ...
         thermalzsig, condamp, condxcen, condxsig, condzcen, condzsig];
