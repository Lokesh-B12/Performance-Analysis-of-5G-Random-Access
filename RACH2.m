clc
clear all
close all
R=[16 32 64];
lambd=0.1:0.2:40;
W=[4 4 4];
F=0.001:0.0000001:1;
sol1=zeros(length(W),length(lambd));
sol2=zeros(length(W),length(lambd));
sol3=zeros(length(W),length(lambd));
for w=1:length(W)
  rho=lambd./R(w);
    for r=1:length(rho)
        for f=1:length(F)-1
            if (abs((((1-F(f)).^W(w)-1)./(log(F(f))))-(F(f)./rho(r)))<(0.00001/rho(r))) 
                sol1(w,r)=F(f);
                break         
            end
                
        end
    end
end
for w=1:length(W)
  rho=lambd./R(w);
    for r=1:length(rho)
        for f=1:length(F)
            if (abs((((1-F(f)).^W(w)-1)./(log(F(f))))-(F(f)./(2.*rho(r))))<(0.00001/rho(r))) 
                sol2(w,r)=F(f);
                break         
            end
                
        end
    end
end
for w=1:length(W)
  rho=lambd./R(w);
    for r=1:length(rho)
        for f=1:length(F)
            if (abs((((1-F(f)).^W(w)-1)./(log(F(f))))-(F(f)./(4.*rho(r))))<(0.00001/rho(r))) 
                sol3(w,r)=F(f);
                break         
            end
                
        end
    end
end