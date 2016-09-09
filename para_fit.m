function yfun = para_fit(params,posdata)
% Provides a fitting function for an absorption image.

yfun = params(1) - params(2)*(posdata - params(3)).^2;

% params(1) = prefactor (Height of peak)
% params(2) = Controls width
% params(3) = Centred on...
