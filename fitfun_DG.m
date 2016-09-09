function err=fitfun_DG(c,Anew,X,Z)

% Format:  c = [1.background, 2.thermal amplitude, 3.thermal x centre,
%               4.thermal x sigma, 5.thermal z centre, 6.thermal z sigma,
%               7.cond amplitude, 8.cond x centre, 9.cond x sigma,
%               10.cond z centre, 11.cond z sigma]

bg = c(1);
ampT = c(2);
Txc = c(3);
Tsigx = c(4);
Tzc = c(5);
Tsigz = c(6);
ampC = c(7);
Cxc = c(8);
Csigx = c(9);
Czc = c(10);
Csigz = c(11);

if (ampT < 0 || ampC < 0 || Tsigx < 0 || Tsigz < 0 || Csigx < 0 || Csigz < 0)
    Fitted_Curve = 1E9;
else
    Fitted_Curve = bg + ampT*exp(-(X-Txc).^2/Tsigx^2 - (Z-Tzc).^2/Tsigz^2) ...
        + ampC*exp(-(X-Cxc).^2/Csigx^2 - (Z-Czc).^2/Csigz^2);
end

Error_Vector=Fitted_Curve - Anew;

% When curvefitting, a typical quantity to
% minimize is the sum of squares error

err=sum(sum(Error_Vector.^2));