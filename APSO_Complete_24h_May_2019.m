 clc
 clear all
 close all


while 1
    
%% Input
nmb=1;


FitnessFunction=@(x,totr,totar) Fitness_Function(x,totr,totar);    % Fitness Function



%Take input of all Resources in RP...
foodr = 250;%r   input('Enter available food(Ton): \r\n');
waterr = 120;%r   input('Enter available water(Gallon): \r\n');
clothr = 200;%r   input('Enter available cloth(Dozen): \r\n');
mer = 150;%r   input('Enter available medical equipments(Packet): \r\n');
rmr = 76;%r   input('Enter available rescue member(Number): \r\n');

%number of area
s=4;%r   input('How many sites? ');

%population density
c=26180;%r   input('Enter number of population density: ');


%number of casualty
cs=200;%r   input('Enter number of casualty: ');


%time
t=1;

%number of organization
org=2;

%All demands are set to 0.
totfoodd=0;
totwaterd=0;
totclothd=0;
totmed=0;
totrmd=0;




%{
for n = 1:s
    %Take input of Initial demand for each resource in each area or gbest.
    ifdmnd(n) = input(['Enter food Demand of site ' num2str(n) '(Ton):\r\n']);
    iwdmnd(n) = input(['Enter water Demand of site ' num2str(n) '(Gallon):\r\n']);
    icdmnd(n) = input(['Enter cloths Demand of site ' num2str(n) '(Dozn):\r\n']);
    imedmnd(n) = input(['Enter medical equipments Demand of site ' num2str(n) '(Packet):\r\n']);
    irmdmnd(n) = input(['Enter rescue member Demand of site ' num2str(n) '(Number):\r\n']);
    
    %Calculate Total Demand.
    totfoodd=totfoodd+ifdmnd(n);
    totwaterd=totwaterd+iwdmnd(n);
    totclothd=totclothd+icdmnd(n);
    totmed=totmed+imedmnd(n);
    totrmd=totrmd+irmdmnd(n);
end
%}



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


    %Area:5
    ifdmnd(5) = 56;
    iwdmnd(5) = 25;
    icdmnd(5) = 46;
    imedmnd(5)= 50;
    irmdmnd(5)= 12;

    %Area:6
    ifdmnd(6) =65 ;
    iwdmnd(6) =20 ;
    icdmnd(6) =57 ;
    imedmnd(6)=54 ;
    irmdmnd(6)=10 ;

    
    %Area:7
    ifdmnd(7) =70 ;
    iwdmnd(7) =25 ;
    icdmnd(7) =50 ;
    imedmnd(7)=67 ;
    irmdmnd(7)=5 ;
 
    %Area:8
    ifdmnd(8) =75 ;
    iwdmnd(8) =30 ;
    icdmnd(8) =16 ;
    imedmnd(8)=90 ;
    irmdmnd(8)=50 ;
    
    %Area:9
    ifdmnd(9) =90 ;
    iwdmnd(9) =25 ;
    icdmnd(9) =5 ;
    imedmnd(9)=69 ;
    irmdmnd(9)=11 ;
    
    %Area:10
    ifdmnd(10) =29 ;
    iwdmnd(10) =25 ;
    icdmnd(10) =34 ;
    imedmnd(10)=10 ;
    irmdmnd(10)=2 ;
%{    
%}




    %calculating total..................
    totfoodd=sum(ifdmnd);
    totwaterd=sum(iwdmnd);
    totclothd=sum(icdmnd);
    totmed=sum(imedmnd);
    totrmd=sum(irmdmnd);
    
    

%% PSO Parameters

MaxIt=200;       % Maximum Number of Iterations

nPop=4;         % Population Size


f=fopen('APSO Output','w');     %Opening File to save output
    
    
    
    
% check if total demand exceeds availability or not. if total demand
% setting Maximum limit of allocation

%FOOD...................................
if totfoodd <= foodr
    maxAlloc_food = ifdmnd;
    pcost_food=totfoodd;   %............................parameter to fitness function
else
    pcost_food=0;
    for i=1:s
        maxAlloc_food(i)=(ifdmnd(i)/totfoodd)*foodr;
        pcost_food=pcost_food+maxAlloc_food(i);   %............................parameter to fitness function
    end
end

minAlloc_food=0;          % Lower Bound of Decision Variables
fprintf(f,'\r\n\r\n\r\nUpper Limit for Food:');
fprintf(f,'\t%0.2f',maxAlloc_food);
pdmd_food=maxAlloc_food;  %plotted demand



%WATER...................
if totwaterd <= waterr
    maxAlloc_water = iwdmnd;
    pcost_water=totwaterd;   %............................parameter to fitness function
else
    pcost_water=0;
    for i=1:s
        maxAlloc_water(i)=(iwdmnd(i)/totwaterd)*waterr;
        pcost_water=pcost_water+maxAlloc_water(i);   %............................parameter to fitness function
    end
end

minAlloc_water=0;          % Lower Bound of Decision Variables
fprintf(f,'\r\nUpper Limit for Water:');
fprintf(f,'\t%0.2f',maxAlloc_water);
pdmd_water=maxAlloc_water;  %plotted demand



%CLOTH...................
if totclothd <= clothr
    maxAlloc_cloth = icdmnd;
    pcost_cloth=totclothd;   %............................parameter to fitness function
else
    pcost_cloth=0;
    for i=1:s
        maxAlloc_cloth(i)=(icdmnd(i)/totclothd)*clothr;
        pcost_cloth=pcost_cloth+maxAlloc_cloth(i);   %............................parameter to fitness function
    end
end

minAlloc_cloth=0;          % Lower Bound of Decision Variables
fprintf(f,'\r\nUpper Limit for cloth:');
fprintf(f,'\t%0.2f',maxAlloc_cloth);
pdmd_cloth=maxAlloc_cloth;  %plotted demand



%ME...................
if totmed <= mer
    maxAlloc_me = imedmnd;
    pcost_me=totmed;   %............................parameter to fitness function
else
    pcost_me=0;
    for i=1:s
        maxAlloc_me(i)=(imedmnd(i)/totmed)*mer;
        pcost_me=pcost_me+maxAlloc_me(i);   %............................parameter to fitness function
    end
end

minAlloc_me=0;          % Lower Bound of Decision Variables
fprintf(f,'\r\nUpper Limit for Medical Equipments:');
fprintf(f,'\t%0.2f',maxAlloc_me);
pdmd_me=maxAlloc_me;  %plotted demand



%RM...................
if totrmd <= rmr
    maxAlloc_rm = irmdmnd;
    pcost_rm=totrmd;   %............................parameter to fitness function
else
    pcost_rm=0;
    for i=1:s
        maxAlloc_rm(i)=(irmdmnd(i)/totrmd)*rmr;
        pcost_rm=pcost_rm+maxAlloc_rm(i);   %............................parameter to fitness function
    end
end

minAlloc_rm=0;          % Lower Bound of Decision Variables
 fprintf(f,'\r\nUpper Limit for Rescue Members:');
 fprintf(f,'\t%0.2f',maxAlloc_rm);
pdmd_rm=maxAlloc_rm;  %plotted demand












%Allocation percentage
fprintf(f,'\r\n\r\n\r\nCALCULATING ALLOCATABLE RESOURCES:\r\n'); 
%FOOD...................
apfood=((c*100)/(foodr*totfoodd*t*s*org));
if apfood>100      %if allocation percentage is -ve or grater than 100 then it is divided by casualty 
    apfood=apfood/cs;
%     fprintf('\nafter considering casualty allocation percentage is : %0.2f',apfood);
    if apfood>100   %if allocation percentage is -ve or grater than 100 then it is set to 100 
        apfood=100;
%         fprintf('\ndue to sortage of resources all resouce material have to be allocated');
    end
end 
fprintf(f,'\r\nReserved food percentage for food = %0.2f',apfood);
totafood=(foodr*(100-apfood))/100;
fprintf(f,'\r\nallocatable food in reserve = %0.2f\r\n',totafood);

%WATER...................
apwater=((c*100)/(waterr*totwaterd*t*s*org));
if apwater>100     %if allocation percentage is -ve or grater than 100 then it is divided by casualty 
    apwater=apwater/cs;
%     fprintf('\nafter considering casualty allocation percentage is : %0.2f',apwater);
    if apwater>100      %if allocation percentage is -ve or grater than 100 then it is set to 100 
      apwater=100;
%       fprintf('\ndue to sortage of resources all resouce material have to be allocated');
    end
end 
fprintf(f,'\r\nReserved water percentage for water = %0.2f',apwater);
totawater=(waterr*(100-apwater))/100;
fprintf(f,'\r\nallocatable water in reserve = %0.2f\r\n',totawater);


%CLOTH...................
apcloth=((c*100)/(clothr*totclothd*t*s*org));
if apcloth > 100     %if allocation percentage is -ve or grater than 100 then it is divided by casualty 
    apcloth=apcloth/cs;
%     fprintf('\nafter considering casualty allocation percentage is : %0.2f',apcloth);
    if apcloth > 100       %if allocation percentage is -ve or grater than 100 then it is set to 100 
      apcloth=100;
%      fprintf('\ndue to sortage of resources all resouce material have to be allocated');
    end
end 
fprintf(f,'\r\nReserved cloth percentage for cloth = %0.2f',apcloth);
totacloth=(clothr*(100-apcloth))/100;
fprintf(f,'\r\nallocatable cloth in reserve = %0.2f\r\n',totacloth);

%ME...................
apme=((c*100)/(mer*totmed*t*s*org));
if apme>100     %if allocation percentage is -ve or grater than 100 then it is divided by casualty 
    apme=apme/cs;
%     fprintf('\nafter considering casualty allocation percentage is : %0.2f',apme);
    if apme>100      %if allocation percentage is -ve or grater than 100 then it is set to 100 
       apme=100;
%       fprintf('\ndue to sortage of resources all resouce material have to be allocated');
    end
end 
fprintf(f,'\r\nReserved medical equipment percentage for medical equipments = %0.2f',apme);
totame=(mer*(100-apme))/100;
fprintf(f,'\r\nallocatable medical equipments in reserve = %0.2f\r\n',totame);

%RM...................
aprm=((c*100)/(rmr*totrmd*t*s*org));
if aprm>100      %if allocation percentage is -ve or grater than 100 then it is divided by casualty 
    aprm=aprm/cs;
%     fprintf('\nafter considering casualty allocation percentage is : %0.2f',aprm);
    if aprm>100     %if allocation percentage is -ve or grater than 100 then it is set to 100
     aprm=100;
%      fprintf('\ndue to sortage of resources all resouce material have to be allocated');
    end
end 
fprintf(f,'\r\nReserved rescue member percentage for rescue member = %0.2f',aprm);
totarm=(rmr*(100-aprm))/100;
fprintf(f,'\r\nallocatable rescue member in reserve = %0.2f\r\n',totarm);


VarSize=[1 s];                                     % Decision Variables Matrix Size










%% Initialization
part.sol=[];
part.fitness=[];
part.pbest=[];
part.pbest_fitness=[];
part.dist=[];                                                               % APSO
part.avgdist=[];                                                            % APSO
fprintf(f,'\r\n\r\n\r\n\r\nINITIALIZING PARTICLES:');


%FOOD...................................
fprintf(f,'\r\n\r\nInitializing particles forFOOD:');
pop_food=repmat(part,nPop,1);
food_gbest=repmat(part,1,1);

a=inf;

%generating population
for i=1:(nPop-1)
    pop_food(i).sol=maxAlloc_food/i;
end
 %pop_food(1).sol=maxAlloc_food;
 %pop_food(2).sol=maxAlloc_food/2;
 %pop_food(3).sol=maxAlloc_food/3;
 %pop_food(4).sol=[min(maxAlloc_food),min(maxAlloc_food),min(maxAlloc_food),min(maxAlloc_food),min(maxAlloc_food)];
 pop_food(nPop).sol(1:s)=min(maxAlloc_food);

for i=1:nPop
    
%     pop_food(i).sol=unifrnd(minAlloc_food,maxAlloc_food,VarSize);
pop_food(i).dist(1:s)=0;                                                % APSO
    
    fprintf(f,'\r\nparticle-%d  (food): ',i);
    fprintf(f,'%0.0f   ',pop_food(i).sol);
        
    pop_food(i).tot=sum(pop_food(i).sol);
    
    
    pop_food(i).fitness=FitnessFunction(pop_food(i).sol,pcost_food,totafood);
    %plot_food(0,i)=pop_food(i).fitness;    %for plot
    fprintf(f,'\t\tFitness %d : %0.2f',i,pop_food(i).fitness);
    fprintf(f,'\t\tTotal Allocation: %0.2f',pop_food(i).tot);
    %initially pbest=initial allocation
    pop_food(i).pbest=pop_food(i).sol;
    pop_food(i).pbest_fitness=pop_food(i).fitness;
        
    fprintf(f,'\t\tInitial pbest for particle-%d : ',i);
    fprintf(f,'%0.0f   ',pop_food(i).pbest);
    
    
    if pop_food(i).fitness<a
        a=pop_food(i).fitness;
        b=i;
    end
    
    for j=1:nPop
        pop_food(i).dist=pop_food(i).dist + (sqrt((pop_food(i).sol-pop_food(j).sol).^2));          % APSO
    end
    pop_food(i).dist=pop_food(i).dist/(nPop-1);
    pop_food(i).avgdist=sum(pop_food(i).dist)/s;                           % APSO
    fprintf(f,'\r\nparticle-%d Distance (food): ',i);                      % APSO
    fprintf(f,'%0.0f   ', pop_food(i).dist);                               % APSO
    
end


fprintf(f,'\r\nInitial best fitness: %0.2f   of particle : %d',a,b);
food_gbest.sol=pop_food(b).sol;
food_gbest.fitness=a;
food_gbest.dist=pop_food(b).dist;                                          % APSO
food_gbest.avgdist=pop_food(b).avgdist;                                     % APSO
fprintf(f,'\t\tgbest: ');
fprintf(f,'%0.0f   ',food_gbest.sol);
fprintf(f,'\t\tgbest Dist (food): ');
fprintf(f,'%0.0f   ',food_gbest.dist);
fprintf(f,'\t\tgbest Avg Dist (food): %0.0f',food_gbest.avgdist);

    
%WATER...................

fprintf(f,'\r\n\r\n\r\nInitializing particles for WATER:');
pop_water=repmat(part,nPop,1);
water_gbest=repmat(part,1,1);

a=inf;

%generating population
for i=1:(nPop-1)
    pop_water(i).sol=maxAlloc_water/i;
end
 %pop_water(1).sol=maxAlloc_water;
 %pop_water(2).sol=maxAlloc_water/2;
 %pop_water(3).sol=maxAlloc_water/3;
 %pop_water(4).sol=[min(maxAlloc_water),min(maxAlloc_water),min(maxAlloc_water),min(maxAlloc_water),min(maxAlloc_water)];
 pop_water(nPop).sol(1:s)=min(maxAlloc_water);


for i=1:nPop
    
%     pop_water(i).sol=unifrnd(minAlloc_water,maxAlloc_water,VarSize);
pop_water(i).dist(1:s)=0;                                                % APSO
    
    fprintf(f,'\r\nparticle-%d  (water): ',i);
    fprintf(f,'%0.0f   ',pop_water(i).sol);
        
    pop_water(i).tot=sum(pop_water(i).sol);
    
    
    pop_water(i).fitness=FitnessFunction(pop_water(i).sol,pcost_water,totawater);
    %plot_water(0,i)=pop_water(i).fitness;    %for plot
    fprintf(f,'\t\tFitness %d : %0.2f',i,pop_water(i).fitness);
    fprintf(f,'\t\tTotal Allocation: %0.2f',pop_water(i).tot);
    %initially pbest=initial allocation
    pop_water(i).pbest=pop_water(i).sol;
    pop_water(i).pbest_fitness=pop_water(i).fitness;
        

    fprintf(f,'\t\tInitial pbest for particle-%d : ',i);
    fprintf(f,'%0.0f   ',pop_water(i).pbest);
    
    
    
    if pop_water(i).fitness<a
        a=pop_water(i).fitness;
        b=i;
    end
    
    for j=1:nPop
        pop_water(i).dist=pop_water(i).dist + (sqrt((pop_water(i).sol-pop_water(j).sol).^2));          % APSO
    end
    pop_water(i).dist=pop_water(i).dist/(nPop-1);
    pop_water(i).avgdist=sum(pop_water(i).dist)/s;                           % APSO
    fprintf(f,'\r\nparticle-%d Distance (water): ',i);                      % APSO
    fprintf(f,'%0.0f   ', pop_water(i).dist);                               % APSO
    
end


fprintf(f,'\r\nInitial best fitness: %0.2f   of particle : %d',a,b);
water_gbest.sol=pop_water(b).sol;
water_gbest.fitness=a;
water_gbest.dist=pop_water(b).dist;                                          % APSO
water_gbest.avgdist=pop_water(b).avgdist;                                     % APSO
fprintf(f,'\t\tgbest: ');
fprintf(f,'%0.0f   ',water_gbest.sol);
fprintf(f,'\t\tgbest Dist (water): ');
fprintf(f,'%0.0f   ',water_gbest.dist);
fprintf(f,'\t\tgbest Avg Dist (water): %0.0f',water_gbest.avgdist);


%CLOTH...................

fprintf(f,'\r\n\r\n\r\nInitializing particles for CLOTH:');
pop_cloth=repmat(part,nPop,1);
cloth_gbest=repmat(part,1,1);

a=inf;

%generating population
for i=1:(nPop-1)
    pop_cloth(i).sol=maxAlloc_cloth/i;
end
 %pop_cloth(1).sol=maxAlloc_cloth;
 %pop_cloth(2).sol=maxAlloc_cloth/2;
 %pop_cloth(3).sol=maxAlloc_cloth/3;
 %pop_cloth(4).sol=[min(maxAlloc_cloth),min(maxAlloc_cloth),min(maxAlloc_cloth),min(maxAlloc_cloth),min(maxAlloc_cloth)];
 pop_cloth(nPop).sol(1:s)=min(maxAlloc_cloth);

for i=1:nPop
    
%     pop_cloth(i).sol=unifrnd(minAlloc_cloth,maxAlloc_cloth,VarSize);
pop_cloth(i).dist(1:s)=0;                                                % APSO

    fprintf(f,'\r\nparticle-%d  (cloth): ',i);
    fprintf(f,'%0.0f   ',pop_cloth(i).sol);
        
    pop_cloth(i).tot=sum(pop_cloth(i).sol);
    
    
    pop_cloth(i).fitness=FitnessFunction(pop_cloth(i).sol,pcost_cloth,totacloth);
    %plot_cloth(0,i)=pop_cloth(i).fitness;    %for plot
    fprintf(f,'\t\tFitness %d : %0.2f',i,pop_cloth(i).fitness);
    fprintf(f,'\t\tTotal Allocation: %0.2f',pop_cloth(i).tot);
    %initially pbest=initial allocation
    pop_cloth(i).pbest=pop_cloth(i).sol;
    pop_cloth(i).pbest_fitness=pop_cloth(i).fitness;
        
    fprintf(f,'\t\tInitial pbest for particle-%d : ',i);
    fprintf(f,'%0.0f   ',pop_cloth(i).pbest);
    
   
    
    if pop_cloth(i).fitness<a
        a=pop_cloth(i).fitness;
        b=i;
    end
    
    for j=1:nPop
        pop_cloth(i).dist=pop_cloth(i).dist + (sqrt((pop_cloth(i).sol-pop_cloth(j).sol).^2));          % APSO
    end
    pop_cloth(i).dist=pop_cloth(i).dist/(nPop-1);
    pop_cloth(i).avgdist=sum(pop_cloth(i).dist)/s;                           % APSO
    fprintf(f,'\r\nparticle-%d Distance (cloth): ',i);                      % APSO
    fprintf(f,'%0.0f   ', pop_cloth(i).dist);                               % APSO
    
end


fprintf(f,'\r\nInitial best fitness: %0.2f   of particle : %d',a,b);
cloth_gbest.sol=pop_cloth(b).sol;
cloth_gbest.fitness=a;
cloth_gbest.dist=pop_cloth(b).dist;                                          % APSO
cloth_gbest.avgdist=pop_cloth(b).avgdist;                                     % APSO
fprintf(f,'\t\tgbest: ');
fprintf(f,'%0.0f   ',cloth_gbest.sol);
fprintf(f,'\t\tgbest Dist (cloth): ');
fprintf(f,'%0.0f   ',cloth_gbest.dist);
fprintf(f,'\t\tgbest Avg Dist (cloth): %0.0f',cloth_gbest.avgdist);


%ME...................

fprintf(f,'\r\n\r\n\r\nInitializing particles for MEDICAL EQUIPMENTS:');
pop_me=repmat(part,nPop,1);
me_gbest=repmat(part,1,1);

a=inf;

%generating population
for i=1:(nPop-1)
    pop_me(i).sol=maxAlloc_me/i;
end
 %pop_me(1).sol=maxAlloc_me;
 %pop_me(2).sol=maxAlloc_me/2;
 %pop_me(3).sol=maxAlloc_me/3;
 %pop_me(4).sol=[min(maxAlloc_me),min(maxAlloc_me),min(maxAlloc_me),min(maxAlloc_me),min(maxAlloc_me)];
 pop_me(nPop).sol(1:s)=min(maxAlloc_me);

for i=1:nPop
    
%     pop_me(i).sol=unifrnd(minAlloc_me,maxAlloc_me,VarSize);
pop_me(i).dist(1:s)=0;                                                % APSO

    fprintf(f,'\r\nparticle-%d  (medical equipment): ',i);
    fprintf(f,'%0.0f   ',pop_me(i).sol);
        
    pop_me(i).tot=sum(pop_me(i).sol);
    
    
    pop_me(i).fitness=FitnessFunction(pop_me(i).sol,pcost_me,totame);
    %plot_me(0,i)=pop_me(i).fitness;    %for plot
    fprintf(f,'\t\tFitness %d : %0.2f',i,pop_me(i).fitness);
    fprintf(f,'\t\tTotal Allocation: %0.2f',pop_me(i).tot);
    %initially pbest=initial allocation
    pop_me(i).pbest=pop_me(i).sol;
    pop_me(i).pbest_fitness=pop_me(i).fitness;
        
    fprintf(f,'\t\tInitial pbest for particle-%d : ',i);
    fprintf(f,'%0.0f   ',pop_me(i).pbest);
    
    
    
    if pop_me(i).fitness<a
        a=pop_me(i).fitness;
        b=i;
    end
    
    for j=1:nPop
        pop_me(i).dist=pop_me(i).dist + (sqrt((pop_me(i).sol-pop_me(j).sol).^2));          % APSO
    end
    pop_me(i).dist=pop_me(i).dist/(nPop-1);
    pop_me(i).avgdist=sum(pop_me(i).dist)/s;                           % APSO
    fprintf(f,'\r\nparticle-%d Distance (Medical Equipment): ',i);                      % APSO
    fprintf(f,'%0.0f   ', pop_me(i).dist);                               % APSO
    
end


fprintf(f,'\r\nInitial best fitness: %0.2f   of particle : %d',a,b);
me_gbest.sol=pop_me(b).sol;
me_gbest.fitness=a;
me_gbest.dist=pop_me(b).dist;                                          % APSO
me_gbest.avgdist=pop_me(b).avgdist;                                     % APSO
fprintf(f,'\t\tgbest: ');
fprintf(f,'%0.0f   ',me_gbest.sol);
fprintf(f,'\t\tgbest Dist (Medical Equiopment): ');
fprintf(f,'%0.0f   ',me_gbest.dist);
fprintf(f,'\t\tgbest Avg Dist (Medical Equipment): %0.0f',me_gbest.avgdist);


%RM...................

fprintf(f,'\r\n\r\n\r\nInitializing particles for RESCUE MEMBERS:');
pop_rm=repmat(part,nPop,1);
rm_gbest=repmat(part,1,1);

a=inf;

%generating population
for i=1:(nPop-1)
    pop_rm(i).sol=maxAlloc_rm/i;
end
 %pop_rm(1).sol=maxAlloc_rm;
 %pop_rm(2).sol=maxAlloc_rm/2;
 %pop_rm(3).sol=maxAlloc_rm/3;
 %pop_rm(4).sol=[min(maxAlloc_rm),min(maxAlloc_rm),min(maxAlloc_rm),min(maxAlloc_rm),min(maxAlloc_rm)];
 pop_rm(nPop).sol(1:s)=min(maxAlloc_rm);

for i=1:nPop

%     pop_rm(i).sol=unifrnd(minAlloc_rm,maxAlloc_rm,VarSize);
pop_rm(i).dist(1:s)=0;                                                % APSO

    fprintf(f,'\r\nparticle-%d  (rescue member): ',i);
    fprintf(f,'%0.0f   ',pop_rm(i).sol);
        
    pop_rm(i).tot=sum(pop_rm(i).sol);
    
    
    pop_rm(i).fitness=FitnessFunction(pop_rm(i).sol,pcost_rm,totarm);
    %plot_rm(0,i)=pop_rm(i).fitness;    %for plot
    fprintf(f,'\t\tFitness %d : %0.2f',i,pop_rm(i).fitness);
    fprintf(f,'\t\tTotal Allocation: %0.2f',pop_rm(i).tot);
    %initially pbest=initial allocation
    pop_rm(i).pbest=pop_rm(i).sol;
    pop_rm(i).pbest_fitness=pop_rm(i).fitness;
        
    fprintf(f,'\t\tInitial pbest for particle-%d : ',i);
    fprintf(f,'%0.0f   ',pop_rm(i).pbest);
    
    
    
    if pop_rm(i).fitness<a
        a=pop_rm(i).fitness;
        b=i;
    end
    
    for j=1:nPop
        pop_rm(i).dist=pop_rm(i).dist + (sqrt((pop_rm(i).sol-pop_rm(j).sol).^2));          % APSO
    end
    pop_rm(i).dist=pop_rm(i).dist/(nPop-1);
    pop_rm(i).avgdist=sum(pop_rm(i).dist)/s;                           % APSO
    fprintf(f,'\r\nparticle-%d Distance (Rescue Member): ',i);                      % APSO
    fprintf(f,'%0.0f   ', pop_rm(i).dist);                               % APSO
    
end


fprintf(f,'\r\nInitial best fitness: %0.2f   of particle : %d',a,b);
rm_gbest.sol=pop_rm(b).sol;
rm_gbest.fitness=a;
rm_gbest.dist=pop_rm(b).dist;                                          % APSO
rm_gbest.avgdist=pop_rm(b).avgdist;                                     % APSO
fprintf(f,'\t\tgbest: ');
fprintf(f,'%0.0f   ',rm_gbest.sol);
fprintf(f,'\t\tgbest Dist (Rescue Member): ');
fprintf(f,'%0.0f   ',rm_gbest.dist);
fprintf(f,'\t\tgbest Avg Dist (rescue Member): %0.0f',rm_gbest.avgdist);
























%% PSO Main Loop
    set_food=0;
    cp_food=inf;
    set_water=0;
    cp_water=inf;
    set_cloth=0;
    cp_cloth=inf;
    set_me=0;
    cp_me=inf;
    set_rm=0;
    cp_rm=inf;
    fprintf(f,'\r\n\r\n\r\n\r\n\r\n\r\n\r\nSTARTING ITIRATION:\r\n');
 

    %APSO w,c1,c2 initialization.................
    w_food=0.4;
    c1_food=0.0;
    c2_food=2.0;
    
    w_water=0.4;
    c1_water=0.0;
    c2_water=2.0;
    
    w_cloth=0.4;
    c1_cloth=0.0;
    c2_cloth=2.0;
    
    w_me=0.4;
    c1_me=0.0;
    c2_me=2.0;
    
    w_rm=0.4;
    c1_rm=0.0;
    c2_rm=2.0;
    
for it=1:MaxIt
    
    
    %FOOD...................................
    
    
    %avg_food_dist=[0,0,0,0];
    max_food_dist=0;                                                       %APSO
    min_food_dist=inf;                                                     %APSO
    for i=1:nPop
        pop_food(i).dis(1:s)=0;                                                % APSO
        for j=1:nPop    
            pop_food(i).dist=pop_food(i).dist + abs(((pop_food(i).sol-pop_food(j).sol)));          % APSO                                            % APSO
            %fprintf("\navg distance of fd(%d) from all other particles is = %.3f",i,fd(i));% APSO
        end                                                                                   % APSO
        pop_food(i).dist=pop_food(i).dist/(nPop-1);
        fprintf(f,'\r\nparticle-%d Distance (food): ',i);                         % APSO
        fprintf(f,'%0.0f   ', pop_food(i).dist);
        pop_food(i).avgdist=sum(pop_food(i).dist)/s;
        fprintf(f,'\r\nparticle-%d Avg Distance (food): ',i);                         % APSO
        fprintf(f,'%0.0f   ', pop_food(i).avgdist);
        
        % Calculating dmax dmin.....................
        
        if max_food_dist<pop_food(i).avgdist
            max_food_dist=pop_food(i).avgdist;
        end
        if min_food_dist>pop_food(i).avgdist
            min_food_dist=pop_food(i).avgdist;
        end
        
        
    end
   

    
    % Calculating dg................................                       % APSO
    food_gbest.dist(1:s)=0;                                                % APSO
    for j=1:nPop    
           food_gbest.dist=food_gbest.dist + abs(((food_gbest.sol-pop_food(j).sol)));          % APSO                                            % APSO
    end                                                                                   % APSO
    food_gbest.dist=food_gbest.dist/nPop;
    fprintf(f,'\r\n GBest Sol (food): ');                             % APSO
    fprintf(f,'%0.0f   ', food_gbest.sol);
    fprintf(f,'\r\n GBest Distance (food): ');                             % APSO
    fprintf(f,'%0.0f   ', food_gbest.dist);
    food_gbest.avgdist=sum(food_gbest.dist)/s;
    
    %checking id dg>d_max or dg,d_min................                      % APSO
    if food_gbest.avgdist>max_food_dist
        max_food_dist=food_gbest.avgdist;
    end
    
    %Roundinf off max_dist,min_dist,avgdist........................... 
    food_gbest.avgdist=round(food_gbest.avgdist,0);                        %APSO
    max_food_dist=round(max_food_dist,0);                                  %APSO
    min_food_dist=round(min_food_dist,0);                                  %APSO

    fprintf(f,'\r\n d_gbrst(food): %0.5f   ', food_gbest.avgdist);
    fprintf(f,'\r\n d_max(food): %0.5f',max_food_dist);                    % APSO
    fprintf(f,'\r\n d_min(food): %0.5f',min_food_dist);                    % APSO
    if isequal(round(max_food_dist,10),round(min_food_dist,10))
        f_food=0;
    else
        f_food=abs((food_gbest.avgdist-min_food_dist)/(max_food_dist-min_food_dist));
        if f_food>1
            f_food=1;
        end
        fprintf(f,'\r\n f_food: %0.5f',f_food); 
    end
    plot_food_dist(it)= f_food;
    
    st_food=[0,0,0,0];
    
    %Calculating s1.................................
    if ((f_food<=0.4 && f_food>0.0)||(f_food==0.0))
        st_food(1)=0;
    elseif all(f_food>0.4 & f_food<=0.6)
        st_food(1)=(5*f_food)-2;
    elseif all(f_food>0.6 & f_food<=0.7)
        st_food(1)=1;
    elseif all(f_food>0.7 & f_food<=0.8)
        st_food(1)=(-10*f_food)+8;
    elseif all(f_food>0.8 & f_food<=1.0)
        st_food(1)=0;
    end
        
    %Calculating s2.................................
    if ((f_food<=0.2 && f_food>0.0)||(f_food==0.0))
        st_food(2)=0;
    elseif all(f_food>0.2 & f_food<=0.3)
        st_food(2)=(10*f_food)-2;
    elseif all(f_food>0.3 & f_food<=0.4)
        st_food(2)=1;
    elseif all(f_food>0.4 & f_food<=0.6)
        st_food(2)=(-5*f_food)+3;
    elseif all(f_food>0.6 & f_food<=1.0)
        st_food(2)=0;
    end
        
    %Calculating s3.................................
    if ((f_food<=0.1 && f_food>0.0)||(f_food==0.0))
        st_food(3)=1;
    elseif all(f_food>0.1 & f_food<=0.3)
        st_food(3)=(-5*f_food)+1.5;
    elseif all(f_food>0.3 & f_food<=1.0)
        st_food(3)=0;
    end
        
    %Calculating s4.................................
    if ((f_food<=0.7 && f_food>0.0)||(f_food==0.0))
        st_food(4)=0;
    elseif all(f_food>0.7 & f_food<=0.9)
        st_food(4)=(5*f_food)-3.5;
    elseif all(f_food>0.9 & f_food<=1.0)
        st_food(4)=1;
    end    
    
    [temp,state_food(it)]=max(st_food);
    if it~=1
        if all(f_food>0.2 & f_food<0.3)
            if all((state_food(it-1)==3)||(state_food(it-1)==4))
                state_food(it)=3;
            else
                state_food(it)=2;
            end
      elseif all(f_food>0.4 & f_food<0.6)
            if all((state_food(it-1)==3)||(state_food(it-1)==2))
                state_food(it)=2;
            else
                state_food(it)=1;
            end
        elseif all(f_food>0.7 & f_food<0.8)
            if all((state_food(it-1)==1)||(state_food(it-1)==2))
                state_food(it)=1;
            else
                state_food(it)=4;
            end
        end
    
    end
    
    %APSO Updation w,c1,c2......................
    
    %{%}
    w_food=1/(1+(1.5*exp(-2.6*f_food)));
    w_food=(w_food*4)/9;
    
    
    
    
    if state_food(it)==1
        c1_food=c1_food+0.1;
        c2_food=c2_food-0.1;
    elseif state_food(it)==2
        c1_food=c1_food+0.05;
        c2_food=c2_food-0.05;
    elseif state_food(it)==3
        c1_food=c1_food+0.05;
        c2_food=c2_food+0.05;
    elseif state_food(it)==4
        c1_food=c1_food-0.1;
        c2_food=c2_food+0.1;
    end
    
    if (c1_food+c2_food)>3
        c1_food=(c1_food/(c1_food+c2_food))*3;
        c2_food=(c2_food/(c1_food+c2_food))*3;
    end
     
   
    
    fprintf('\r\nIt %d : F=%0.3f   s1=%0.3f   s2=%0.3f   s3=%0.3f   s4=%0.3f           state=%d         w=%0.3f         c1=%0.3f         c2=%0.3f',it,f_food,st_food(1),st_food(2),st_food(3),st_food(4),state_food(it),w_food,c1_food,c2_food);
 
    
        
    
    
    
    for i=1:nPop
        
        maxAlloc_food = w_food*maxAlloc_food+c1_food*rand(1,1)*(pop_food(i).pbest-pop_food(i).sol)+c2_food*rand(1,1)*(food_gbest.sol-pop_food(i).sol);
        %fprintf('\nMAX= ');
        %disp(maxAlloc_food);
        pop_food(i).fitness=FitnessFunction(pop_food(i).sol,pcost_food,totafood);
        %{
        if pop_food(i).fitness==temp && set==0
            cp_food=it;
            fprintf('\nCONVERGED********************************************');
            set=1;
        else
            temp=pop_food(i).fitness;
            fprintf('\r\n++++++++++++++++++++++++++++++++++++++++++++++++++temp=%d',temp);
        end
        %}
        plot_food(it,i)=pop_food(i).fitness;    %for plot
        fprintf(f,'\r\nIt %d particle-%d (Food): ',it,i);
        fprintf(f,'%0.0f  ',pop_food(i).sol);
        fprintf(f,'          Fitness : %0.12f',pop_food(i).fitness);
        if pop_food(i).fitness<pop_food(i).pbest_fitness
            pop_food(i).pbest_fitness=pop_food(i).fitness;
            pop_food(i).pbest=pop_food(i).sol;
            fprintf(f,'.......NEW PBEST');
            if pop_food(i).fitness<food_gbest.fitness
                food_gbest.fitness=pop_food(i).fitness;
                food_gbest.sol=pop_food(i).sol;
                food_gbest.dist=pop_food(i).dist;                           %APSO
                food_gbest.avgdist=pop_food(i).avgdist;                     %APSO
                fprintf(f,'.......NEW GBEST');
            end
        end
        
         
        pop_food(i).sol=pop_food(i).sol+maxAlloc_food;                     %updating
%         pop_food(i).sol=max(pop_food(i).sol,minAlloc_food);
%         pop_food(i).sol=min(pop_food(i).sol,pdmd_food);
    end
    

        
    
    %check if particles have converged or not
    if isequal(round(pop_food(1).fitness,5),round(pop_food(2).fitness,5),round(pop_food(3).fitness,5),round(pop_food(4).fitness,5)) && set_food==0
        cp_food=it;
        fprintf(f,'\r\n****************************FOOD particles have converged********************************');
        %fprintf('\r\n\r\n\r\n');
        %xyz=input('');
        set_food=1;
    end
    fprintf(f,'\r\n\r\n');
    
    
    
    %WATER...................
    
    
     %avg_food_dist=[0,0,0,0];
    max_water_dist=0;                                                       %APSO
    min_water_dist=inf;                                                     %APSO
    for i=1:nPop
        pop_water(i).dist(1:s)=0;                                                % APSO
        for j=1:nPop    
            pop_water(i).dist=pop_water(i).dist + abs(((pop_water(i).sol-pop_water(j).sol)));          % APSO                                            % APSO
            %fprintf("\navg distance of fd(%d) from all other particles is = %.3f",i,fd(i));% APSO
        end                                                                                   % APSO
        pop_water(i).dist=pop_water(i).dist/(nPop-1);
        fprintf(f,'\r\nparticle-%d Distance (water): ',i);                         % APSO
        fprintf(f,'%0.0f   ', pop_water(i).dist);
        pop_water(i).avgdist=sum(pop_water(i).dist)/s;
        fprintf(f,'\r\nparticle-%d Avg Distance (water): ',i);                         % APSO
        fprintf(f,'%0.0f   ', pop_water(i).avgdist);
        
        % Calculating dmax dmin.....................
        
        if max_water_dist<pop_water(i).avgdist
            max_water_dist=pop_water(i).avgdist;
        end
        if min_water_dist>pop_water(i).avgdist
            min_water_dist=pop_water(i).avgdist;
        end
        
        
    end
   

    
    % Calculating dg................................                       % APSO
    water_gbest.dist(1:s)=0;                                                % APSO
    for j=1:nPop    
           water_gbest.dist=water_gbest.dist + abs(((water_gbest.sol-pop_water(j).sol)));          % APSO                                            % APSO
    end                                                                                   % APSO
    water_gbest.dist=water_gbest.dist/nPop;
    fprintf(f,'\r\n GBest Sol (water): ');                             % APSO
    fprintf(f,'%0.0f   ', water_gbest.sol);
    fprintf(f,'\r\n GBest Distance (water): ');                             % APSO
    fprintf(f,'%0.0f   ', water_gbest.dist);
    water_gbest.avgdist=sum(water_gbest.dist)/s;
    
    %checking id dg>d_max or dg,d_min................                      % APSO
    if water_gbest.avgdist>max_water_dist
        max_water_dist=water_gbest.avgdist;
    end
    
    %Roundinf off max_dist,min_dist,avgdist........................... 
    water_gbest.avgdist=round(water_gbest.avgdist,0);                        %APSO
    max_water_dist=round(max_water_dist,0);                                  %APSO
    min_water_dist=round(min_water_dist,0);                                  %APSO
    
    fprintf(f,'\r\n d_gbrst(water): %0.5f   ', water_gbest.avgdist);
    fprintf(f,'\r\n d_max(water): %0.5f',max_water_dist);                         % APSO
    fprintf(f,'\r\n d_min(water): %0.5f',min_water_dist);                         % APSO
    if isequal(round(max_water_dist,10),round(min_water_dist,10))
        f_water=0;
    else
        f_water=abs((water_gbest.avgdist-min_water_dist)/(max_water_dist-min_water_dist));
        if f_water>1
            f_water=1;
        end
        fprintf(f,'\r\n f_food: %0.5f',f_water); 
    end
    plot_water_dist(it)= f_water;
    
    st_water=[0,0,0,0];
    
    %Calculating s1.................................
    if ((f_water<=0.4 && f_water>0.0)||(f_water==0.0))
        st_water(1)=0;
    elseif all(f_water>0.4 & f_water<=0.6)
        st_water(1)=(5*f_water)-2;
    elseif all(f_water>0.6 & f_water<=0.7)
        st_water(1)=1;
    elseif all(f_water>0.7 & f_water<=0.8)
        st_water(1)=(-10*f_water)+8;
    elseif all(f_water>0.8 & f_water<=1.0)
        st_water(1)=0;
    end
        
    %Calculating s2.................................
    if ((f_water<=0.2 && f_water>0.0)||(f_water==0.0))
        st_water(2)=0;
    elseif all(f_water>0.2 & f_water<=0.3)
        st_water(2)=(10*f_water)-2;
    elseif all(f_water>0.3 & f_water<=0.4)
        st_water(2)=1;
    elseif all(f_water>0.4 & f_water<=0.6)
        st_water(2)=(-5*f_water)+3;
    elseif all(f_water>0.6 & f_water<=1.0)
        st_water(2)=0;
    end
        
    %Calculating s3.................................
    if ((f_water<=0.1 && f_water>0.0)||(f_water==0.0))
        st_water(3)=1;
    elseif all(f_water>0.1 & f_water<=0.3)
        st_water(3)=(-5*f_water)+1.5;
    elseif all(f_water>0.3 & f_water<=1.0)
        st_water(3)=0;
    end
        
    %Calculating s4.................................
    if ((f_water<=0.7 && f_water>0.0)||(f_water==0.0))
        st_water(4)=0;
    elseif all(f_water>0.7 & f_water<=0.9)
        st_water(4)=(5*f_water)-3.5;
    elseif all(f_water>0.9 & f_water<=1.0)
        st_water(4)=1;
    end    
    
    [temp,state_water(it)]=max(st_water);
    if it~=1
        if all(f_water>0.2 & f_water<0.3)
            if all((state_water(it-1)==3)||(state_water(it-1)==4))
                state_water(it)=3;
            else
                state_water(it)=2;
            end
      elseif all(f_water>0.4 & f_water<0.6)
            if all((state_water(it-1)==3)||(state_water(it-1)==2))
                state_water(it)=2;
            else
                state_water(it)=1;
            end
        elseif all(f_water>0.7 & f_water<0.8)
            if all((state_water(it-1)==1)||(state_water(it-1)==2))
                state_water(it)=1;
            else
                state_water(it)=4;
            end
        end
    
    end
    
    %APSO Updation w,c1,c2......................
    
    %{%}
    w_water=1/(1+(1.5*exp(-2.6*f_water)));
    w_water=(w_water*4)/9;
    
    
    
    
    if state_water(it)==1
        c1_water=c1_water+0.1;
        c2_water=c2_water-0.1;
    elseif state_water(it)==2
        c1_water=c1_water+0.05;
        c2_water=c2_water-0.05;
    elseif state_water(it)==3
        c1_water=c1_water+0.05;
        c2_water=c2_water+0.05;
    elseif state_water(it)==4
        c1_water=c1_water-0.1;
        c2_water=c2_water+0.1;
    end
    
    if (c1_water+c2_water)>3
        c1_water=(c1_water/(c1_water+c2_water))*3;
        c2_water=(c2_water/(c1_water+c2_water))*3;
    end
     
   
    
    fprintf('\r\nIt %d water : F=%0.3f   s1=%0.3f   s2=%0.3f   s3=%0.3f   s4=%0.3f           state=%d         w=%0.3f         c1=%0.3f         c2=%0.3f',it,f_water,st_water(1),st_water(2),st_water(3),st_water(4),state_water(it),w_water,c1_water,c2_water);

    
    
     for i=1:nPop
        maxAlloc_water= w_water*maxAlloc_water+c1_water*rand(1,1)*(pop_water(i).pbest-pop_water(i).sol)+c2_water*rand(1,1)*(water_gbest.sol-pop_water(i).sol);
        %fprintf('\nMAX= ');
        %disp(maxAlloc_water);
        
        pop_water(i).fitness=FitnessFunction(pop_water(i).sol,pcost_water,totawater);
        plot_water(it,i)=pop_water(i).fitness;    %for plot
        fprintf(f,'\r\nIt %d particle-%d (Water): ',it,i);
        fprintf(f,'%0.0f  ',pop_water(i).sol);
        fprintf(f,'          Fitness : %0.12f',pop_water(i).fitness);
        %disp([num2str(pop_water(i).sol),'          Fitness : ',num2str(pop_water(i).fitness)]);
        if pop_water(i).fitness<pop_water(i).pbest_fitness
            pop_water(i).pbest_fitness=pop_water(i).fitness;
            pop_water(i).pbest=pop_water(i).sol;
            fprintf(f,'.......NEW PBEST');
            if pop_water(i).fitness<water_gbest.fitness
                water_gbest.fitness=pop_water(i).fitness;
                water_gbest.sol=pop_water(i).sol;
                water_gbest.dist=pop_water(i).dist;                           %APSO
                water_gbest.avgdist=pop_water(i).avgdist;                     %APSO
                fprintf(f,'.......NEW GBEST');
            end
        end
        pop_water(i).sol=pop_water(i).sol+maxAlloc_water;
%         pop_water(i).sol=max(pop_water(i).sol,minAlloc_water);
%         pop_water(i).sol=min(pop_water(i).sol,pdmd_water);
     end
    
    %check if particles have converged or not
    %if isequal(pop_water(1).sol,pop_water(2).sol,pop_water(3).sol,pop_water(4).sol) && set_water==0
    if isequal(round(pop_water(1).fitness,5),round(pop_water(2).fitness,5),round(pop_water(3).fitness,5),round(pop_water(4).fitness,5)) && set_water==0
        cp_water=it;
        fprintf(f,'\r\n****************************WATER particles have converged********************************');
        %fprintf('\r\n\r\n\r\n');
        %xyz=input('');
        set_water=1;
    end
    fprintf(f,'\r\n\r\n');
    
    %CLOTH...................
    
    
     %avg_food_dist=[0,0,0,0];
    max_cloth_dist=0;                                                       %APSO
    min_cloth_dist=inf;                                                     %APSO
    for i=1:nPop
        pop_cloth(i).dist(1:s)=0;                                                % APSO 
        for j=1:nPop    
            pop_cloth(i).dist=pop_cloth(i).dist + abs(((pop_cloth(i).sol-pop_cloth(j).sol)));          % APSO                                            % APSO
            %fprintf("\navg distance of fd(%d) from all other particles is = %.3f",i,fd(i));% APSO
        end                                                                                   % APSO
        pop_cloth(i).dist=pop_cloth(i).dist/(nPop-1);
        fprintf(f,'\r\nparticle-%d Distance (cloth): ',i);                         % APSO
        fprintf(f,'%0.0f   ', pop_cloth(i).dist);
        pop_cloth(i).avgdist=sum(pop_cloth(i).dist)/s;
        fprintf(f,'\r\nparticle-%d Avg Distance (cloth): ',i);                         % APSO
        fprintf(f,'%0.0f   ', pop_cloth(i).avgdist);
        
        % Calculating dmax dmin.....................
        
        if max_cloth_dist<pop_cloth(i).avgdist
            max_cloth_dist=pop_cloth(i).avgdist;
        end
        if min_cloth_dist>pop_cloth(i).avgdist
            min_cloth_dist=pop_cloth(i).avgdist;
        end
        
        
    end
   

    
    % Calculating dg................................                       % APSO
    cloth_gbest.dist(1:s)=0;                                                % APSO
    for j=1:nPop    
           cloth_gbest.dist=cloth_gbest.dist + abs(((cloth_gbest.sol-pop_cloth(j).sol)));          % APSO                                            % APSO
    end                                                                                   % APSO
    cloth_gbest.dist=cloth_gbest.dist/nPop;
    fprintf(f,'\r\n GBest Sol (cloth): ');                             % APSO
    fprintf(f,'%0.0f   ', cloth_gbest.sol);
    fprintf(f,'\r\n GBest Distance (cloth): ');                             % APSO
    fprintf(f,'%0.0f   ', cloth_gbest.dist);
    cloth_gbest.avgdist=sum(cloth_gbest.dist)/s;
    
    %checking id dg>d_max or dg,d_min................                      % APSO
    if cloth_gbest.avgdist>max_cloth_dist
        max_cloth_dist=cloth_gbest.avgdist;
    end
    
    %Roundinf off max_dist,min_dist,avgdist........................... 
    
    cloth_gbest.avgdist=round(cloth_gbest.avgdist,0);                        %APSO
    max_cloth_dist=round(max_cloth_dist,0);                                  %APSO
    min_cloth_dist=round(min_cloth_dist,0);                                  %APSO
    
    fprintf(f,'\r\n d_gbrst(food): %0.0f   ', cloth_gbest.avgdist);
    fprintf(f,'\r\n d_max(food): %0.0f',max_cloth_dist);                         % APSO
    fprintf(f,'\r\n d_min(food): %0.0f',min_cloth_dist);                         % APSO
    if isequal(round(max_cloth_dist,10),round(min_cloth_dist,10))
        f_cloth=0;
    else
        f_cloth=abs((cloth_gbest.avgdist-min_cloth_dist)/(max_cloth_dist-min_cloth_dist));
        if f_cloth>1
            f_cloth=1;
        end
        fprintf(f,'\r\n f_food: %0.5f',f_cloth); 
    end
    plot_cloth_dist(it)= f_cloth;
    
    st_cloth=[0,0,0,0];
    
    %Calculating s1.................................
    if ((f_cloth<=0.4 && f_cloth>0.0)||(f_cloth==0.0))
        st_cloth(1)=0;
    elseif all(f_cloth>0.4 & f_cloth<=0.6)
        st_cloth(1)=(5*f_cloth)-2;
    elseif all(f_cloth>0.6 & f_cloth<=0.7)
        st_cloth(1)=1;
    elseif all(f_cloth>0.7 & f_cloth<=0.8)
        st_cloth(1)=(-10*f_cloth)+8;
    elseif all(f_cloth>0.8 & f_cloth<=1.0)
        st_cloth(1)=0;
    end
        
    %Calculating s2.................................
    if ((f_cloth<=0.2 && f_cloth>0.0)||(f_cloth==0.0))
        st_cloth(2)=0;
    elseif all(f_cloth>0.2 & f_cloth<=0.3)
        st_cloth(2)=(10*f_cloth)-2;
    elseif all(f_cloth>0.3 & f_cloth<=0.4)
        st_cloth(2)=1;
    elseif all(f_cloth>0.4 & f_cloth<=0.6)
        st_cloth(2)=(-5*f_cloth)+3;
    elseif all(f_cloth>0.6 & f_cloth<=1.0)
        st_cloth(2)=0;
    end
        
    %Calculating s3.................................
    if ((f_cloth<=0.1 && f_cloth>0.0)||(f_cloth==0.0))
        st_cloth(3)=1;
    elseif all(f_cloth>0.1 & f_cloth<=0.3)
        st_cloth(3)=(-5*f_cloth)+1.5;
    elseif all(f_cloth>0.3 & f_cloth<=1.0)
        st_cloth(3)=0;
    end
        
    %Calculating s4.................................
    if ((f_cloth<=0.7 && f_cloth>0.0)||(f_cloth==0.0))
        st_cloth(4)=0;
    elseif all(f_cloth>0.7 & f_cloth<=0.9)
        st_cloth(4)=(5*f_cloth)-3.5;
    elseif all(f_cloth>0.9 & f_cloth<=1.0)
        st_cloth(4)=1;
    end    
    
    [temp,state_cloth(it)]=max(st_cloth);
    if it~=1
        if all(f_cloth>0.2 & f_cloth<0.3)
            if all((state_cloth(it-1)==3)||(state_cloth(it-1)==4))
                state_cloth(it)=3;
            else
                state_cloth(it)=2;
            end
      elseif all(f_cloth>0.4 & f_cloth<0.6)
            if all((state_cloth(it-1)==3)||(state_cloth(it-1)==2))
                state_cloth(it)=2;
            else
                state_cloth(it)=1;
            end
        elseif all(f_cloth>0.7 & f_cloth<0.8)
            if all((state_cloth(it-1)==1)||(state_cloth(it-1)==2))
                state_cloth(it)=1;
            else
                state_cloth(it)=4;
            end
        end
    
    end
    
    %APSO Updation w,c1,c2......................
    
    %{%}
    w_cloth=1/(1+(1.5*exp(-2.6*f_cloth)));
    w_cloth=(w_cloth*4)/9;
    
    
    
    
    if state_cloth(it)==1
        c1_cloth=c1_cloth+0.1;
        c2_cloth=c2_cloth-0.1;
    elseif state_cloth(it)==2
        c1_cloth=c1_cloth+0.05;
        c2_cloth=c2_cloth-0.05;
    elseif state_cloth(it)==3
        c1_cloth=c1_cloth+0.05;
        c2_cloth=c2_cloth+0.05;
    elseif state_cloth(it)==4
        c1_cloth=c1_cloth-0.1;
        c2_cloth=c2_cloth+0.1;
    end
    
    if (c1_cloth+c2_cloth)>3
        c1_cloth=(c1_cloth/(c1_cloth+c2_cloth))*3;
        c2_cloth=(c2_cloth/(c1_cloth+c2_cloth))*3;
    end
     
   
    
    fprintf('\r\nIt %d (Cloth): F=%0.3f   s1=%0.3f   s2=%0.3f   s3=%0.3f   s4=%0.3f           state=%d         w=%0.3f         c1=%0.3f         c2=%0.3f',it,f_cloth,st_cloth(1),st_cloth(2),st_cloth(3),st_cloth(4),state_cloth(it),w_cloth,c1_cloth,c2_cloth);

    
   
    for i=1:nPop
        maxAlloc_cloth= w_cloth*maxAlloc_cloth+c1_cloth*rand(1,1)*(pop_cloth(i).pbest-pop_cloth(i).sol)+c2_cloth*rand(1,1)*(cloth_gbest.sol-pop_cloth(i).sol);
        %fprintf('\nMAX= ');
        %disp(maxAlloc_cloth);
        
        pop_cloth(i).fitness=FitnessFunction(pop_cloth(i).sol,pcost_cloth,totacloth);
        plot_cloth(it,i)=pop_cloth(i).fitness;    %for plot
        fprintf(f,'\r\nIt %d particle-%d (Cloth): ',it,i);
        fprintf(f,'%0.0f  ',pop_cloth(i).sol);
        fprintf(f,'          Fitness : %0.12f',pop_cloth(i).fitness);
        %disp([num2str(pop_cloth(i).sol),'          Fitness : ',num2str(pop_cloth(i).fitness)]);
        if pop_cloth(i).fitness<pop_cloth(i).pbest_fitness
            pop_cloth(i).pbest_fitness=pop_cloth(i).fitness;
            pop_cloth(i).pbest=pop_cloth(i).sol;
            fprintf(f,'.......NEW PBEST');
            if pop_cloth(i).fitness<cloth_gbest.fitness
                cloth_gbest.fitness=pop_cloth(i).fitness;
                cloth_gbest.sol=pop_cloth(i).sol;
                cloth_gbest.dist=pop_cloth(i).dist;                           %APSO
                cloth_gbest.avgdist=pop_cloth(i).avgdist;                     %APSO
                fprintf(f,'.......NEW GBEST');
            end
        end
        pop_cloth(i).sol=pop_cloth(i).sol+maxAlloc_cloth;
%         pop_cloth(i).sol=max(pop_cloth(i).sol,minAlloc_cloth);
%         pop_cloth(i).sol=min(pop_cloth(i).sol,pdmd_cloth);
     end
    
    %check if particles have converged or not
    %if isequal(pop_cloth(1).sol,pop_cloth(2).sol,pop_cloth(3).sol,pop_cloth(4).sol) && set_cloth==0
    if isequal(round(pop_cloth(1).fitness,5),round(pop_cloth(2).fitness,5),round(pop_cloth(3).fitness,5),round(pop_cloth(4).fitness,5)) && set_cloth==0
        cp_cloth=it;
        fprintf(f,'\r\n****************************CLOTH particles have converged********************************');
        %fprintf('\r\n\r\n\r\n');
        %xyz=input('');
        set_cloth=1;
    end
    fprintf(f,'\r\n\r\n');
    
    %ME...................
    
    
    
     %avg_food_dist=[0,0,0,0];
    max_me_dist=0;                                                       %APSO
    min_me_dist=inf;                                                     %APSO
    for i=1:nPop
        pop_me(i).dist(1:s)=0;                                                % APSO
        for j=1:nPop    
            pop_me(i).dist=pop_me(i).dist + abs(((pop_me(i).sol-pop_me(j).sol)));          % APSO                                            % APSO
            %fprintf("\navg distance of fd(%d) from all other particles is = %.3f",i,fd(i));% APSO
        end                                                                                   % APSO
        pop_me(i).dist=pop_me(i).dist/(nPop-1);
        fprintf(f,'\r\nparticle-%d Distance (Medical Equipment): ',i);                         % APSO
        fprintf(f,'%0.0f   ', pop_me(i).dist);
        pop_me(i).avgdist=sum(pop_me(i).dist)/s;
        fprintf(f,'\r\nparticle-%d Avg Distance (Medical Equipment): ',i);                         % APSO
        fprintf(f,'%0.0f   ', pop_me(i).avgdist);
        
        % Calculating dmax dmin.....................
        
        if max_me_dist<pop_me(i).avgdist
            max_me_dist=pop_me(i).avgdist;
        end
        if min_me_dist>pop_me(i).avgdist
            min_me_dist=pop_me(i).avgdist;
        end
        
        
    end
   

    
    % Calculating dg................................                       % APSO
    me_gbest.dist(1:s)=0;                                                % APSO
    for j=1:nPop    
           me_gbest.dist=me_gbest.dist + abs(((me_gbest.sol-pop_me(j).sol)));          % APSO                                            % APSO
    end                                                                                   % APSO
    me_gbest.dist=me_gbest.dist/nPop;
    fprintf(f,'\r\n GBest Sol (Medical Equipment): ');                             % APSO
    fprintf(f,'%0.0f   ', me_gbest.sol);
    fprintf(f,'\r\n GBest Distance (Medical Equipment): ');                             % APSO
    fprintf(f,'%0.0f   ', me_gbest.dist);
    me_gbest.avgdist=sum(me_gbest.dist)/s;
    
    %checking id dg>d_max or dg,d_min................                      % APSO
    if me_gbest.avgdist>max_me_dist
        max_me_dist=me_gbest.avgdist;
    end
    
    %Roundinf off max_dist,min_dist,avgdist........................... 
    
    me_gbest.avgdist=round(me_gbest.avgdist,0);                        %APSO
    max_me_dist=round(max_me_dist,0);                                  %APSO
    min_me_dist=round(min_me_dist,0);                                  %APSO
    
    fprintf(f,'\r\n d_gbrst(Medical Equipment): %0.0f   ', me_gbest.avgdist);
    fprintf(f,'\r\n d_max(Medical Equipment): %0.0f',max_me_dist);                         % APSO
    fprintf(f,'\r\n d_min(Medical Equipment): %0.0f',min_me_dist);                         % APSO
    if isequal(round(max_me_dist,10),round(min_me_dist,10))
        f_me=0;
    else
        f_me=abs((me_gbest.avgdist-min_me_dist)/(max_me_dist-min_me_dist));
        if f_me>1
            f_me=1;
        end
        fprintf(f,'\r\n f_food: %0.5f',f_me); 
    end
    plot_me_dist(it)= f_me;
    
    st_me=[0,0,0,0];
    
    %Calculating s1.................................
    if ((f_me<=0.4 && f_me>0.0)||(f_me==0.0))
        st_me(1)=0;
    elseif all(f_me>0.4 & f_me<=0.6)
        st_me(1)=(5*f_me)-2;
    elseif all(f_me>0.6 & f_me<=0.7)
        st_me(1)=1;
    elseif all(f_me>0.7 & f_me<=0.8)
        st_me(1)=(-10*f_me)+8;
    elseif all(f_me>0.8 & f_me<=1.0)
        st_me(1)=0;
    end
        
    %Calculating s2.................................
    if ((f_me<=0.2 && f_me>0.0)||(f_me==0.0))
        st_me(2)=0;
    elseif all(f_me>0.2 & f_me<=0.3)
        st_me(2)=(10*f_me)-2;
    elseif all(f_me>0.3 & f_me<=0.4)
        st_me(2)=1;
    elseif all(f_me>0.4 & f_me<=0.6)
        st_me(2)=(-5*f_me)+3;
    elseif all(f_me>0.6 & f_me<=1.0)
        st_me(2)=0;
    end
        
    %Calculating s3.................................
    if ((f_me<=0.1 && f_me>0.0)||(f_me==0.0))
        st_me(3)=1;
    elseif all(f_me>0.1 & f_me<=0.3)
        st_me(3)=(-5*f_me)+1.5;
    elseif all(f_me>0.3 & f_me<=1.0)
        st_me(3)=0;
    end
        
    %Calculating s4.................................
    if ((f_me<=0.7 && f_me>0.0)||(f_me==0.0))
        st_me(4)=0;
    elseif all(f_me>0.7 & f_me<=0.9)
        st_me(4)=(5*f_me)-3.5;
    elseif all(f_me>0.9 & f_me<=1.0)
        st_me(4)=1;
    end    
    
    [temp,state_me(it)]=max(st_me);
    if it~=1
        if all(f_me>0.2 & f_me<0.3)
            if all((state_me(it-1)==3)||(state_me(it-1)==4))
                state_me(it)=3;
            else
                state_me(it)=2;
            end
      elseif all(f_me>0.4 & f_me<0.6)
            if all((state_me(it-1)==3)||(state_me(it-1)==2))
                state_me(it)=2;
            else
                state_me(it)=1;
            end
        elseif all(f_me>0.7 & f_me<0.8)
            if all((state_me(it-1)==1)||(state_me(it-1)==2))
                state_me(it)=1;
            else
                state_me(it)=4;
            end
        end
    
    end
    
    %APSO Updation w,c1,c2......................
    
    %{%}
    w_me=1/(1+(1.5*exp(-2.6*f_me)));
    w_me=(w_me*4)/9;
    
    
    
    
    if state_me(it)==1
        c1_me=c1_me+0.1;
        c2_me=c2_me-0.1;
    elseif state_me(it)==2
        c1_me=c1_me+0.05;
        c2_me=c2_me-0.05;
    elseif state_me(it)==3
        c1_me=c1_me+0.05;
        c2_me=c2_me+0.05;
    elseif state_me(it)==4
        c1_me=c1_me-0.1;
        c2_me=c2_me+0.1;
    end
    
    if (c1_me+c2_me)>3
        c1_me=(c1_me/(c1_me+c2_me))*3;
        c2_me=(c2_me/(c1_me+c2_me))*3;
    end
     
   
    
    fprintf('\r\nIt %d (Medical Equipment): F=%0.3f   s1=%0.3f   s2=%0.3f   s3=%0.3f   s4=%0.3f           state=%d         w=%0.3f         c1=%0.3f         c2=%0.3f',it,f_me,st_me(1),st_me(2),st_me(3),st_me(4),state_me(it),w_me,c1_me,c2_me);

    
    
    
    
    for i=1:nPop
        maxAlloc_me= w_me*maxAlloc_me+c1_me*rand(1,1)*(pop_me(i).pbest-pop_me(i).sol)+c2_me*rand(1,1)*(me_gbest.sol-pop_me(i).sol);
        %fprintf('\nMAX= ');
        %disp(maxAlloc_me);
        
        pop_me(i).fitness=FitnessFunction(pop_me(i).sol,pcost_me,totame);
        plot_me(it,i)=pop_me(i).fitness;    %for plot
        fprintf(f,'\r\nIt %d particle-%d (Medical Equipments): ',it,i);
        fprintf(f,'%0.0f  ',pop_me(i).sol);
        fprintf(f,'          Fitness : %0.12f',pop_me(i).fitness);
        %disp([num2str(pop_me(i).sol),'          Fitness : ',num2str(pop_me(i).fitness)]);
        if pop_me(i).fitness<pop_me(i).pbest_fitness
            pop_me(i).pbest_fitness=pop_me(i).fitness;
            pop_me(i).pbest=pop_me(i).sol;
            fprintf(f,'.......NEW PBEST');
            if pop_me(i).fitness<me_gbest.fitness
                me_gbest.fitness=pop_me(i).fitness;
                me_gbest.sol=pop_me(i).sol;
                me_gbest.dist=pop_me(i).dist;                           %APSO
                me_gbest.avgdist=pop_me(i).avgdist;                     %APSO
                fprintf(f,'.......NEW GBEST');
            end
        end
        pop_me(i).sol=pop_me(i).sol+maxAlloc_me;
%         pop_me(i).sol=max(pop_me(i).sol,minAlloc_me);
%         pop_me(i).sol=min(pop_me(i).sol,pdmd_me);
    end
    
    %check if particles have converged or not
     %if isequal(pop_me(1).sol,pop_me(2).sol,pop_me(3).sol,pop_me(4).sol) && set_me==0
     if isequal(round(pop_me(1).fitness,5),round(pop_me(2).fitness,5),round(pop_me(3).fitness,5),round(pop_me(4).fitness,5)) && set_me==0
        cp_me=it;
        fprintf(f,'\r\n****************************ME particles have converged********************************');
        %fprintf('\r\n\r\n\r\n');
        %xyz=input('');
        set_me=1;
     end
    fprintf(f,'\r\n\r\n');
    
    
    
    
    %RM...................
    
     %avg_food_dist=[0,0,0,0];
    max_rm_dist=0;                                                       %APSO
    min_rm_dist=inf;                                                     %APSO
    for i=1:nPop
        pop_rm(i).dist(1:s)=0;                                                % APSO
        for j=1:nPop    
            pop_rm(i).dist=pop_rm(i).dist + abs(((pop_rm(i).sol-pop_rm(j).sol)));          % APSO                                            % APSO
            %fprintf("\navg distance of fd(%d) from all other particles is = %.3f",i,fd(i));% APSO
        end                                                                                   % APSO
        pop_rm(i).dist=pop_rm(i).dist/(nPop-1);
        fprintf(f,'\r\nparticle-%d Distance (Rescue Member): ',i);                         % APSO
        fprintf(f,'%0.0f   ', pop_rm(i).dist);
        pop_rm(i).avgdist=sum(pop_rm(i).dist)/s;
        fprintf(f,'\r\nparticle-%d Avg Distance (Rescue Member): ',i);                         % APSO
        fprintf(f,'%0.0f   ', pop_rm(i).avgdist);
        
        % Calculating dmax dmin.....................
        
        if max_rm_dist<pop_rm(i).avgdist
            max_rm_dist=pop_rm(i).avgdist;
        end
        if min_rm_dist>pop_rm(i).avgdist
            min_rm_dist=pop_rm(i).avgdist;
        end
        
        
    end
   

    
    % Calculating dg................................                       % APSO
    rm_gbest.dist(1:s)=0;                                                % APSO
    for j=1:nPop    
           rm_gbest.dist=rm_gbest.dist + abs(((rm_gbest.sol-pop_rm(j).sol)));          % APSO                                            % APSO
    end                                                                                   % APSO
    rm_gbest.dist=rm_gbest.dist/nPop;
    fprintf(f,'\r\n GBest Sol (Rescue Member): ');                             % APSO
    fprintf(f,'%0.0f   ', rm_gbest.sol);
    fprintf(f,'\r\n GBest Distance (Rescue Member): ');                             % APSO
    fprintf(f,'%0.0f   ', rm_gbest.dist);
    rm_gbest.avgdist=sum(rm_gbest.dist)/s;
    
    %checking id dg>d_max or dg,d_min................                      % APSO
    if rm_gbest.avgdist>max_rm_dist
        max_rm_dist=rm_gbest.avgdist;
    end
    
    %Roundinf off max_dist,min_dist,avgdist........................... 
    
    rm_gbest.avgdist=round(rm_gbest.avgdist,0);                        %APSO
    max_rm_dist=round(max_rm_dist,0);                                  %APSO
    min_rm_dist=round(min_rm_dist,0);                                  %APSO
    
    fprintf(f,'\r\n d_gbrst(Rescue Member): %0.0f   ', rm_gbest.avgdist);
    fprintf(f,'\r\n d_max(Rescue Member): %0.0f',max_rm_dist);                         % APSO
    fprintf(f,'\r\n d_min(Rescue Member): %0.0f',min_rm_dist);                         % APSO
    if isequal(round(max_rm_dist,10),round(min_rm_dist,10))
        f_rm=0;
    else
        f_rm=abs((rm_gbest.avgdist-min_rm_dist)/(max_rm_dist-min_rm_dist));
        if f_rm>1
            f_rm=1;
        end
        fprintf(f,'\r\n f_food: %0.5f',f_rm); 
    end
    plot_rm_dist(it)= f_rm;
    
    st_rm=[0,0,0,0];
    
    %Calculating s1.................................
    if ((f_rm<=0.4 && f_rm>0.0)||(f_rm==0.0))
        st_rm(1)=0;
    elseif all(f_rm>0.4 & f_rm<=0.6)
        st_rm(1)=(5*f_rm)-2;
    elseif all(f_rm>0.6 & f_rm<=0.7)
        st_rm(1)=1;
    elseif all(f_rm>0.7 & f_rm<=0.8)
        st_rm(1)=(-10*f_rm)+8;
    elseif all(f_rm>0.8 & f_rm<=1.0)
        st_rm(1)=0;
    end
        
    %Calculating s2.................................
    if ((f_rm<=0.2 && f_rm>0.0)||(f_rm==0.0))
        st_rm(2)=0;
    elseif all(f_rm>0.2 & f_rm<=0.3)
        st_rm(2)=(10*f_rm)-2;
    elseif all(f_rm>0.3 & f_rm<=0.4)
        st_rm(2)=1;
    elseif all(f_rm>0.4 & f_rm<=0.6)
        st_rm(2)=(-5*f_rm)+3;
    elseif all(f_rm>0.6 & f_rm<=1.0)
        st_rm(2)=0;
    end
        
    %Calculating s3.................................
    if ((f_rm<=0.1 && f_rm>0.0)||(f_rm==0.0))
        st_rm(3)=1;
    elseif all(f_rm>0.1 & f_rm<=0.3)
        st_rm(3)=(-5*f_rm)+1.5;
    elseif all(f_rm>0.3 & f_rm<=1.0)
        st_rm(3)=0;
    end
        
    %Calculating s4.................................
    if ((f_rm<=0.7 && f_rm>0.0)||(f_rm==0.0))
        st_rm(4)=0;
    elseif all(f_rm>0.7 & f_rm<=0.9)
        st_rm(4)=(5*f_rm)-3.5;
    elseif all(f_rm>0.9 & f_rm<=1.0)
        st_rm(4)=1;
    end    
    
    [temp,state_rm(it)]=max(st_rm);
    if it~=1
        if all(f_rm>0.2 & f_rm<0.3)
            if all((state_rm(it-1)==3)||(state_rm(it-1)==4))
                state_rm(it)=3;
            else
                state_rm(it)=2;
            end
      elseif all(f_rm>0.4 & f_rm<0.6)
            if all((state_rm(it-1)==3)||(state_rm(it-1)==2))
                state_rm(it)=2;
            else
                state_rm(it)=1;
            end
        elseif all(f_rm>0.7 & f_rm<0.8)
            if all((state_rm(it-1)==1)||(state_rm(it-1)==2))
                state_rm(it)=1;
            else
                state_rm(it)=4;
            end
        end
    
    end
    
    %APSO Updation w,c1,c2......................
    
    %{%}
    w_rm=1/(1+(1.5*exp(-2.6*f_rm)));
    w_rm=(w_rm*4)/9;
    
    
    
    
    if state_rm(it)==1
        c1_rm=c1_rm+0.1;
        c2_rm=c2_rm-0.1;
    elseif state_rm(it)==2
        c1_rm=c1_rm+0.05;
        c2_rm=c2_rm-0.05;
    elseif state_rm(it)==3
        c1_rm=c1_rm+0.05;
        c2_rm=c2_rm+0.05;
    elseif state_rm(it)==4
        c1_rm=c1_rm-0.1;
        c2_rm=c2_rm+0.1;
    end
    
    if (c1_rm+c2_rm)>3
        c1_rm=(c1_rm/(c1_rm+c2_rm))*3;
        c2_rm=(c2_rm/(c1_rm+c2_rm))*3;
    end
     
   
    
    fprintf('\r\nIt %d (Rescue Member): F=%0.3f   s1=%0.3f   s2=%0.3f   s3=%0.3f   s4=%0.3f           state=%d         w=%0.3f         c1=%0.3f         c2=%0.3f',it,f_rm,st_rm(1),st_rm(2),st_rm(3),st_rm(4),state_rm(it),w_rm,c1_rm,c2_rm);

    
    
    
    for i=1:nPop
        maxAlloc_rm= w_rm*maxAlloc_rm+c1_rm*rand(1,1)*(pop_rm(i).pbest-pop_rm(i).sol)+c2_rm*rand(1,1)*(rm_gbest.sol-pop_rm(i).sol);
        %fprintf('\nMAX= ');
        %disp(maxAlloc_rm);
        
        pop_rm(i).fitness=FitnessFunction(pop_rm(i).sol,pcost_rm,totarm);
        plot_rm(it,i)=pop_rm(i).fitness;    %for plot
        fprintf(f,'\r\nIt %d particle-%d (Rescue Members): ',it,i);
        fprintf(f,'%0.0f  ',pop_rm(i).sol);
        fprintf(f,'          Fitness : %0.12f',pop_rm(i).fitness);
        %disp([num2str(pop_rm(i).sol),'          Fitness : ',num2str(pop_rm(i).fitness)]);
        if pop_rm(i).fitness<pop_rm(i).pbest_fitness
            pop_rm(i).pbest_fitness=pop_rm(i).fitness;
            pop_rm(i).pbest=pop_rm(i).sol;
            fprintf(f,'.......NEW PBEST');
            if pop_rm(i).fitness<rm_gbest.fitness
                rm_gbest.fitness=pop_rm(i).fitness;
                rm_gbest.sol=pop_rm(i).sol;
                rm_gbest.dist=pop_rm(i).dist;                           %APSO
                rm_gbest.avgdist=pop_rm(i).avgdist;                     %APSO
                fprintf(f,'.......NEW GBEST');
            end
        end
        pop_rm(i).sol=pop_rm(i).sol+maxAlloc_rm;
%         pop_rm(i).sol=max(pop_rm(i).sol,minAlloc_rm);
%         pop_rm(i).sol=min(pop_rm(i).sol,pdmd_rm);
    end
    
    %check if particles have converged or not
    %if isequal(pop_rm(1).sol,pop_rm(2).sol,pop_rm(3).sol,pop_rm(4).sol) && set_rm==0
    if isequal(round(pop_rm(1).fitness,5),round(pop_rm(2).fitness,5),round(pop_rm(3).fitness,5),round(pop_rm(4).fitness,5)) && set_rm==0
        cp_rm=it;
        fprintf(f,'\r\n****************************RM particles have converged********************************');
        %fprintf('\r\n\r\n\r\n');
        %xyz=input('');
        set_rm=1;
    end
    fprintf(f,'\r\n\r\n');
           


end




%% Result
%%fn2=sprintf('%s---Result.txt',o);
%%fn3=sprintf('%s---Convergence Report.txt',o);
%%f2=fopen(fn2,'a');
%%f3=fopen(fn3,'a');
%%fprintf(f2,'\r\n\r\n\r\n________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________\r\n\r\n\r\n\t\t\t\t\t%s\t\t%s\t\t%s\r\n',x,y,z);
%%fprintf(f3,'\r\n\r\n________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________\r\n\r\n%s\t%s\t%s:\t\t',x,y,z);

%FOOD...................................
%%fprintf(f,'\r\n\r\n\r\n\r\n\nRESULT:\r\n.........\r\n\r\n                                    alocation\r\n                              [ a1   a2   a3   a4 ]\r\n\r\n');
fprintf('\r\n\r\n\r\n\r\n\nRESULT:\r\n.........\r\n\r\n                                    alocation\r\n                              [ a1   a2   a3   a4 ]\r\n\r\n');
%%fprintf(f,'\r\n            Food:               ');
fprintf('\r\n            Food:               ');
%%fprintf(f2,'\r\nFood:               ');
%%fprintf(f,'%0.0f   ',round(pop_food(1).sol));
fprintf('%0.0f   ',round(pop_food(1).sol));
%%fprintf(f2,'%0.0f   ',round(pop_food(1).sol));
%%fprintf(f,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_food(1).sol)),cp_food,round(pop_food(1).fitness,3),totfoodd,round(((sum(pop_food(1).sol))*100)/totfoodd),pcost_food,round(((sum(pop_food(1).sol))*100)/pcost_food),totafood,round(((sum(pop_food(1).sol))*100)/totafood));
fprintf('\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_food(1).sol)),cp_food,round(pop_food(1).fitness,3),totfoodd,round(((sum(pop_food(1).sol))*100)/totfoodd),pcost_food,round(((sum(pop_food(1).sol))*100)/pcost_food),totafood,round(((sum(pop_food(1).sol))*100)/totafood));
%%fprintf(f2,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_food(1).sol)),cp_food,round(pop_food(1).fitness,3),totfoodd,round(((sum(pop_food(1).sol))*100)/totfoodd),pcost_food,round(((sum(pop_food(1).sol))*100)/pcost_food),totafood,round(((sum(pop_food(1).sol))*100)/totafood));
if cp_food==inf
    %%fprintf(f3,'(%d)Food\t',fc);
    %fc=fc+1;
end
%disp(['            FD: ',num2str(round(pop_food(1).sol)),sprintf('\t\tConvergance Point: '),num2str(cp_food),sprintf('\t\t\tFitness: '),num2str(round(pop_food(1).fitness,3)),sprintf('\t\t\tAllocation percentage w.r.t actual Demand: '),num2str(round(((sum(pop_food(1).sol))*100)/totfoodd)),sprintf('\t\t\t\tAllocation percentage w.r.t Plotted Demand: '),num2str(round(((sum(pop_food(1).sol))*100)/pcost_food)),sprintf('\t\t\t\tAllocation percentage w.r.t Allotadable Resources: '),num2str(round(((sum(pop_food(1).sol))*100)/totafood))]);

%disp(sum(pop_food(1).sol));


%WATER...................

%%fprintf(f,'\r\n            Water:              ');
fprintf('\r\n            Water:              ');
%%fprintf(f2,'\r\nWater:              ');
%%fprintf(f,'%0.0f   ',round(pop_water(1).sol));
fprintf('%0.0f   ',round(pop_water(1).sol));
%%fprintf(f2,'%0.0f   ',round(pop_water(1).sol));
%%fprintf(f,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_water(1).sol)),cp_water,round(pop_water(1).fitness,3),totwaterd,round(((sum(pop_water(1).sol))*100)/totwaterd),pcost_water,round(((sum(pop_water(1).sol))*100)/pcost_water),totawater,round(((sum(pop_water(1).sol))*100)/totawater));
fprintf('\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_water(1).sol)),cp_water,round(pop_water(1).fitness,3),totwaterd,round(((sum(pop_water(1).sol))*100)/totwaterd),pcost_water,round(((sum(pop_water(1).sol))*100)/pcost_water),totawater,round(((sum(pop_water(1).sol))*100)/totawater));
%%fprintf(f2,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_water(1).sol)),cp_water,round(pop_water(1).fitness,3),totwaterd,round(((sum(pop_water(1).sol))*100)/totwaterd),pcost_water,round(((sum(pop_water(1).sol))*100)/pcost_water),totawater,round(((sum(pop_water(1).sol))*100)/totawater));
if cp_water==inf
    %%fprintf(f3,'(%d)Water\t',wc);
    %wc=wc+1;
end
%disp(['            WT: ',num2str(round(pop_water(1).sol)),sprintf('\t\t\tConvergance Point: '),num2str(cp_water),sprintf('\t\t\tFitness: '),num2str(round(pop_water(1).fitness,3)),sprintf('\t\t\tAllocation percentage w.r.t actual Demand: '),num2str(round(((sum(pop_water(1).sol))*100)/totwaterd)),sprintf('\t\t\t\tAllocation percentage w.r.t Plotted Demand: '),num2str(round(((sum(pop_water(1).sol))*100)/pcost_water)),sprintf('\t\t\t\tAllocation percentage w.r.t Allotadable Resources: '),num2str(round(((sum(pop_water(1).sol))*100)/totawater))]);

%disp(sum(pop_water(1).sol));


%CLOTH...................

%%fprintf(f,'\r\n            Cloth:              ');
fprintf('\r\n            Cloth:              ');
%%fprintf(f2,'\r\nCloth:              ');
%%fprintf(f,'%0.0f   ',round(pop_cloth(1).sol));
fprintf('%0.0f   ',round(pop_cloth(1).sol));
%%fprintf(f2,'%0.0f   ',round(pop_cloth(1).sol));
%%fprintf(f,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_cloth(1).sol)),cp_cloth,round(pop_cloth(1).fitness,3),totclothd,round(((sum(pop_cloth(1).sol))*100)/totclothd),pcost_cloth,round(((sum(pop_cloth(1).sol))*100)/pcost_cloth),totacloth,round(((sum(pop_cloth(1).sol))*100)/totacloth));
fprintf('\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_cloth(1).sol)),cp_cloth,round(pop_cloth(1).fitness,3),totclothd,round(((sum(pop_cloth(1).sol))*100)/totclothd),pcost_cloth,round(((sum(pop_cloth(1).sol))*100)/pcost_cloth),totacloth,round(((sum(pop_cloth(1).sol))*100)/totacloth));
%%fprintf(f2,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_cloth(1).sol)),cp_cloth,round(pop_cloth(1).fitness,3),totclothd,round(((sum(pop_cloth(1).sol))*100)/totclothd),pcost_cloth,round(((sum(pop_cloth(1).sol))*100)/pcost_cloth),totacloth,round(((sum(pop_cloth(1).sol))*100)/totacloth));
if cp_cloth==inf
    %%fprintf(f3,'(%d)Cloth\t',cc);
    %cc=cc+1;
end
%disp(['            CT: ',num2str(round(pop_cloth(1).sol)),sprintf('\t\t\tConvergance Point: '),num2str(cp_cloth),sprintf('\t\t\tFitness: '),num2str(round(pop_cloth(1).fitness,3)),sprintf('\t\t\tAllocation percentage w.r.t actual Demand: '),num2str(round(((sum(pop_cloth(1).sol))*100)/totclothd)),sprintf('\t\t\t\tAllocation percentage w.r.t Plotted Demand: '),num2str(round(((sum(pop_cloth(1).sol))*100)/pcost_cloth)),sprintf('\t\t\t\tAllocation percentage w.r.t Allotadable Resources: '),num2str(round(((sum(pop_cloth(1).sol))*100)/totacloth))]);

%disp(sum(pop_cloth(1).sol));


%ME...................

%%fprintf(f,'\r\n            Medical Equipments: ');
fprintf('\r\n            Medical Equipments: ');
%%fprintf(f2,'\r\nMedical Equipments: ');
%%fprintf(f,'%0.0f   ',round(pop_me(1).sol));
fprintf('%0.0f   ',round(pop_me(1).sol));
%%fprintf(f2,'%0.0f   ',round(pop_me(1).sol));
%%fprintf(f,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_me(1).sol)),cp_me,round(pop_me(1).fitness,3),totmed,round(((sum(pop_me(1).sol))*100)/totmed),pcost_me,round(((sum(pop_me(1).sol))*100)/pcost_me),totame,round(((sum(pop_me(1).sol))*100)/totame));
fprintf('\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_me(1).sol)),cp_me,round(pop_me(1).fitness,3),totmed,round(((sum(pop_me(1).sol))*100)/totmed),pcost_me,round(((sum(pop_me(1).sol))*100)/pcost_me),totame,round(((sum(pop_me(1).sol))*100)/totame));
%%fprintf(f2,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_me(1).sol)),cp_me,round(pop_me(1).fitness,3),totmed,round(((sum(pop_me(1).sol))*100)/totmed),pcost_me,round(((sum(pop_me(1).sol))*100)/pcost_me),totame,round(((sum(pop_me(1).sol))*100)/totame));
if cp_me==inf
%%    fprintf(f3,'(%d)Medical Equipment\t',mec);
    %mec=mec+1;
end
%disp(['            ME: ',num2str(round(pop_me(1).sol)),sprintf('\t\t\tConvergance Point: '),num2str(cp_me),sprintf('\t\t\tFitness: '),num2str(round(pop_me(1).fitness,3)),sprintf('\t\t\tAllocation percentage w.r.t actual Demand: '),num2str(round(((sum(pop_me(1).sol))*100)/totmed)),sprintf('\t\t\t\tAllocation percentage w.r.t Plotted Demand: '),num2str(round(((sum(pop_me(1).sol))*100)/pcost_me)),sprintf('\t\t\t\tAllocation percentage w.r.t Allotadable Resources: '),num2str(round(((sum(pop_me(1).sol))*100)/totame))]);

%disp(sum(pop_me(1).sol));
    
    
%RM...................
%%fprintf(f,'\r\n\r\n            Rescue Members:    	');
fprintf('\r\n            Rescue Members:    	');
%%fprintf(f2,'\r\nRescue Members:     ');
%%fprintf(f,'%0.0f    ',round(pop_rm(1).sol));
fprintf('%0.0f    ',round(pop_rm(1).sol));
%%fprintf(f2,'%0.0f    ',round(pop_rm(1).sol));
%%fprintf(f,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_rm(1).sol)),cp_rm,round(pop_rm(1).fitness,3),totrmd,round(((sum(pop_rm(1).sol))*100)/totrmd),pcost_rm,round(((sum(pop_rm(1).sol))*100)/pcost_rm),totarm,round(((sum(pop_rm(1).sol))*100)/totarm));
fprintf('\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_rm(1).sol)),cp_rm,round(pop_rm(1).fitness,3),totrmd,round(((sum(pop_rm(1).sol))*100)/totrmd),pcost_rm,round(((sum(pop_rm(1).sol))*100)/pcost_rm),totarm,round(((sum(pop_rm(1).sol))*100)/totarm));
%%fprintf(f2,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_rm(1).sol)),cp_rm,round(pop_rm(1).fitness,3),totrmd,round(((sum(pop_rm(1).sol))*100)/totrmd),pcost_rm,round(((sum(pop_rm(1).sol))*100)/pcost_rm),totarm,round(((sum(pop_rm(1).sol))*100)/totarm));
if cp_rm==inf
    %%fprintf(f3,'(%d)Rescue Member\t',rmc);
    %rmc=rmc+1;
end
%disp(['            RM: ',num2str(round(pop_rm(1).sol)),sprintf('\t\t\t\tConvergance Point: '),num2str(cp_rm),sprintf('\t\t\tFitness: '),num2str(round(pop_rm(1).fitness,3)),sprintf('\t\t\tAllocation percentage w.r.t actual Demand: '),num2str(round(((sum(pop_rm(1).sol))*100)/totrmd)),sprintf('\t\t\t\tAllocation percentage w.r.t Plotted Demand: '),num2str(round(((sum(pop_rm(1).sol))*100)/pcost_rm)),sprintf('\t\t\t\tAllocation percentage w.r.t Allotadable Resources: '),num2str(round(((sum(pop_rm(1).sol))*100)/totarm))]);

%disp(sum(pop_rm(1).sol));

%%fclose(f3);
%%fclose(f2);
%%fclose(f);
%% Plot


  figure;plot(plot_food_dist,'r','LineWidth', 1)
  title('Itiration vs f'),xlabel('Itiration'),ylabel('f')
  hold on; plot(plot_water_dist,'g','LineWidth', 1);plot(plot_cloth_dist,'b','LineWidth', 1);plot(plot_me_dist,'y','LineWidth', 1);plot(plot_rm_dist,'m','LineWidth', 1); hold off;
  legend('Food','Water','Cloth','Medical Equipments','Rescue Member')


fprintf('\r\n\r\n\r\n');
xyz=input('');
end