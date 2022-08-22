fclc
clear all
close all
rho=0.01:0.001:1;
W=[8];
sol=zeros(length(W),length(rho));
for w=1:length(W)
    for r=1:length(rho)
        for f=0.01:0.00000001:0.025
            if (abs((((1-f).^W(w)-1)./(log(f)))-(f./rho(r)))<0.01) 
                sol(w,r)=f;
                
            else
               
            end
                
        end
          sol(w,r)
    end
  
end

 plot(f,((1-f).^4-1)./log(f),'linewidth',3)
hold on
plot(f,((1-f).^8-1)./log(f),'linewidth',3)
 hold on
 plot(f,((1-f).^12-1)./log(f),'linewidth',3)
 xlim([0 0.6])
 xlim([0 0.6])
 ylim([0 2])
 hold on
 plot(f,((1-f).^16-1)./log(f),'linewidth',3)
 xlabel('f')
 ylabel('g(f)')
 legend('T_{max}=4','T_{max}=8','T_{max}=12','T_{max}=16')
 h=legend('T_{max}=4','T_{max}=8','T_{max}=12','T_{max}=16','location','northwest')
 set(gca,'Fontweight','Bold','Fontsize','14')
 set(gca,'Fontsize',14,'Fontweight','Bold')
 set(h,'Fontsize',14,'Fontweight','Bold')
 set(gca,'Fontsize',14,'Fontweight','Bold','linewidth',3)