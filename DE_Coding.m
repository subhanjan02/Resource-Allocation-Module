while 1
clc;
clear;
close all;
 
%% Problem Definition
 
 
FitnessFunction=@(x,pcost,totar) Fitness_Function(x,pcost,totar);    % Cost Function
 
 
%{
%Resources...
foodr = input('Enter available food(Ton): \n');
waterr = input('Enter available water(Gallon): \n');
clothr = input('Enter available cloth(Dozen): \n');
mer = input('Enter available medical equipments(Packet): \n');
rmr = input('Enter available rescue member(Number): \n');
s=input('How many sites? ');                       % Number of Decision Variables
 
 
%}
 
 
 
 
%..........................................................................REMOVE
%Assigning input of all Resources in RP...
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
%{
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

%}
 
 
 
 
for n = 1:s
    %Calculate Total Demand.
    totfoodd=totfoodd+ifdmnd(n);
    totwaterd=totwaterd+iwdmnd(n);
    totclothd=totclothd+icdmnd(n);
    totmed=totmed+imedmnd(n);
    totrmd=totrmd+irmdmnd(n);
    
    n=n+1;
end
VarSize=[1 s];                                     % Decision Variables Matrix Size
 
 
 
 
 
 
%{
%All demands are set to 0.
totfoodd=0;
totwaterd=0;
totclothd=0;
totmed=0;
totrmd=0;
 
 
 
 
for n = 1:s
 
    %Take input of Initial demand for each resource in each area or gbest.
 
    ifdmnd(n) = input(['Enter food Demand of site ' num2str(n) '(Ton):\n']);
    iwdmnd(n) = input(['Enter water Demand of site ' num2str(n) '(Gallon):\n']);
    icdmnd(n) = input(['Enter cloths Demand of site ' num2str(n) '(Dozen):\n']);
    imedmnd(n) = input(['Enter medical equipments Demand of site ' num2str(n) '(Packet):\n']);
    irmdmnd(n) = input(['Enter rescue member Demand of site ' num2str(n) '(Number):\n']);
    
    
    
    %Calculate Total Demand.
    totfoodd=totfoodd+ifdmnd(n);
    totwaterd=totwaterd+iwdmnd(n);
    totclothd=totclothd+icdmnd(n);
    totmed=totmed+imedmnd(n);
    totrmd=totrmd+irmdmnd(n);
    
    n=n+1;
end
%}
 
% check if total demand exceeds availability or not. if total demand
% setting Maximum limit of allocation
 
%food..............
if totfoodd <= foodr
    maxAlloc_food = ifdmnd;
    pcost_food=totfoodd;
else
    pcost_food=0;
    for i=1:s
        maxAlloc_food(i)=(ifdmnd(i)/totfoodd)*foodr; 
        pcost_food=pcost_food+maxAlloc_food(i);
    end
end
 
 
minAlloc_food=0;          % Lower Bound of Decision Variables
fprintf('Upper Limit for Food:');
disp(maxAlloc_food);
 
 
 
 
%water.................
if totwaterd <= waterr
    maxAlloc_water = iwdmnd;
    pcost_water=totwaterd;
else
    pcost_water=0;
    for i=1:s
        maxAlloc_water(i)=(iwdmnd(i)/totwaterd)*waterr; 
        pcost_water=pcost_water+maxAlloc_water(i);
    end
end
 
 
minAlloc_water=0;          % Lower Bound of Decision Variables
fprintf('Upper Limit Water:');
disp(maxAlloc_water);
 
 
 
 
%cloth.................
if totclothd <= clothr
    maxAlloc_cloth = icdmnd;
    pcost_cloth=totclothd;
else
    pcost_cloth=0;
    for i=1:s
        maxAlloc_cloth(i)=(icdmnd(i)/totclothd)*clothr; 
        pcost_cloth=pcost_cloth+maxAlloc_cloth(i);
    end
end
 
 
minAlloc_cloth=0;          % Lower Bound of Decision Variables
fprintf('Upper Limit Water:');
disp(maxAlloc_cloth);
 
 
%medical equipments.................
if totmed <= mer
    maxAlloc_me = imedmnd;
    pcost_me=totmed;
else
    pcost_me=0;
    for i=1:s
        maxAlloc_me(i)=(imedmnd(i)/totmed)*mer; 
        pcost_me=pcost_me+maxAlloc_me(i);
    end
end
 
 
minAlloc_me=0;          % Lower Bound of Decision Variables
fprintf('Upper Limit Medical Equipments:');
disp(maxAlloc_me);
 
 
%rescue member.................
if totrmd <= rmr
    maxAlloc_rm = irmdmnd;
    pcost_rm=totrmd;
else
    pcost_rm=0;
    for i=1:s
        maxAlloc_rm(i)=(irmdmnd(i)/totrmd)*rmr; 
        pcost_rm=pcost_rm+maxAlloc_rm(i);
    end
end
 
 
minAlloc_rm=0;          % Lower Bound of Decision Variables
fprintf('Upper Limit Rescue Member:');
disp(maxAlloc_rm);
 
 
 
 
%% Calculating Allocation percentage
 
 
 
fprintf('\r\n\r\n\r\nCALCULATING ALLOCATABLE RESOURCES:\r\n'); 
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
fprintf('\r\nReserved food percentage for food = %0.2f',apfood);
totafood=(foodr*(100-apfood))/100;
fprintf('\r\nallocatable food in reserve = %0.2f\r\n',totafood);
 
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
fprintf('\r\nReserved water percentage for water = %0.2f',apwater);
totawater=(waterr*(100-apwater))/100;
fprintf('\r\nallocatable water in reserve = %0.2f\r\n',totawater);
 
 
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
fprintf('\r\nReserved cloth percentage for cloth = %0.2f',apcloth);
totacloth=(clothr*(100-apcloth))/100;
fprintf('\r\nallocatable cloth in reserve = %0.2f\r\n',totacloth);
 
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
fprintf('\r\nReserved medical equipment percentage for medical equipments = %0.2f',apme);
totame=(mer*(100-apme))/100;
fprintf('\r\nallocatable medical equipments in reserve = %0.2f\r\n',totame);
 
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
fprintf('\r\nReserved rescue member percentage for rescue member = %0.2f',aprm);
totarm=(rmr*(100-aprm))/100;
fprintf('\r\nallocatable rescue member in reserve = %0.2f\r\n',totarm);
 
 
VarSize=[1 s];                                     % Decision Variables Matrix Size
 
 
 
 
 
%% DE Parameters
 
MaxIt=200;       % Maximum Number of Iterations
 
nPop=20;         % Population Size
 
F=0.5; %F=input('\nF: ');%0.5;           % Mutation factor
 
%beta_min=0.2;   % Lower Bound of Scaling Factor
%beta_max=0.8;   % Upper Bound of Scaling Factor
 
pCR=0.6; %pCR=input('\npCR: ');0.6;         % Crossover Probability

x=sprintf('MF = %0.2f    CP = %0.2f',F,pCR);
 
%% Initialization
 fprintf('\n\nInitial Population:\n');
%food..............
var_food.Position=[];
var_food.Fitness=[];
fitnessValue_food=zeros(MaxIt,1);
 
bestAlloc_food.Fitness=inf;
 
pop_food=repmat(var_food,nPop,1);
 
 
%generating population
for i=1:(nPop-1)
    pop_food(i).Position=maxAlloc_food/i;
end
   %pop_food(1).Position=maxAlloc_food;
   %pop_food(2).Position=maxAlloc_food/2;
   %pop_food(3).Position=maxAlloc_food/3;
   %pop_food(4).Position=[min(maxAlloc_food),min(maxAlloc_food),min(maxAlloc_food),min(maxAlloc_food)];
   pop_food(nPop).Position(1:s)=min(maxAlloc_food);
 
 
for i=1:nPop
 
%     pop_food(i).Position=unifrnd(minAlloc_food,maxAlloc_food,VarSize);
    
    pop_food(i).Fitness=FitnessFunction(pop_food(i).Position,pcost_food,totafood);
    
    if pop_food(i).Fitness<bestAlloc_food.Fitness
        bestAlloc_food=pop_food(i);
    end
    fprintf('\nFood (%d) :',i);
    fprintf(' %0.0f',pop_food(i).Position);
    fprintf('\t\tFitness:%0.5f', pop_food(i).Fitness);
end
 
BestFitness_food=zeros(MaxIt,1);
 
 
 fprintf('\n\n');
 
 
%water................
var_water.Position=[];
var_water.Fitness=[];
fitnessValue_water=zeros(MaxIt,1);
 
bestAlloc_water.Fitness=inf;
 
pop_water=repmat(var_water,nPop,1);
 
%generating population
for i=1:(nPop-1)
    pop_water(i).Position=maxAlloc_water/i;
end
 %pop_water(1).Position=maxAlloc_water;
 %pop_water(2).Position=maxAlloc_water/2;
 %pop_water(3).Position=maxAlloc_water/3;
 %pop_water(4).Position=[min(maxAlloc_water),min(maxAlloc_water),min(maxAlloc_water),min(maxAlloc_water)];
 pop_water(nPop).Position(1:s)=min(maxAlloc_water);
 
for i=1:nPop
 
%     pop_water(i).Position=unifrnd(minAlloc_water,maxAlloc_water,VarSize);
    
    pop_water(i).Fitness=FitnessFunction(pop_water(i).Position,pcost_water,totawater);
    
    if pop_water(i).Fitness<bestAlloc_water.Fitness
        bestAlloc_water=pop_water(i);
    end
    fprintf('\nWater (%d) :',i);
    fprintf(' %0.0f',pop_water(i).Position);
    fprintf('\t\tFitness:%0.5f', pop_water(i).Fitness);
end
 
BestFitness_water=zeros(MaxIt,1);
 
 
 fprintf('\n\n');
 
%cloth.................
var_cloth.Position=[];
var_cloth.Fitness=[];
fitnessValue_cloth=zeros(MaxIt,1);
 
bestAlloc_cloth.Fitness=inf;
 
pop_cloth=repmat(var_cloth,nPop,1);
 
%generating population
for i=1:(nPop-1)
    pop_cloth(i).Position=maxAlloc_cloth/i;
end
 %pop_cloth(1).Position=maxAlloc_cloth;
 %pop_cloth(2).Position=maxAlloc_cloth/2;
 %pop_cloth(3).Position=maxAlloc_cloth/3;
 %pop_cloth(4).Position=[min(maxAlloc_cloth),min(maxAlloc_cloth),min(maxAlloc_cloth),min(maxAlloc_cloth)];
 pop_cloth(nPop).Position(1:s)=min(maxAlloc_cloth);
 
 
 
for i=1:nPop
 
%     pop_cloth(i).Position=unifrnd(minAlloc_cloth,maxAlloc_cloth,VarSize);
    
    pop_cloth(i).Fitness=FitnessFunction(pop_cloth(i).Position,pcost_cloth,totacloth);
    
    if pop_cloth(i).Fitness<bestAlloc_cloth.Fitness
        bestAlloc_cloth=pop_cloth(i);
    end
    fprintf('\nCloth (%d) :',i);
    fprintf(' %0.0f',pop_cloth(i).Position);
    fprintf('\t\tFitness:%0.5f', pop_cloth(i).Fitness);
end
 
BestFitness_cloth=zeros(MaxIt,1);
 
 fprintf('\n\n');
 
%medical equipments.................
var_me.Position=[];
var_me.Fitness=[];
fitnessValue_me=zeros(MaxIt,1);
 
bestAlloc_me.Fitness=inf;
 
pop_me=repmat(var_me,nPop,1);
 
%generating population
for i=1:(nPop-1)
    pop_me(i).Position=maxAlloc_me/i;
end
 %pop_me(1).Position=maxAlloc_me;
 %pop_me(2).Position=maxAlloc_me/2;
 %pop_me(3).Position=maxAlloc_me/3;
 %pop_me(4).Position=[min(maxAlloc_me),min(maxAlloc_me),min(maxAlloc_me),min(maxAlloc_me)];
 pop_me(nPop).Position(1:s)=min(maxAlloc_me);
 
 
for i=1:nPop
 
%     pop_me(i).Position=unifrnd(minAlloc_me,maxAlloc_me,VarSize);
    
    pop_me(i).Fitness=FitnessFunction(pop_me(i).Position,pcost_me,totame);
    
    if pop_me(i).Fitness<bestAlloc_me.Fitness
        bestAlloc_me=pop_me(i);
    end
    fprintf('\nME (%d) :',i);
    fprintf(' %0.0f',pop_me(i).Position);
    fprintf('\t\tFitness:%0.5f', pop_me(i).Fitness);
end
 
BestFitness_me=zeros(MaxIt,1);
 fprintf('\n\n');
%rescue member.................
var_rm.Position=[];
var_rm.Fitness=[];
fitnessValue_rm=zeros(MaxIt,1);
 
bestAlloc_rm.Fitness=inf;
 
pop_rm=repmat(var_rm,nPop,1);
 
%generating population
for i=1:(nPop-1)
    pop_rm(i).Position=maxAlloc_rm/i;
end
 %pop_rm(1).Position=maxAlloc_rm;
 %pop_rm(2).Position=maxAlloc_rm/2;
 %pop_rm(3).Position=maxAlloc_rm/3;
 %pop_rm(4).Position=[min(maxAlloc_rm),min(maxAlloc_rm),min(maxAlloc_rm),min(maxAlloc_rm)];
 pop_rm(nPop).Position(1:s)=min(maxAlloc_rm);
 
 
for i=1:nPop
 
%     pop_rm(i).Position=unifrnd(minAlloc_rm,maxAlloc_rm,VarSize);
    
    pop_rm(i).Fitness=FitnessFunction(pop_rm(i).Position,pcost_rm,totarm);
    
    if pop_rm(i).Fitness<bestAlloc_rm.Fitness
        bestAlloc_rm=pop_rm(i);
    end
    fprintf('\nRM (%d) :',i);
    fprintf(' %0.0f',pop_rm(i).Position);
    fprintf('\t\tFitness:%0.5f', pop_rm(i).Fitness);
end
 
BestFitness_rm=zeros(MaxIt,1);
 
 
 
 
 
%% DE Main Loop
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
for it=1:MaxIt
    fprintf('\n\n\n\nItiration:%d:',it);
    for i=1:nPop
        
        %food................
        
        x_food=pop_food(i).Position;
        
        A_food=randperm(nPop);
        
        A_food(A_food==i)=[];
        
        a_food=A_food(1);
        b_food=A_food(2);
        c_food=A_food(3);
        
        % Mutation
        %beta=unifrnd(beta_min,beta_max);
        %beta=unifrnd(beta_min,beta_max,VarSize);
        y_food=pop_food(a_food).Position+F.*(pop_food(b_food).Position-pop_food(c_food).Position);
        y_food = max(y_food, minAlloc_food);
        y_food = min(y_food, maxAlloc_food);
        
        % Crossover
        z_food=zeros(size(x_food));
        j0=randi([1 numel(x_food)]);
        for j=1:numel(x_food)
            if j==j0 || rand<=pCR
                z_food(j)=y_food(j);
            else
                z_food(j)=x_food(j);
            end
        end
        
        nweAlloc_food.Position=z_food;
        nweAlloc_food.Fitness=FitnessFunction(nweAlloc_food.Position,pcost_food,totafood);
        fitnessValue_food(it)=nweAlloc_food.Fitness;
        
        if nweAlloc_food.Fitness<pop_food(i).Fitness
            pop_food(i)=nweAlloc_food;
            
            if pop_food(i).Fitness<bestAlloc_food.Fitness
               bestAlloc_food=pop_food(i);
            end
        end
        
        
        fprintf('\nIt %d particle-%d (Food): ',it,i);
        fprintf(' %0.0f',pop_food(i).Position);
        fprintf('\t\tfitness: %0.5f',pop_food(i).Fitness);
     
    end
    if isequal(round(pop_food(1).Fitness,5),round(pop_food(2).Fitness,5),round(pop_food(3).Fitness,5),round(pop_food(4).Fitness,5)) && set_food==0
        cp_food=it;
        fprintf('\r\n****************************FOOD particles have converged********************************');
        %fprintf('\r\n\r\n\r\n');
        %xyz=input('');
        set_food=1;
    end
    fprintf('\n\n');
    
    
    
    
    for i=1:nPop
        
        %water................
        
        x_water=pop_water(i).Position;
        
        A_water=randperm(nPop);
        
        A_water(A_water==i)=[];
        
        a_water=A_water(1);
        b_water=A_water(2);
        c_water=A_water(3);
        
        % Mutation
        %beta=unifrnd(beta_min,beta_max);
        %beta=unifrnd(beta_min,beta_max,VarSize);
        y_water=pop_water(a_water).Position+F.*(pop_water(b_water).Position-pop_water(c_water).Position);
        y_water = max(y_water, minAlloc_water);
        y_water = min(y_water, maxAlloc_water);
        
        % Crossover
        z_water=zeros(size(x_water));
        j0=randi([1 numel(x_water)]);
        for j=1:numel(x_water)
            if j==j0 || rand<=pCR
                z_water(j)=y_water(j);
            else
                z_water(j)=x_water(j);
            end
        end
        
        nweAlloc_water.Position=z_water;
        nweAlloc_water.Fitness=FitnessFunction(nweAlloc_water.Position,pcost_water,totawater);
        fitnessValue_water(it)=nweAlloc_water.Fitness;
        
        if nweAlloc_water.Fitness<pop_water(i).Fitness
            pop_water(i)=nweAlloc_water;
            
            if pop_water(i).Fitness<bestAlloc_water.Fitness
               bestAlloc_water=pop_water(i);
            end
        end
        
        
        fprintf('\nIt %d particle-%d (Water): ',it,i);
        fprintf(' %0.0f',pop_water(i).Position);
        fprintf('\t\tfitness: %0.5f',pop_water(i).Fitness);
     
    end
    
    if isequal(round(pop_water(1).Fitness,5),round(pop_water(2).Fitness,5),round(pop_water(3).Fitness,5),round(pop_water(4).Fitness,5)) && set_water==0
        cp_water=it;
        fprintf('\r\n****************************WATER particles have converged********************************');
        %fprintf('\r\n\r\n\r\n');
        %xyz=input('');
        set_water=1;
    end
    
    fprintf('\n\n');
    for i=1:nPop 
        %cloth.................
 
        x_cloth=pop_cloth(i).Position;
        
        A_cloth=randperm(nPop);
        
        A_cloth(A_cloth==i)=[];
        
        a_cloth=A_cloth(1);
        b_cloth=A_cloth(2);
        c_cloth=A_cloth(3);

        % Mutation
        %beta=unifrnd(beta_min,beta_max);
        %beta=unifrnd(beta_min,beta_max,VarSize);
        y_cloth=pop_cloth(a_cloth).Position+F.*(pop_cloth(b_cloth).Position-pop_cloth(c_cloth).Position);
        y_cloth = max(y_cloth, minAlloc_cloth);
        y_cloth = min(y_cloth, maxAlloc_cloth);
        % Crossover
        z_cloth=zeros(size(x_cloth));
        j0=randi([1 numel(x_cloth)]);
        for j=1:numel(x_cloth)
            if j==j0 || rand<=pCR
                z_cloth(j)=y_cloth(j);
            else
                z_cloth(j)=x_cloth(j);
            end
        end
        
        nweAlloc_cloth.Position=z_cloth;
        nweAlloc_cloth.Fitness=FitnessFunction(nweAlloc_cloth.Position,pcost_cloth,totacloth);
        fitnessValue_cloth(it)=nweAlloc_cloth.Fitness;
        
        if nweAlloc_cloth.Fitness<pop_cloth(i).Fitness
            pop_cloth(i)=nweAlloc_cloth;
            
            if pop_cloth(i).Fitness<bestAlloc_cloth.Fitness
               bestAlloc_cloth=pop_cloth(i);
            end
        end

        fprintf('\nIt %d particle-%d (Cloth): ',it,i);
        fprintf(' %0.0f',pop_cloth(i).Position);
        fprintf('\t\tfitness: %0.5f',pop_cloth(i).Fitness);
   
    end    
    if isequal(round(pop_cloth(1).Fitness,5),round(pop_cloth(2).Fitness,5),round(pop_cloth(3).Fitness,5),round(pop_cloth(4).Fitness,5)) && set_cloth==0
        cp_cloth=it;
        fprintf('\r\n****************************CLOTH particles have converged********************************');
        %fprintf('\r\n\r\n\r\n');
        %xyz=input('');
        set_cloth=1;
    end
    
    
    fprintf('\n\n');
    for i=1:nPop 
        %medical equipments.................
 
        x_me=pop_me(i).Position;
        
        A_me=randperm(nPop);
        
        A_me(A_me==i)=[];
        
        a_me=A_me(1);
        b_me=A_me(2);
        c_me=A_me(3);
        
        % Mutation
        %beta=unifrnd(beta_min,beta_max);
        %beta=unifrnd(beta_min,beta_max,VarSize);
        y_me = pop_me(a_me).Position+F.*(pop_me(b_me).Position-pop_me(c_me).Position);
        y_me = max(y_me, minAlloc_me);
        y_me = min(y_me, maxAlloc_me);
        
        % Crossover
        z_me=zeros(size(x_me));
        j0=randi([1 numel(x_me)]);
        for j=1:numel(x_me)
            if j==j0 || rand<=pCR
                z_me(j)=y_me(j);
            else
                z_me(j)=x_me(j);
            end
        end
        
        nweAlloc_me.Position=z_me;
        nweAlloc_me.Fitness=FitnessFunction(nweAlloc_me.Position,pcost_me,totame);
        fitnessValue_me(it)=nweAlloc_me.Fitness;
        
        if nweAlloc_me.Fitness<pop_me(i).Fitness
            pop_me(i)=nweAlloc_me;
            
            if pop_me(i).Fitness<bestAlloc_me.Fitness
               bestAlloc_me=pop_me(i);
            end
        end
        
        if isequal(round(pop_me(1).Fitness,5),round(pop_me(2).Fitness,5),round(pop_me(3).Fitness,5),round(pop_me(4).Fitness,5)) && set_me==0
            cp_me=it;
            fprintf('\r\n****************************ME particles have converged********************************');
            %fprintf('\r\n\r\n\r\n');
            %xyz=input('');
            set_me=1;
        end
       
        fprintf('\nIt %d particle-%d (Medical Equipments): ',it,i);
        fprintf(' %0.0f',pop_me(i).Position);
        fprintf('\t\tfitness: %0.5f',pop_me(i).Fitness);
       
    end
    
    
    
    fprintf('\n\n');
    for i=1:nPop
        %rescue member.................
        x_rm=pop_rm(i).Position;
        
        A_rm=randperm(nPop);
        
        A_rm(A_rm==i)=[];
        
        a_rm=A_rm(1);
        b_rm=A_rm(2);
        c_rm=A_rm(3);
        
        % Mutation
        %beta=unifrnd(beta_min,beta_max);
        %beta=unifrnd(beta_min,beta_max,VarSize);
        y_rm =pop_rm(a_rm).Position+F.*(pop_rm(b_rm).Position-pop_rm(c_rm).Position);
        y_rm = max(y_rm, minAlloc_rm);
        y_rm = min(y_rm, maxAlloc_rm);
        
        % Crossover
        z_rm=zeros(size(x_rm));
        j0=randi([1 numel(x_rm)]);
        for j=1:numel(x_rm)
            if j==j0 || rand<=pCR
                z_rm(j)=y_rm(j);
            else
                z_rm(j)=x_rm(j);
            end
        end
        
        nweAlloc_rm.Position=z_rm;
        nweAlloc_rm.Fitness=FitnessFunction(nweAlloc_rm.Position,pcost_rm,totarm);
        fitnessValue_rm(it)=nweAlloc_rm.Fitness;
        
        if nweAlloc_rm.Fitness<pop_rm(i).Fitness
            pop_rm(i)=nweAlloc_rm;
            
            if pop_rm(i).Fitness<bestAlloc_rm.Fitness
               bestAlloc_rm=pop_rm(i);
            end
        end
        
        fprintf('\nIt %d particle-%d (Rescue Members): ',it,i);
        fprintf(' %0.0f',pop_rm(i).Position);
        fprintf('\t\tfitness: %0.5f',pop_rm(i).Fitness);
    end
    if isequal(round(pop_rm(1).Fitness,5),round(pop_rm(2).Fitness,5),round(pop_rm(3).Fitness,5),round(pop_rm(4).Fitness,5)) && set_rm==0
        cp_rm=it;
        fprintf('\r\n****************************RM particles have converged********************************');
        %fprintf('\r\n\r\n\r\n');
        %xyz=input('');
        set_rm=1;
    end   
    
       
 
        
    
    % Update Best Fitness Value
    BestFitness_food(it)=bestAlloc_food.Fitness;    %food
    BestFitness_water(it)=bestAlloc_water.Fitness;  %water
    BestFitness_cloth(it)=bestAlloc_cloth.Fitness;  %cloth
    BestFitness_me(it)=bestAlloc_me.Fitness;        %medical equipment  
    BestFitness_rm(it)=bestAlloc_rm.Fitness;        %rescue member
    
    
    
    
end
        
%% Result
fn=sprintf('%s---Result.txt',x);
f=fopen(fn,'a');
% fprintf(f,'%s',x);
fprintf('RESULT:\n.........\n\n                                    alocation\n                              [ a1   a2   a3   a4   a5   a6   a7   a8   a9   a10 ]\n');
fprintf(f,'\n\n\n\r\n\r\nRESULT:\n   for   %s\r\n\r\n                                    alocation\r\n                              [ a1   a2   a3   a4   a5   a6   a7   a8   a9   a10 ]\r\n\r\n',x);
% fprintf(f,'\r\n\r\n\r\n________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________\r\n\r\n\r\n\t\t\t\t\t%s\t\t%s\t\t%s\r\n',x,y,z);

%FOOD...................................
fprintf('\n            Food:               ');
fprintf('%0.0f   ',round(pop_food(1).Position));
fprintf('\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_food(1).Position)),cp_food,round(pop_food(1).Fitness,5),totfoodd,round(((sum(pop_food(1).Position))*100)/totfoodd),pcost_food,round(((sum(pop_food(1).Position))*100)/pcost_food),totafood,round(((sum(pop_food(1).Position))*100)/totafood));

fprintf(f,'\n            Food:               ');
fprintf(f,'%0.0f   ',round(pop_food(1).Position));
fprintf(f,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_food(1).Position)),cp_food,round(pop_food(1).Fitness,5),totfoodd,round(((sum(pop_food(1).Position))*100)/totfoodd),pcost_food,round(((sum(pop_food(1).Position))*100)/pcost_food),totafood,round(((sum(pop_food(1).Position))*100)/totafood));


%WATER...................
fprintf('\n\n            Water:              ');
fprintf('%0.0f   ',round(pop_water(1).Position));
fprintf('\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_water(1).Position)),cp_water,round(pop_water(1).Fitness,5),totwaterd,round(((sum(pop_water(1).Position))*100)/totwaterd),pcost_water,round(((sum(pop_water(1).Position))*100)/pcost_water),totawater,round(((sum(pop_water(1).Position))*100)/totawater));

fprintf(f,'\r\n\r\n            Water:              ');
fprintf(f,'%0.0f   ',round(pop_water(1).Position));
fprintf(f,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_water(1).Position)),cp_water,round(pop_water(1).Fitness,5),totwaterd,round(((sum(pop_water(1).Position))*100)/totwaterd),pcost_water,round(((sum(pop_water(1).Position))*100)/pcost_water),totawater,round(((sum(pop_water(1).Position))*100)/totawater));


%CLOTH...................
fprintf('\n\n            Cloth:              ');
fprintf('%0.0f   ',round(pop_cloth(1).Position));
fprintf('\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_cloth(1).Position)),cp_cloth,round(pop_cloth(1).Fitness,5),totclothd,round(((sum(pop_cloth(1).Position))*100)/totclothd),pcost_cloth,round(((sum(pop_cloth(1).Position))*100)/pcost_cloth),totacloth,round(((sum(pop_cloth(1).Position))*100)/totacloth));

fprintf(f,'\r\n\r\n            Cloth:              ');
fprintf(f,'%0.0f   ',round(pop_cloth(1).Position));
fprintf(f,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_cloth(1).Position)),cp_cloth,round(pop_cloth(1).Fitness,5),totclothd,round(((sum(pop_cloth(1).Position))*100)/totclothd),pcost_cloth,round(((sum(pop_cloth(1).Position))*100)/pcost_cloth),totacloth,round(((sum(pop_cloth(1).Position))*100)/totacloth));


%ME...................
fprintf('\n\n            Medical Equipments: ');
fprintf('%0.0f   ',round(pop_me(1).Position));
fprintf('\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_me(1).Position)),cp_me,round(pop_me(1).Fitness,5),totmed,round(((sum(pop_me(1).Position))*100)/totmed),pcost_me,round(((sum(pop_me(1).Position))*100)/pcost_me),totame,round(((sum(pop_me(1).Position))*100)/totame));

fprintf(f,'\r\n\r\n            Medical Equipments: ');
fprintf(f,'%0.0f   ',round(pop_me(1).Position));
fprintf(f,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_me(1).Position)),cp_me,round(pop_me(1).Fitness,5),totmed,round(((sum(pop_me(1).Position))*100)/totmed),pcost_me,round(((sum(pop_me(1).Position))*100)/pcost_me),totame,round(((sum(pop_me(1).Position))*100)/totame));


%RM...................
fprintf('\n\n            Rescue Members:    	');
fprintf('%0.0f    ',round(pop_rm(1).Position));
fprintf('\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_rm(1).Position)),cp_rm,round(pop_rm(1).Fitness,5),totrmd,round(((sum(pop_rm(1).Position))*100)/totrmd),pcost_rm,round(((sum(pop_rm(1).Position))*100)/pcost_rm),totarm,round(((sum(pop_rm(1).Position))*100)/totarm));

fprintf(f,'\r\n\r\n            Rescue Members:    	');
fprintf(f,'%0.0f    ',round(pop_rm(1).Position));
fprintf(f,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_rm(1).Position)),cp_rm,round(pop_rm(1).Fitness,5),totrmd,round(((sum(pop_rm(1).Position))*100)/totrmd),pcost_rm,round(((sum(pop_rm(1).Position))*100)/pcost_rm),totarm,round(((sum(pop_rm(1).Position))*100)/totarm));
fprintf(f,'\r\n\r\n\r\n');
fclose(f);
%% Show Results
 
figure;plot(fitnessValue_food,'r','LineWidth', 1)
title('Itiration vs Fitness'),xlabel('Itiration'),ylabel('Fitness')
hold on; plot(fitnessValue_water,'g','LineWidth', 1);plot(fitnessValue_cloth,'b','LineWidth', 1);plot(fitnessValue_me,'y','LineWidth', 1);plot(fitnessValue_rm,'m','LineWidth', 1); hold off;
legend('Food','Water','Cloth','Medical Equipments','Rescue Member')
 
fprintf('\r\n\r\n\r\n');
xyz=input('');
end
