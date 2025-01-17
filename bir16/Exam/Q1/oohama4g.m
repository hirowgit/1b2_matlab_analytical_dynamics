clear all
syms t n g b d m c

B = @(n) n +b/c* n;
P = @(n) n -d*c* n;
M = @(n) n+m;

% c = @(n) g*(1-1/n);

display('True Ans: F(n(t),b,d,m,g)=');
Fn=expand(M(P(B(n))));
Fn=expand(subs(Fn,c,g*(1-1/n)))

display('Your answer: F(n(t),b,d,m,g)=');

func1 = @(n,b,c) (((n+m)-d*c*(n+m))*b/c*((n+m)-d*c*(n+m)));
func2 = @(n,g) (g*(1-1/n));

Fny=func2(func1(n,b,c),g);
expand(Fny)

pramName=[g b d m];
paramVal=[0.01 0.02 0.03 0.05];
newEq=subs(Fn,pramName,paramVal);
newEqy=subs(Fny,pramName,paramVal);

nd=2; ndy=nd;
subs(newEq,n,nd)
subs(newEqy,n,nd)
dataAll=[nd ndy];
for i=1:10
    nd=double(subs(newEq,n,nd));
    ndy=double(subs(newEqy,n,ndy));
%     ndy=func1(ndy,b,c);
%     ndy=func2(ndy,g);
    dataAll(end+1,:)=[nd ndy];
end

figure(8); clf; plot(dataAll);
legend({'true','yours'});