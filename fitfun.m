function err = fitfun(c,I)

s = length(I);
x = (1:s);

R = c(1)+c(2)*exp(- (x-c(3)).^2 / (c(4).^2) );

err = sum((R-I).^2);
