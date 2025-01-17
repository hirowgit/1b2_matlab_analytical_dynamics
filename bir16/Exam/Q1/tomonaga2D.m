% tominaga

B = @(n) n +b/c* n;
P = @(n) n -d*c* n;
M = @(n) n+m;

c = @(n) g*(1-1/n);

display('True Ans: F(n(t),b,d,m,g)=');
Fn=M(P(B(n)));
expand(Fn)

display('Your answer: F(n(t),b,d,m,g)=');
Fny=g*(1-1/(1-d)*(1+b)*n+m);
expand(Fny)

% display('Your answer: F(n(t),b,d,m,g)=');
% Fny2=g*(1-1/((1-d)*(1+b))*n+m);
% expand(Fny2)

newEq=subs(Fn,[g b d m],[0.01 0.02 0.03 0.05]);

nd=2;
subs(newEq,n,nd)
dataAll=nd;
for i=1:10
    nd=double(subs(newEq,n,nd));
    dataAll(end+1)=nd;
end

figure(8); clf; plot(dataAll)