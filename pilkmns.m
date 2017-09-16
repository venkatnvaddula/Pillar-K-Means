function [cidx ctr]=pilkmns(x,K)
%x=ab;K=3;
C=[];SX=[];
[d,n] = size(x);
K=round(K);
%------------------------
oldmu=mean(x);
%-------------------------
while(1),
DM=zeros(1,n);
cntr=1;
D=dist(x,oldmu);
nmin=4/K;
nbdis=max(D);
for i=1:K
    if cntr<=K               
        DM=DM+D;
        tmpc=max(DM);
        idx=find(tmpc==DM);
        SX=union(SX,idx);
        DD(i,:)=dist(x,tmpc);
        no=find(D<=nbdis);
        C=[C tmpc];        
        D(SX)=0;
        DM(no)=0;
        SX=[];
        cntr=cntr+1;
     end
end 
  [Dmin,index] = min(DD);
  c = index;
  moved = sum(index~=c);  
   cidx=c;
   ctr=C;
  if (moved==0), break, end    
end
