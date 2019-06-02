%Start Programming. 1 crossover with mutation
clc
clear all
close all

%Resources...
foodr = 250;%r   input('Enter available food(Ton): \r\n');
waterr = 120;%r   input('Enter available water(Gallon): \r\n');
clothr = 200;%r   input('Enter available cloth(Dozen): \r\n');
mer = 150;%r   input('Enter available medical equipments(Packet): \r\n');
rmr = 76;%r   input('Enter available rescue member(Number): \r\n');
%number of area
s=4;%r   input('How many sites? ');
Sum=0;

%population density
c=26180;%r   input('Enter number of population density: ');


%number of casualty
cs=750;%r   input('Enter number of casualty: ');


%time
t=1;

%number of organization
org=3;


%initialization of the total demands by zero.

totfoodd=0;
totwaterd=0;
totclothd=0;
totmed=0;
totrmd=0;

%Assigning input of Initial demand for each resource in each area or gbest.
    %Area:1
    ifdmnd(1) = 120 ;
    iwdmnd(1) = 60;
    icdmnd(1) = 50;
    imedmnd(1)= 60;
    irmdmnd(1)= 20;
    %Area:2
    ifdmnd(2) = 60;
    iwdmnd(2) = 22;
    icdmnd(2) = 41;
    imedmnd(2)= 100;
    irmdmnd(2)= 25;
    %Area:3
    ifdmnd(3) = 40;
    iwdmnd(3) = 100;
    icdmnd(3) = 45;
    imedmnd(3)= 70;
    irmdmnd(3)= 20;
    %Area:4
    ifdmnd(4) = 60;
    iwdmnd(4) = 90;
    icdmnd(4) = 57;
    imedmnd(4)= 75;
    irmdmnd(4)= 5;

    for i = 1:s
        orgfdmnd(i) = ifdmnd(i);
        orgwdmnd(i) = iwdmnd(i);
        orgcdmnd(i) = icdmnd(i);
        orgmedmnd(i) = imedmnd(i);
        orgrmdmnd(i) = irmdmnd(i);
    end
        
        



    %{
    calculating total..................
    totfoodd=sum(ifdmnd);
    totwaterd=sum(iwdmnd);
    totclothd=sum(icdmnd);
    totmed=sum(imedmnd);
    totrmd=sum(irmdmnd);
%}

%initial details of each area...
%{
for n = 1:s
   %Initial demand
    ifdmnd(n) = input(['Enter food Demand of site ' num2str(n) '(Ton):\n']);
    iwdmnd(n) = input(['Enter water Demand of site ' num2str(n) '(Gallon):\n']);
    icdmnd(n) = input(['Enter cloths Demand of site ' num2str(n) '(Dozen):\n']);
    imedmnd(n) = input(['Enter medical equipments Demand of site ' num2str(n) '(Packet):\n']);
    irmdmnd(n) = input(['Enter rescue member Demand of site ' num2str(n) '(Number):\n']);
        
    %calculate the total resource demand for each site
    totfoodd=totfoodd+ifdmnd(n);
    totwaterd=totwaterd+iwdmnd(n);
    totclothd=totclothd+icdmnd(n);
    totmed=totmed+imedmnd(n);
    totrmd=totrmd+irmdmnd(n);
end

%}

%{
Finding minimum of demand array
minfdmnd = min(ifdmnd);
minwdmnd = min(iwdmnd);
mincdmnd = min(icdmnd);
minmdmnd = min(imedmnd);
minrdmnd = min(irmdmnd);

 totpdf = 0;
 totpdw = 0;
 totpdc = 0;
 totpdm = 0;
 totpdr = 0;

%}

%finding plotted demand
 for i=1:s
    fdmnd(i)=(ifdmnd(i)/totfoodd)*foodr; 
    %totpdf = totpdf+fdmnd(i);
    wdmnd(i)=(iwdmnd(i)/totwaterd)*waterr;
    %totpdw = totpdw+wdmnd(i);
    cdmnd(i)=(icdmnd(i)/totclothd)*clothr;
    %totpdc = totpdc+cdmnd(i);
    medmnd(i)=(imedmnd(i)/totmed)*mer;
    %totpdm = totpdm+medmnd(i);
    rmdmnd(i)=(irmdmnd(i)/totrmd)*rmr;
    %totpdr = totpdr+rmdmnd(i);
 end
 
 %checking if demand greater availability
 if totfoodd >= foodr
     for i = 1:s
         ifdmnd(i) = fdmnd(i);
     end
     minfdmnd = min(ifdmnd);
 else
    minfdmnd = min(ifdmnd); 
 end
 
 if totwaterd >= waterr
     for i = 1:s
         iwdmnd(i) = wdmnd(i);
     end
     minwdmnd = min(iwdmnd);
 else
   minwdmnd = min(iwdmnd);  
 end
 
 
 if totclothd >= clothr
     for i = 1:s
         icdmnd(i) = cdmnd(i);
     end
     mincdmnd = min(icdmnd);
 else
     mincdmnd = min(icdmnd);
 end
 
 
 if totmed >= mer
     for i = 1:s
         imedmnd(i) = medmnd(i);
     end
     minmdmnd = min(imedmnd);
 else
     minmdmnd = min(imedmnd);
 end
 
 if totrmd >= rmr
     for i = 1:s
         irmdmnd(i) = rmdmnd(i);
     end
     minrdmnd = min(irmdmnd);
 else
     minrdmnd = min(irmdmnd);
 end
 
 
 
 
 
 %{
Finding minimum of plotted demand array
pminfdmnd = min(fdmnd);
pminwdmnd = min(wdmnd);
pmincdmnd = min(cdmnd);
pminmdmnd = min(medmnd);
pminrdmnd = min(rmdmnd);
%}
 
 
%Forming initial candidate solutions

for i = 1:s
    IFCS(1,i) = ifdmnd(i);
    IFCS(2,i) = (1/2)*ifdmnd(i);
    IFCS(3,i) = (1/3)*ifdmnd(i);
    IFCS(4,i) = minfdmnd;
end


for i = 1:s
    IWCS(1,i) = iwdmnd(i);
    IWCS(2,i) = (1/2)*iwdmnd(i);
    IWCS(3,i) = (1/3)*iwdmnd(i);
    IWCS(4,i) = minwdmnd;
end


for i = 1:s
    ICCS(1,i) = icdmnd(i);
    ICCS(2,i) = (1/2)*icdmnd(i);
    ICCS(3,i) = (1/3)*icdmnd(i);
    ICCS(4,i) = mincdmnd;
end


for i = 1:s
    IMCS(1,i) = imedmnd(i);
    IMCS(2,i) = (1/2)*imedmnd(i);
    IMCS(3,i) = (1/3)*imedmnd(i);
    IMCS(4,i) = minmdmnd;
end


for i = 1:s
    IRCS(1,i) = irmdmnd(i);
    IRCS(2,i) = (1/2)*irmdmnd(i);
    IRCS(3,i) = (1/3)*irmdmnd(i);
    IRCS(4,i) = minrdmnd;
end



%calculating total..................
    totfoodd=sum(ifdmnd);
    totwaterd=sum(iwdmnd);
    totclothd=sum(icdmnd);
    totmed=sum(imedmnd);
    totrmd=sum(irmdmnd);


%Displaying the details of initial candidate solutions 
disp('Initial food allocations');
disp(IFCS);
disp('Initial water allocations');
disp(IWCS);
disp('Initial cloth allocations');
disp(ICCS);
disp('Initial medicine allocations');
disp(IMCS);
disp('Initial rescueteam allocations'); 
disp(IRCS);


%finding allocatable percentages of resources


%food
apfood=((c*100)/(foodr*totfoodd*t*s*org));
if apfood>100      %if allocation percentage is -ve or grater than 100 then it is divided by casualty 
    apfood=apfood/cs;
    if apfood>100   %if allocation percentage is -ve or grater than 100 then it is set to 100 
        apfood=100;
    end
end
totafood=(foodr*(100-apfood))/100;
disp(totafood);


%water
apwater=((c*100)/(waterr*totwaterd*t*s*org));
if apwater>100     %if allocation percentage is -ve or grater than 100 then it is divided by casualty 
    apwater=apwater/cs;
     if apwater>100      %if allocation percentage is -ve or grater than 100 then it is set to 100 
      apwater=100;
     end
end
totawater=(waterr*(100-apwater))/100;
disp(totawater);


%cloth
apcloth=((c*100)/(clothr*totclothd*t*s*org));
if apcloth > 100     %if allocation percentage is -ve or grater than 100 then it is divided by casualty 
    apcloth=apcloth/cs;
    if apcloth > 100       %if allocation percentage is -ve or grater than 100 then it is set to 100 
      apcloth=100;
    end
end
totacloth=(clothr*(100-apcloth))/100;
disp(totacloth);

%medical
apme=((c*100)/(mer*totmed*t*s*org));
if apme>100     %if allocation percentage is -ve or grater than 100 then it is divided by casualty 
    apme=apme/cs;
    if apme>100      %if allocation percentage is -ve or grater than 100 then it is set to 100 
       apme=100;
    end
end
totame=(mer*(100-apme))/100;
disp(totame);

%rescue
aprm=((c*100)/(rmr*totrmd*t*s*org));
if aprm>100      %if allocation percentage is -ve or grater than 100 then it is divided by casualty 
    aprm=aprm/cs;
    if aprm>100     %if allocation percentage is -ve or grater than 100 then it is set to 100
     aprm=100;
    end
end
totarm=(rmr*(100-aprm))/100;
disp(totarm);


p = 1*s;
disp('Value of p')
disp(p)
p1 = p/2;



%{
p = 1*s;
p1 = p/2;
g = foodr/s;
if totfoodd >= foodr
  for m = 1:p-2
    k=2;
    for n =1:s
        IFCS(m,n) = round(1/k.*fdmnd(n));
    k=k+1;
    end
    m = m+1;
  end
  for j = 1:s
    IFCS(p-1,j) = round(pminfdmnd);
    IFCS(p,j) = round(fdmnd(j));
  end
  disp(IFCS)
else
  for m = 1:p-1 
    for n =1:s
        IFCS(m,n) = round(1/m.*ifdmnd(n));
    end
    m = m+1;
  end
    for j = 1:s
        IFCS(p-1,j)=round(minfdmnd);
        IFCS(p,j) = round(g);
    end
end

g = waterr/s;
if totwaterd >= waterr
  for m = 1:p-2
    for n =1:s
       IWCS(m,n) = round(1/(m+1).*wdmnd(n));
    end
    m = m+1;
  end
    for j = 1:s
        IWCS(p-1,j) = round(pminwdmnd);
        IWCS(p,j) = round(g);
    end
else
  for m = 1:p-2
    for n =1:s
        IWCS(m,n) = round(1/(m+1).*iwdmnd(n));
    end
    m = m+1;
  end
    for j = 1:s
        IWCS(p-1,j) = round(minwdmnd);
        IWCS(p,j) = round(g);
    end
end

g = clothr/s;
if totclothd >= clothr
  for m = 1:p-2
    for n =1:s
        ICCS(m,n) = round(1/(m+1).*cdmnd(n));
    end
    m = m+1;
  end
    for j = 1:s
       ICCS(p,j) = round(pmincdmnd);
       ICCS(p-1,j) = round(g);
    end

else
  for m = 1:p-2
    for n =1:s
        ICCS(m,n) = round(1/(m+1).*icdmnd(n));
    end
    m = m+1;
  end
    for j = 1:s
       ICCS(p,j) = round(mincdmnd);
       ICCS(p-1,j) = round(g);
    end
end
    
 
g = mer/s;
if totmed >= mer
  for m = 1:p-2
    for n =1:s
        IMCS(m,n) = round(1/(m+1).*medmnd(n));
    end
    m = m+1;
  end
    for j = 1:s
        IMCS(p,j) = round(pminmdmnd);
        IMCS(p-1,j) = round(g);
    end
else
  for m = 1:p-2
    for n =1:s
         IMCS(m,n) = round(1/(m+1).*imedmnd(n));
    end
    m = m+1;
  end
    for j = 1:s
        IMCS(p,j) = round(minmdmnd);
        IMCS(p-1,j) = round(g);
    end
end
  
g = rmr/s;
if totrmd >= rmr
  for m = 1:p-2
    for n =1:s
        IRCS(m,n) = round(1/(m+1).*rmdmnd(n));
    end
    m = m+1;
  end
    for j = 1:s
        IRCS(p,j) = round(pminrdmnd);
        IRCS(p-1,j) = round(g);
    end
else
  for m = 1:p-2
    for n =1:s
         IRCS(m,n) = round(1/(m+1).*irmdmnd(n));
    end
    m = m+1;
  end
    for j = 1:s
        IRCS(p,j) = round(minrdmnd);
        IRCS(p-1,j) = round(g);
    end
end
   

%}


fn=sprintf('---FOOD ALLOCATION.txt');
f=fopen(fn,'w'); 
%fprintf(f,'FOOD allocations at iteration');
fn1=sprintf('---WATER ALLOCATION.txt');
w=fopen(fn1,'w'); 
fn2=sprintf('---CLOTH ALLOCATION.txt');
c1=fopen(fn2,'w'); 
fn3=sprintf('---MEDICAL.txt');
m=fopen(fn3,'w'); 
fn4=sprintf('---RESCUE.txt');
r1=fopen(fn4,'w'); 




 kf = 1;
 kw = 1;
 kc = 1;
 km = 1;
 kr = 1;

 S=1;
 while 1
   %finding total allocations for each resource by each candidate solution
   tot = 0;
   for i = 1:p
       totfcs = 0;
       for j = 1:s
           totfcs = totfcs+IFCS(i,j);
       end
       fitfcs = sqrt(((0.5*(totfoodd-totfcs))+(0.5*(totafood-totfcs))).^2);
       IFCS(i,s+1) = fitfcs;
       tot = tot+fitfcs;
       i=i+1;
   end
   FITFD(kf) = tot/p;
   kf = kf+1;
   %disp(FITFD)
   
   
   for i = 1:p
       totwcs = 0;
       for j = 1:s
           totwcs = totwcs+IWCS(i,j);
           j = j+1;
       end
       fitwcs = sqrt(((0.5*(totwaterd-totwcs))+(0.5*(totawater-totwcs))).^2);
       IWCS(i,s+1) = fitwcs;
       i=i+1;
   end
   tot = 0;
   tot = sum(IWCS(:,s+1));
   FITWT(kw) = tot/p;
   kw = kw+1;
    
    
   for i = 1:p
       totccs = 0;
       for j = 1:s
           totccs = totccs+ICCS(i,j);
           j = j+1;
       end
       fitccs = sqrt(((0.5*(totclothd-totccs))+(0.5*(totacloth-totccs))).^2);
       ICCS(i,s+1) = fitccs;
       i=i+1;
   end
   tot = 0;
   tot = sum(ICCS(:,s+1));
   FITCT(kc) = tot/p;
   kc = kc+1;
      
       
   for i = 1:p
       totmcs = 0;
       for j = 1:s
           totmcs = totmcs+IMCS(i,j);
           j = j+1;
       end
       fitmcs = sqrt(((0.5*(totmed-totmcs))+(0.5*(totame-totmcs))).^2);
       IMCS(i,s+1) = fitmcs;
       i=i+1;
   end
   tot = 0;
   tot = sum(IMCS(:,s+1));
   FITMD(km) = tot/p;
   km = km+1;
    
       
   for i = 1:p
       totrcs = 0;
       for j = 1:s
           totrcs = totrcs+IRCS(i,j);
           j = j+1;
       end
       fitrcs = sqrt(((0.5*(totrmd-totrcs))+(0.5*(totarm-totrcs))).^2);
       IRCS(i,s+1) = fitrcs;
       i=i+1;
   end
   tot = 0;
   tot = sum(IRCS(:,s+1));
   FITRS(kr) = tot/p;
   kr = kr+1;
        
    [fdmax,fdmaxpos] = max(IFCS(:,s+1));
    [wtmax,wtmaxpos] = max(IWCS(:,s+1));
    [clmax,clmaxpos] = max(ICCS(:,s+1));
    [medmax,medmaxpos] = max(IMCS(:,s+1));
    [rsmax,rsmaxpos] = max(IRCS(:,s+1));
    
    [fdmin,fdminpos] = min(IFCS(:,s+1));
    [wtmin,wtminpos] = min(IWCS(:,s+1));
    [clmin,clminpos] = min(ICCS(:,s+1));
    [medmin,medminpos] = min(IMCS(:,s+1));
    [rsmin,rsminpos] = min(IRCS(:,s+1));
    
    for j = 1:s
        falcnx(kf,j) = IFCS(fdminpos,j);
    end
     %disp(falcnx)
    for j = 1:s
        walcnx(kw,j) = IFCS(wtminpos,j);
    end
    
    for j = 1:s
        calcnx(kc,j) = IFCS(clminpos,j);
    end
    
    for j = 1:s
        malcnx(km,j) = IFCS(medminpos,j);
    end
    
    for j = 1:s
        ralcnx(kr,j) = IFCS(rsminpos,j);
    end
    
      %sorting population matrix based on fitness value
      IFCSS = sortrows(IFCS, (s+1));
      IWCSS = sortrows(IWCS, (s+1));
      ICCSS = sortrows(ICCS, (s+1));
      IMCSS = sortrows(IMCS, (s+1));
      IRCSS = sortrows(IRCS, (s+1));
      
      %MATING POOL AND CROSSOVER PARTNER
      %FOOD
     
      MPIFCS = IFCS;
      for j = 1:s+1
        MPIFCS(fdmaxpos,j) = IFCS(fdminpos,j);
      end
      MPIFCS = sortrows(MPIFCS, (s+1)); %in ascending order
   
      p1=p/2;
      for i = 1:p1
          rndf(i) = -1;
          i = i+1;
      end
      i=1;
      while i<=p1
          flag=0;
          r = randi([p1+1,p],1,1);
          for j= 1:i
              if(r==rndf(j))
                  flag = 1;
                  break;
              end
              j=j+1;
          end
          if (flag~=1)
              rndf(i)=r;
              i=i+1;
          end
      end
      
      for i = 1:p1
          MPIFCS(i,s+2) = rndf(i);
          W=rndf(i);
          MPIFCS(W,s+2) = i;
          i = i+1;
      end
    
    
      %WATER
      MPIWCS = IWCS;
      for j = 1:s+1
        MPIWCS(wtmaxpos,j) = IWCS(wtminpos,j);
      end
      MPIWCS = sortrows(MPIWCS, (s+1));
     
      for i = 1:p1
          rndw(i) = -1;
          i = i+1;
      end
      i=1;
      while i<=p1
          flag=0;
          r = randi([p1+1,p],1,1);
          for j= 1:i
              if(r==rndw(j))
                  flag = 1;
                  break;
              end
              j=j+1;
          end
          if (flag~=1)
              rndw(i)=r;
              i=i+1;
          end
      end
      
      for i = 1:p1
          MPIWCS(i,s+2) = rndw(i);
          W=rndw(i);
          MPIWCS(W,s+2) = i;
          i = i+1;
      end
     
      
      %CLOTH
      MPICCS = ICCS;
      for j = 1:s+1
        MPICCS(clmaxpos,j) = ICCS(clminpos,j);
      end
      MPICCS = sortrows(MPICCS, (s+1));
      
      for i = 1:p1
          rndc(i) = -1;
          i = i+1;
      end
      i=1;
      while i<=p1
          flag=0;
          r = randi([p1+1,p],1,1);
          for j= 1:i
              if(r==rndc(j))
                  flag = 1;
                  break;
              end
              j=j+1;
          end
          if (flag~=1)
              rndc(i)=r;
              i=i+1;
          end
      end
      
      for i = 1:p1
          MPICCS(i,s+2) = rndc(i);
          W=rndc(i);
          MPICCS(W,s+2) = i;
          i = i+1;
      end
     
     
      %MEDICAL
      MPIMCS = IMCS;
      for j = 1:s+1
        MPIMCS(medmaxpos,j) = IMCS(medminpos,j);
      end
      MPIMCS = sortrows(MPIMCS, (s+1));
      
      for i = 1:p1
          rndm(i) = -1;
          i = i+1;
      end
      i=1;
      while i<=p1
          flag=0;
          r = randi([p1+1,p],1,1);
          for j= 1:i
              if(r==rndm(j))
                  flag = 1;
                  break;
              end
              j=j+1;
          end
          if (flag~=1)
              rndm(i)=r;
              i=i+1;
          end
      end
      
      for i = 1:p1
          MPIMCS(i,s+2) = rndm(i);
          W=rndm(i);
          MPIMCS(W,s+2) = i;
          i = i+1;
      end
      
     
      
      %RESCUE
      MPIRCS = IRCS;
      for j = 1:s+1
        MPIRCS(rsmaxpos,j) = IRCS(rsminpos,j);
      end
      MPIRCS = sortrows(MPIRCS, (s+1));
      for i = 1:p1
          rndr(i) = -1;
          i = i+1;
      end
      i=1;
      while i<=p1
          flag=0;
          r = randi([p1+1,p],1,1);
          for j= 1:i
              if(r==rndr(j))
                  flag = 1;
                  break;
              end
              j=j+1;
          end
          if (flag~=1)
              rndr(i)=r;
              i=i+1;
          end
      end
      
      for i = 1:p1
          MPIRCS(i,s+2) = rndr(i);
          W=rndr(i);
          MPIRCS(W,s+2) = i;
          i = i+1;
      end
     
      %CROSSOVER BASED ON CROSSOVER RATE
      a = 0.5;
      C_Rate = 1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      PC = C_Rate*p;
      
      if(C_Rate == 1 || C_Rate == 0.9) %all parents undergo crossover
          for  i = 1:p1
              for j = 1:s
                  b = MPIFCS(i,s+2);
                  OFSPRING1(i,j) = round(a.*MPIFCS(i,j)+(1-a).*MPIFCS(b,j));
                  OFSPRING2(i,j) = round((1-a).*MPIFCS(i,j)+a.*MPIFCS(b,j));
              end
          end
      else
         for  i = 1:p1  
              for j = 1:s
                    b = MPIFCS(p,s+2);
                    OFSPRING1(i,j) = round(a.*MPIFCS(p,j)+(1-a).*MPIFCS(b,j));
                    OFSPRING2(i,j) =round((1-a).*MPIFCS(p,j)+a.*MPIFCS(b,j));
              end
         end
      end
      MPIFCS=[OFSPRING1;OFSPRING2];    
  
    
      if(C_Rate == 1 || C_Rate == 0.9) %all parents undergo crossover
          for  i = 1:p1
              for j = 1:s
                  b = MPIWCS(i,s+2);
                  OFSPRING1(i,j) = round(a.*MPIWCS(i,j)+(1-a).*MPIWCS(b,j));
                  OFSPRING2(i,j) = round((1-a).*MPIWCS(i,j)+a.*MPIWCS(b,j));
              end
          end
      else
          for  i = 1:p1  
              for j = 1:s
                    b = MPIWCS(p,s+2);
                    OFSPRING1(i,j) = round(a.*MPIWCS(p,j)+(1-a).*MPIWCS(b,j));
                    OFSPRING2(i,j) =round((1-a).*MPIWCS(p,j)+a.*MPIWCS(b,j));
              end
         end
          
      end
      
      MPIWCS=[OFSPRING1;OFSPRING2];
      
      if(C_Rate == 1 || C_Rate == 0.9) %all parents undergo crossover
          for  i = 1:p1
              for j = 1:s
                  b = MPICCS(i,s+2);
                  OFSPRING1(i,j) = round(a.*MPICCS(i,j)+(1-a).*MPICCS(b,j));
                  OFSPRING2(i,j) = round((1-a).*MPICCS(i,j)+a.*MPICCS(b,j));
              end
          end
      else
          for  i = 1:p1  
              for j = 1:s
                    b = MPICCS(p,s+2);
                    OFSPRING1(i,j) = round(a.*MPICCS(p,j)+(1-a).*MPICCS(b,j));
                    OFSPRING2(i,j) =round((1-a).*MPICCS(p,j)+a.*MPICCS(b,j));
              end
         end
      end
      MPICCS=[OFSPRING1;OFSPRING2];
     
      if(C_Rate == 1 || C_Rate == 0.9) %all parents undergo crossover
          for  i = 1:p1
              for j = 1:s
                  b = MPIMCS(i,s+2);
                  OFSPRING1(i,j) = round(a.*MPIMCS(i,j)+(1-a).*MPIMCS(b,j));
                  OFSPRING2(i,j) = round((1-a).*MPIMCS(i,j)+a.*MPIMCS(b,j));
              end
          end
      else
          for  i = 1:p1  
              for j = 1:s
                    b = MPIMCS(p,s+2);
                    OFSPRING1(i,j) = round(a.*MPIMCS(p,j)+(1-a).*MPIMCS(b,j));
                    OFSPRING2(i,j) =round((1-a).*MPIMCS(p,j)+a.*MPIMCS(b,j));
              end
         end
      end
      MPIMCS=[OFSPRING1;OFSPRING2];
     
      if(C_Rate == 1 || C_Rate == 0.9) %all parents undergo crossover
          for  i = 1:p1
              for j = 1:s
                  b = MPIRCS(i,s+2);
                  OFSPRING1(i,j) = round(a.*MPIRCS(i,j)+(1-a).*MPIRCS(b,j));
                  OFSPRING2(i,j) = round((1-a).*MPIRCS(i,j)+a.*MPIRCS(b,j));
              end
          end
      else
          for  i = 1:p1  
              for j = 1:s
                    b = MPIRCS(p,s+2);
                    OFSPRING1(i,j) = round(a.*MPIRCS(p,j)+(1-a).*MPIRCS(b,j));
                    OFSPRING2(i,j) =round((1-a).*MPIRCS(p,j)+a.*MPIRCS(b,j));
              end
         end
      end
      MPIRCS=[OFSPRING1;OFSPRING2];
    
      %Mutation
   
      M_Rate = 0.01;
      PM = ceil(M_Rate*p*s);
      %disp('value of PM')
      %disp(PM)
      %disp(s)
     
      for i = 1:p
          X=0+(1-0).*rand(1,1);
          c = 0;
          if(X<=0.05)
              pos1 = randi(s);
              if(pos1 == s)
                    pos2 = 1;
              else
                    pos2 = pos1+1;
              end
              t= MPIFCS(i,pos1);
              MPIFCS(i,pos1)=MPIFCS(i,pos2);
              MPIFCS(i,pos2)=t;
              c=c+1;
              disp('mutation')
              Sum=Sum+c;
              disp(Sum);
          end
          if(c==PM)
              break;
          end
      end
    
      for i = 1:p
          X=0+(1-0).*rand(1,1);
          c = 0;
          if(X<=0.05)
              pos1 = randi(s);
              if(pos1 == s)
                    pos2 = 1;
              else
                    pos2 = pos1+1;
              end
              t= MPIWCS(i,pos1);
              MPIWCS(i,pos1)=MPIWCS(i,pos2);
              MPIWCS(i,pos2)=t;
              c=c+1;
          end
          if(c==PM)
              break;
          end
      end
     
      for i = 1:p
          X=0+(1-0).*rand(1,1);
          c = 0;
          if(X<=0.05)
              pos1 = randi(s);
              if(pos1 == s)
                    pos2 = 1;
              else
                    pos2 = pos1+1;
              end
              t= MPICCS(i,pos1);
              MPICCS(i,pos1)=MPICCS(i,pos2);
              MPICCS(i,pos2)=t;
              c=c+1;
          end
          if(c==PM)
              break;
          end
      end
      
      
      for i = 1:p
          X=0+(1-0).*rand(1,1);
          c = 0;
          if(X<=0.05)
              pos1 = randi(s);
              if(pos1 == s)
                    pos2 = 1;
              else
                    pos2 = pos1+1;
              end
              t= MPIMCS(i,pos1);
              MPIMCS(i,pos1)=MPIMCS(i,pos2);
              MPIMCS(i,pos2)=t;
              c=c+1;
          end
          if(c==PM)
              break;
          end
      end
      
     
      for i = 1:p
          X=0+(1-0).*rand(1,1);
          c = 0;
          if(X<=0.05)
              pos1 = randi(s);
              if(pos1 == s)
                    pos2 = 1;
              else
                    pos2 = pos1+1;
              end
              t= MPIRCS(i,pos1);
              MPIRCS(i,pos1)=MPIRCS(i,pos2);
              MPIRCS(i,pos2)=t;
              c=c+1;
          end
          if(c==PM)
              break;
          end
      end
   
      %mutationend
      IFCS=MPIFCS;
      disp(IFCS);
      IWCS=MPIWCS;
      disp(IWCS);
      ICCS=MPICCS;
      disp(ICCS);
      IMCS=MPIMCS;
      disp(IMCS);
      IRCS=MPIRCS;
      disp(IRCS);
      %disp('--------------------')
      
      
       if(S==200)
           break;
       end
      S=S+1;
 end
 
 
 
 tot1 = 0;
 tot2 = 0;
 tot3 = 0;
 tot4 = 0;
 tot5 = 0;
 
 
 disp(IFCS)
 for i = 1:4
     tot1 = tot1+IFCS(1,i);
 end
 disp('total')
 disp(tot1)
 disp(IWCS)
 for i = 1:4
     tot2 = tot2+IWCS(1,i);
 end
 
 disp(tot2)
 disp(ICCS)
 for i = 1:4
     tot3 = tot3+ICCS(1,i);
 end
 
  disp(tot3)
 disp(IMCS)
 for i = 1:4
     tot4 = tot4+IMCS(1,i);
 end
 
 disp(tot4)
 
 disp(IRCS)
 for i = 1:4
     tot5 = tot5+IRCS(1,i);
 end
 
 disp(tot5)

 %disp(FITCT)
 
 %}
 
 %{
 fprintf(f, '\r\n total availability--- %d \n total allocatble-- %0.2f \n Initial population %0.2f----- \n ', foodr, totafood, orgfdmnd); 
 fprintf(f,'\r\n  %0.2f \n', IFCS);
 fprintf(f,'\r\n FITNESS VALUE CONVERGENCE %0.2f \n', FITFD);    
 fprintf(w,'\r\n  %0.2f\r\n', IWCS);
      
 fprintf(c1,'\r\n %0.2f\r\n', ICCS);
      
 fprintf(m,'\r\n %0.2f\r\n', IMCS);
     
 fprintf(r1,'\r\n %0.2f\r\n', IRCS);
 
 
 
 fclose(f);
 fclose(w);
 fclose(c1);
 fclose(m);
 fclose(r1);
   
  %}
 %---------------------------------PLOT---------------------------  
    %disp(falcnx)    

 for i=1:s
    for j=200:-1:2
        if falcnx(j-1,i) ~= falcnx(j,i)
            %Take fitness value of each area.
            fj(i)=j;
            
            break
        end
    end
    i=i+1;
 end

 mfj=max(fj);
 %disp(mfj)
 %For Water...
for i=1:s
    for j=200:-1:2
        if walcnx(j-1,i) ~= walcnx(j,i)
            wj(i)=j;
            break
        end
    end
    i=i+1;
end
mwj=max(wj);
%For Clothes...
for i=1:s
    for j=200:-1:2
        if calcnx(j-1,i) ~= calcnx(j,i)
            cj(i)=j;
            break
        end
    end
    i=i+1;
end
mcj=max(cj);
%For ME...
for i=1:s
    for j=200:-1:2
        if malcnx(j-1,i) ~= malcnx(j,i)
            mej(i)=j;
            break
        end
    end
    i=i+1;
end
mmej=max(mej);
%For RM...
for i=1:s
    for j=200:-1:2
        if ralcnx(j-1,i) ~= ralcnx(j,i)
            rmj(i)=j;
            break
        end
    end
    i=i+1;
end
mrmj=max(rmj);
          
     
h = zeros(5,1);
figure();
for i=1:199
    plot(i,FITFD(i),'k*'); hold on
    i=i+1;
end
h(1)=plot(i,FITFD(i),'k*');
for i=1:199
    plot(i,FITWT(i),'k+'); hold on
    i=i+1;
end
h(2)=plot(i,FITWT(i),'k+');
for i=1:199
    plot(i,FITCT(i),'k-O'); hold on
    i=i+1;
end
h(3)=plot(i,FITCT(i),'k-O');
for i=1:199
    plot(i,FITMD(i),'k-x'); hold on
    i=i+1;
end
h(4)=plot(i,FITMD(i),'k-x');
for i=1:199
    plot(i,FITRS(i),'kd'); hold on
    i=i+1;
end
h(5)=plot(i,FITRS(i),'kd');  

title('Iteration vs Fitness','fontweight','bold','fontsize',18);
xlabel('Iteration','fontweight','bold','fontsize',16);
ylabel('Fitness Value','fontweight','bold','fontsize',16);

xlim([0 200]);
legend(h,'Food','Water','Clothes','Medical Equipments','Rescue Members');
%legend('food','Water','Clothes','Medical Equipments','Rescue Members');

for i=1:s
    disp(['Convergence point for area ' num2str(i)]);
    disp([fj(i) wj(i) cj(i) mej(i) rmj(i)]);
end
                                 
      
      
      
 disp(FITFD)
 disp(FITWT)
 disp(FITCT)
 disp(FITMD)
 disp(FITRS)
 
          
      
      
          
          
          
          
          
         
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
      
      
      
      