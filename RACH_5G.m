clc
close all
clear all

BW=8;
Tmax=14;
R=10;
lambda=1:0.5:10;
sim=[]
for Tmax=[4 8 12] 
for j=1:length(lambda)
    len=[];
    s=[];
    f=[];
    for iter=1:100
    list=[];
    for t=1:200
        new=poissrnd(lambda(j));
       list= enroll_new(new,list);
        len(iter,t)=length(list);
        suc=[];
        temp=[];
        success=0;
        fail=0;
        for i=1:length(list)              %Random preamble selection
            temp(i)=0;
            if list(i).backoff==0
                list(i).sign=randi([1 R]);
                temp(i)=list(i).sign;
            end
        end
        for i=1:R
            if sum(temp(:)==i)==1
                success=success+1;
                suc=[suc i];
            else
                fail=fail+sum(temp(:)==i);
            end
        end
       list= remove_succ(suc,list,BW);
        list=remove_expired(list,Tmax);
        s(iter,t)=success;
        f(iter,t)=fail;
    end
    end
%     plot(1:t,sum(len)/iter)
%     hold on
%     plot(1:t,sum(s)/iter,'r')
%     hold on
%     plot(1:t,sum(f)/iter)
    lengt(j)=sum(len(:,t))/iter;
    su(j)=sum(s(:,t))/iter;
end
sim=[sim;su];
hold on
plot(lambda,su)
% figure
% plot(lambda,lengt)
end

%%

function li=enroll_new(new,list)
li=list;
for l=1:new
    li=[li struct('backoff',0,'attempt',1,'sign',0)];
end
end

function list=remove_succ(suc,li,BW)
list=li;

for l=1:length(list)
    if sum(list(l).sign==suc)==1
        list(l).sign=100;
    elseif list(l).attempt==1|list(l).backoff==0
        list(l).backoff=randi([0,BW-1]);
        list(l).attempt=list(l).attempt+1;
        list(l).sign=0;
    else
        list(l).backoff=list(l).backoff-1;
        list(l).sign=0;
    end
end
if length(list)~=0
list([list.sign]==100)=[];
end
end

function list=remove_expired(li,Tmax)
list=li;
for l=1:length(list)
    if list(l).attempt>Tmax
        list(l).sign=100;
    end
end
if length(list)~=0
list([list.sign]==100)=[];
end
end
