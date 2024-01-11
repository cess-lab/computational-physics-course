%
% Program to look at least squares fit to a stright line, variable errors 
%
function Least_Square_Fit2
%
clear; 
help Least_Square_Fit2;  % Clear memory and print header
% 
fprintf('Data Fit - Straight Line, Variable, Uncorrelated Errors \n');
%
% least squares fit to a st line y=a*x+b to points y err wt=1/sig^2 at x
%
% data on temp along rod between 2 heat baths at fixed temperatures
%
x = [1:9];
T = [ 15.6 17.5 36.6 43.8 58.2 61.6 64.2 70.4 98.8];
for i = 1:9
    sig(i) = 2.0 + 0.4 .*(i-1); % new thing is varying errors
end
[a,b,chi,err] = dgleast(x,T,1.0 ./(sig .^2));
a
b
chi
dof = length(x) - 2
err
da = sqrt(err(1))
db = sqrt(err(4))
%
figure(1)
errorbar(x,T,sig,'o')
hold on
xx= linspace(1,9);
yy = a .*xx + b;
plot(xx,yy,'-')
hold off
title('Temperature of Rod and Best Straight Line Fit')
xlabel('Position')
ylabel('Temperature')
%
function[a,b,chi,err]=dgleast(x,y,wt)
%
% array operations 
%
xys = x .* y .*wt;
xs = x .*wt;
ys = y .*wt;
s = wt;
xxs = x .*x .*wt;
yys = y .*y .*wt;
  xyss = sum(xys);
  xss = sum(xs);
  yss = sum(ys);
   ss = sum(s);
  xxss = sum(xxs);
  yyss = sum(yys);
d = xxss .*ss - xss .*xss;
if d == 0.,
  chi=-100.
else
  a = (xyss .*ss - xss .*yss) ./d;
  b = (xxss .*yss - xyss .*xss) ./d;
  chi = yyss + a .*a .*xxss - 2.0 .*a .*xyss + b .*b .*ss ...
      -2.0 .*b .*yss +2.0 .*a .*b .*xss;
  err(1) = ss ./d;
  err(2) = -xss ./d;
  err(3) = err(2);
  err(4)  =xxss ./d;
end
%
