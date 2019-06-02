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
s=10;%r  s=input('How many sites? ');

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
    %Area:11
    ifdmnd(11) = 120 ;
    iwdmnd(11) = 60;
    icdmnd(11) = 50;
    imedmnd(11)= 60;
    irmdmnd(11)= 20;
    %Area:12
    ifdmnd(12) = 60;
    iwdmnd(12) = 22;
    icdmnd(12) = 41;
    imedmnd(12)= 100;
    irmdmnd(12)= 25;
    %Area:13
    ifdmnd(13) = 40;
    iwdmnd(13) = 100;
    icdmnd(13) = 45;
    imedmnd(13)= 70;
    irmdmnd(13)= 20;
    %Area:14
    ifdmnd(14) = 60;
    iwdmnd(14) = 90;
    icdmnd(14) = 57;
    imedmnd(14)= 75;
    irmdmnd(14)= 5;

    %Area:15
    ifdmnd(15) = 56;
    iwdmnd(15) = 25;
    icdmnd(15) = 46;
    imedmnd(15)= 50;
    irmdmnd(15)= 12;

    %Area:16
    ifdmnd(16) =65 ;
    iwdmnd(16) =20 ;
    icdmnd(16) =57 ;
    imedmnd(16)=54 ;
    irmdmnd(16)=10 ;

    
    %Area:17
    ifdmnd(17) =70 ;
    iwdmnd(17) =25 ;
    icdmnd(17) =50 ;
    imedmnd(17)=67 ;
    irmdmnd(17)=5 ;
 
    %Area:18
    ifdmnd(18) =75 ;
    iwdmnd(18) =30 ;
    icdmnd(18) =16 ;
    imedmnd(18)=90 ;
    irmdmnd(18)=50 ;
    
    %Area:19
    ifdmnd(19) =90 ;
    iwdmnd(19) =25 ;
    icdmnd(19) =5 ;
    imedmnd(19)=69 ;
    irmdmnd(19)=11 ;
    
    %Area:20
    ifdmnd(20) =29 ;
    iwdmnd(20) =25 ;
    icdmnd(20) =34 ;
    imedmnd(20)=10 ;
    irmdmnd(20)=2 ;
    
    %Area:21
    ifdmnd(21) = 120 ;
    iwdmnd(21) = 60;
    icdmnd(21) = 50;
    imedmnd(21)= 60;
    irmdmnd(21)= 20;
    %Area:22
    ifdmnd(22) = 60;
    iwdmnd(22) = 22;
    icdmnd(22) = 41;
    imedmnd(22)= 100;
    irmdmnd(22)= 25;
    %Area:23
    ifdmnd(23) = 40;
    iwdmnd(23) = 100;
    icdmnd(23) = 45;
    imedmnd(23)= 70;
    irmdmnd(23)= 20;
    %Area:24
    ifdmnd(24) = 60;
    iwdmnd(24) = 90;
    icdmnd(24) = 57;
    imedmnd(24)= 75;
    irmdmnd(24)= 5;

    %Area:25
    ifdmnd(25) = 56;
    iwdmnd(25) = 25;
    icdmnd(25) = 46;
    imedmnd(25)= 50;
    irmdmnd(25)= 12;

    %Area:26
    ifdmnd(26) =65 ;
    iwdmnd(26) =20 ;
    icdmnd(26) =57 ;
    imedmnd(26)=54 ;
    irmdmnd(26)=10 ;

    
    %Area:27
    ifdmnd(27) =70 ;
    iwdmnd(27) =25 ;
    icdmnd(27) =50 ;
    imedmnd(27)=67 ;
    irmdmnd(27)=5 ;
 
    %Area:28
    ifdmnd(28) =75 ;
    iwdmnd(28) =30 ;
    icdmnd(28) =16 ;
    imedmnd(28)=90 ;
    irmdmnd(28)=50 ;
    
    %Area:29
    ifdmnd(29) =90 ;
    iwdmnd(29) =25 ;
    icdmnd(29) =5 ;
    imedmnd(29)=69 ;
    irmdmnd(29)=11 ;
    
    %Area:30
    ifdmnd(30) =29 ;
    iwdmnd(30) =25 ;
    icdmnd(30) =34 ;
    imedmnd(30)=10 ;
    irmdmnd(30)=2 ;
    
    %Area:31
    ifdmnd(31) = 120 ;
    iwdmnd(31) = 60;
    icdmnd(31) = 50;
    imedmnd(31)= 60;
    irmdmnd(31)= 20;
    %Area:32
    ifdmnd(32) = 60;
    iwdmnd(32) = 22;
    icdmnd(32) = 41;
    imedmnd(32)= 100;
    irmdmnd(32)= 25;
    %Area:33
    ifdmnd(33) = 40;
    iwdmnd(33) = 100;
    icdmnd(33) = 45;
    imedmnd(33)= 70;
    irmdmnd(33)= 20;
    %Area:34
    ifdmnd(34) = 60;
    iwdmnd(34) = 90;
    icdmnd(34) = 57;
    imedmnd(34)= 75;
    irmdmnd(34)= 5;

    %Area:35
    ifdmnd(35) = 56;
    iwdmnd(35) = 25;
    icdmnd(35) = 46;
    imedmnd(35)= 50;
    irmdmnd(35)= 12;

    %Area:36
    ifdmnd(36) =65 ;
    iwdmnd(36) =20 ;
    icdmnd(36) =57 ;
    imedmnd(36)=54 ;
    irmdmnd(36)=10 ;

    
    %Area:37
    ifdmnd(37) =70 ;
    iwdmnd(37) =25 ;
    icdmnd(37) =50 ;
    imedmnd(37)=67 ;
    irmdmnd(37)=5 ;
 
    %Area:38
    ifdmnd(38) =75 ;
    iwdmnd(38) =30 ;
    icdmnd(38) =16 ;
    imedmnd(38)=90 ;
    irmdmnd(38)=50 ;
    
    %Area:39
    ifdmnd(39) =90 ;
    iwdmnd(39) =25 ;
    icdmnd(39) =5 ;
    imedmnd(39)=69 ;
    irmdmnd(39)=11 ;
    
    %Area:40
    ifdmnd(40) =29 ;
    iwdmnd(40) =25 ;
    icdmnd(40) =34 ;
    imedmnd(40)=10 ;
    irmdmnd(40)=2 ;
    
    %Area:41
    ifdmnd(41) = 120 ;
    iwdmnd(41) = 60;
    icdmnd(41) = 50;
    imedmnd(41)= 60;
    irmdmnd(41)= 20;
    %Area:42
    ifdmnd(42) = 60;
    iwdmnd(42) = 22;
    icdmnd(42) = 41;
    imedmnd(42)= 100;
    irmdmnd(42)= 25;
    %Area:43
    ifdmnd(43) = 40;
    iwdmnd(43) = 100;
    icdmnd(43) = 45;
    imedmnd(43)= 70;
    irmdmnd(43)= 20;
    %Area:44
    ifdmnd(44) = 60;
    iwdmnd(44) = 90;
    icdmnd(44) = 57;
    imedmnd(44)= 75;
    irmdmnd(44)= 5;

    %Area:45
    ifdmnd(45) = 56;
    iwdmnd(45) = 25;
    icdmnd(45) = 46;
    imedmnd(45)= 50;
    irmdmnd(45)= 12;

    %Area:46
    ifdmnd(46) =65 ;
    iwdmnd(46) =20 ;
    icdmnd(46) =57 ;
    imedmnd(46)=54 ;
    irmdmnd(46)=10 ;

    
    %Area:47
    ifdmnd(47) =70 ;
    iwdmnd(47) =25 ;
    icdmnd(47) =50 ;
    imedmnd(47)=67 ;
    irmdmnd(47)=5 ;
 
    %Area:48
    ifdmnd(48) =75 ;
    iwdmnd(48) =30 ;
    icdmnd(48) =16 ;
    imedmnd(48)=90 ;
    irmdmnd(48)=50 ;
    
    %Area:49
    ifdmnd(49) =90 ;
    iwdmnd(49) =25 ;
    icdmnd(49) =5 ;
    imedmnd(49)=69 ;
    irmdmnd(49)=11 ;
    
    %Area:50
    ifdmnd(50) =29 ;
    iwdmnd(50) =25 ;
    icdmnd(50) =34 ;
    imedmnd(50)=10 ;
    irmdmnd(50)=2 ;

%}




    %calculating total..................
    totfoodd=sum(ifdmnd);
    totwaterd=sum(iwdmnd);
    totclothd=sum(icdmnd);
    totmed=sum(imedmnd);
    totrmd=sum(irmdmnd);
    


%% PSO Parameters

MaxIt=200;       % Maximum Number of Iterations

nPop=20;         % Population Size

r1=0.4;

r2=0.6;
%{
w=0.6;
wf=w;
wi=w;
wmax=0.9;
wmin=0.3;
c1=0.8;
c1f=c1;
c1i=c1;
c1max=2.0;
c1min=0.0;
c2=1.2;
c2f=c2;
c2i=c2;
c2max=2.0;
c2min=0.0;
w=0.6;
c1=0.8;
c2=1.2;
%}



%% Options

    fprintf('Enter variation to be used: \r\n 1)  PSO with constant w, constant c1 and constant c2.');
    fprintf('\n2)  PSO with constant w, constant c1 and linearly increasing c2.');
    fprintf('\n3)  PSO with constant w, constant c1 and linearly decreasing c2.');
    fprintf('\n4)  PSO with constant w, linearly increasing c1 and constant c2.');
    fprintf('\n5)  PSO with constant w, linearly increasing c1 and linearly increasing c2.');
    fprintf('\n6)  PSO with constant w, linearly increasing c1 linearly decreasing and c2.');
    fprintf('\n7)  PSO with constant w, linearly decreasing c1 and constant c2.');
    fprintf('\n8)  PSO with constant w, linearly decreasing c1 and linearly increasing c2.');
    fprintf('\n9)  PSO with constant w, linearly decreasing c1 and linearly decreasing c2.');
    fprintf('\n10) PSO with linearly increasing w, constant c1 and constant  c2.');
    fprintf('\n11) PSO with linearly increasing w, constant c1 and linearly increasing c2.');
    fprintf('\n12) PSO with linearly increasing w, constant c1 and linearly decreasing c2.');
    fprintf('\n13) PSO with linearly increasing w, linearly increasing c1 and constant c2.');
    fprintf('\n14) PSO with linearly increasing w, linearly increasing c1 and linearly increasing c2.');
    fprintf('\n15) PSO with linearly increasing w, linearly increasing c1 linearly decreasing and c2.');
    fprintf('\n16) PSO with linearly increasing w, linearly decreasing c1 and constant c2.');
    fprintf('\n17) PSO with linearly increasing w, linearly decreasing c1 and linearly increasing c2.');
    fprintf('\n18) PSO with linearly increasing w, linearly decreasing c1 and linearly decreasing c2.');
    fprintf('\n19) PSO with linearly decreasing w, constant c1 and constant c2.');
    fprintf('\n20) PSO with linearly decreasing w, constant c1 and linearly increasing c2.');
    fprintf('\n21) PSO with linearly decreasing w, constant c1 and linearly decreasing c2.');
    fprintf('\n22) PSO with linearly decreasing w, linearly increasing c1 and constant c2.');
    fprintf('\n23) PSO with linearly decreasing w, linearly increasing c1 and linearly increasing c2.');
    fprintf('\n24) PSO with linearly decreasing w, linearly increasing c1 linearly decreasing and c2.');
    fprintf('\n25) PSO with linearly decreasing w, linearly decreasing c1 and constant c2.');
    fprintf('\n26) PSO with linearly decreasing w, linearly decreasing c1 and linearly increasing c2.');
    fprintf('\n27) PSO with linearly decreasing w, linearly decreasing c1 and linearly decreasing c2.');
    fprintf('\nPRESS 0 to quite');

    choice = 1; %choice = input('\nEnter your choice:');
    if choice==1
           o=sprintf('PSO with constant w, constant c1 and constant c2.');
           w = 0.2;%w = input('\nEnter Value of w:');
                 wi=w;
                 wf=w;
                 c1 = 0.4;%c1= input('\nEnter Value of c1:');
                 c1i=c1;
                 c1f=c1;
                 c2 = 1.6;%c2 = input('\nEnter Value of c2:');
                 c2i=c2;
                 c2f=c2;
    elseif choice==2
           o=sprintf('PSO with constant w, constant c1 and linearly increasing c2.');
           w=input('\nEnter Value of w:');
                 wi=w;
                 wf=w;
                 c1=input('\nEnter Value of c1:');
                 c1i=c1;
                 c1f=c1;
                 c2i=0.0;%input('\nEnter Initial Value of c2:');
                 c2f=2.0;%input('\nEnter Final Value of c2:');
                 c2=c2i;
    elseif choice==3
            o=sprintf('PSO with constant w, constant c1 and linearly decreasing c2.');
            w=input('\nEnter Value of w:');
                 wi=w;
                 wf=w;
                 c1=input('\nEnter Value of c1:');
                 c1i=c1;
                 c1f=c1;
                 c2i=2.0;%input('\nEnter Initial Value of c2:');
                 c2f=0.0;%input('\nEnter Final Value of c2:');
                 c2=c2i;      
    elseif choice==4
            o=sprintf('PSO with constant w, linearly increasing c1 and constant c2.');
            w=input('\nEnter Value of w:');
                 wi=w;
                 wf=w;
                 c1i=0.0;%input('\nEnter Initial Value of c1:');
                 c1f=2.0;%input('\nEnter Final Value of c1:');
                 c1=c1i;
                 c2=input('\nEnter Value of c2:');
                 c2i=c2;
                 c2f=c2;
    elseif choice==5 
            o=sprintf('PSO with constant w, linearly increasing c1 and linearly increasing c2.');
            w=input('\nEnter Value of w:');
                 wi=w;
                 wf=w;
                 c1i=0.0;%input('\nEnter Initial Value of c1:');
                 c1f=2.0;%input('\nEnter Final Value of c1:');;
                 c1=c1i;
                 c2i=0.0;%input('\nEnter Initial Value of c2:');
                 c2f=2.0;%input('\nEnter Final Value of c2:');
                 c2=c2i;
    elseif choice==6
            o=sprintf('PSO with constant w, linearly increasing c1 linearly decreasing and c2.');
            w=input('\nEnter Value of w:');
                 wi=w;
                 wf=w;
                 c1i=0.0;%input('\nEnter Initial Value of c1:');
                 c1f=2.0;%input('\nEnter Final Value of c1:');
                 c1=c1i;
                 c2i=2.0;%input('\nEnter Initial Value of c2:');
                 c2f=0.0;%input('\nEnter Final Value of c2:');
                 c2=c2i;
    elseif choice==7
            o=sprintf('PSO with constant w, linearly decreasing c1 and constant c2.');
            w=input('\nEnter Value of w:');
                 wi=w;
                 wf=w;
                 c1i=2.0;%input('\nEnter Initial Value of c1:');
                 c1f=0.0;%input('\nEnter Final Value of c1:');
                 c1=c1i;
                 c2=input('\nEnter Value of c2:');
                 c2i=c2;
                 c2f=c2;
    elseif choice==8
            o=sprintf('PSO with constant w, linearly decreasing c1 and linearly increasing c2.');
            w=input('\nEnter Value of w:');
                 wi=w;
                 wf=w;
                 c1i=2.0;%input('\nEnter Initial Value of c1:');
                 c1f=0.0;%input('\nEnter Final Value of c1:');
                 c1=c1i;
                 c2i=0.0;%input('\nEnter Initial Value of c2:');
                 c2f=2.0;%input('\nEnter Final Value of c2:');
                 c2=c2i;
    elseif choice==9
            o=sprintf('PSO with constant w, linearly decreasing c1 and linearly decreasing c2.');
            w=input('\nEnter Value of w:');
                 wi=w;
                 wf=w;
                 c1i=2.0;%input('\nEnter Initial Value of c1:');
                 c1f=0.0;%input('\nEnter Final Value of c1:');
                 c1=c1i;
                 c2i=2.0;%input('\nEnter Initial Value of c2:');
                 c2f=0.0;%input('\nEnter Final Value of c2:');;
                 c2=c2i;
    elseif choice==10
            o=sprintf('PSO with linearly increasing w, constant c1 and constant  c2.');
            wi=0.0;%input('\nEnter Initial Value of w:');
                 wf=0.9;%input('\nEnter Final Value of w:');
                 w=wi;
                 c1=input('\nEnter Value of c1:');
                 c1i=c1;
                 c1f=c1;
                 c2=input('\nEnter Value of c2:');
                 c2i=c2;
                 c2f=c2;
    elseif choice==11
            o=sprintf('PSO with linearly increasing w, constant c1 and linearly increasing c2.');
            wi=0.0;%input('\nEnter Initial Value of w:');
                 wf=0.9;%input('\nEnter Final Value of w:');
                 w=wi;
                 c1=input('\nEnter Value of c1:');
                 c1i=c1;
                 c1f=c1;
                 c2i=0.0;%input('\nEnter Initial Value of c2:');
                 c2f=2.0;%input('\nEnter Final Value of c2:');
                 c2=c2i;
    elseif choice==12 
            o=sprintf('PSO with linearly increasing w, constant c1 and linearly decreasing c2.');
            wi=0.0;%input('\nEnter Initial Value of w:');
                 wf=0.9;%input('\nEnter Final Value of w:');
                 w=wi;
                 c1=input('\nEnter Value of c1:');
                 c1i=c1;
                 c1f=c1;
                 c2i=2.0;%input('\nEnter Initial Value of c2:');
                 c2f=0.0;%input('\nEnter Final Value of c2:');;
                 c2=c2i;
    elseif choice==13 
            o=sprintf('PSO with linearly increasing w, linearly increasing c1 and constant c2.');
            wi=0.0;%input('\nEnter Initial Value of w:');
                 wf=0.9;%input('\nEnter Final Value of w:');
                 w=wi;
                 c1i=0.0;%input('\nEnter Initial Value of c1:');
                 c1f=2.0;%input('\nEnter Final Value of c1:');
                 c1=c1i;
                 c2=input('\nEnter Value of c2:');
                 c2i=c2;
                 c2f=c2;
    elseif choice==14 
            o=sprintf('PSO with linearly increasing w, linearly increasing c1 and linearly increasing c2.');
            wi=input('\nEnter Initial Value of w:');
                 wf=input('\nEnter Final Value of w:');
                 w=wi;
                 c1i=0.0;%input('\nEnter Initial Value of c1:');
                 c1f=2.0;%input('\nEnter Final Value of c1:');
                 c1=c1i;
                 c2i=0.0;%input('\nEnter Initial Value of c2:');
                 c2f=2.0;%input('\nEnter Final Value of c2:');
                 c2=c2i;
    elseif choice==15 
            o=sprintf('PSO with linearly increasing w, linearly increasing c1 linearly decreasing and c2.');
            wi=input('\nEnter Initial Value of w:');
                 wf=input('\nEnter Final Value of w:');
                 w=wi;
                 c1i=0.0;%input('\nEnter Initial Value of c1:');
                 c1f=2.0;%input('\nEnter Final Value of c1:');
                 c1=c1i;
                 c2i=2.0;%input('\nEnter Initial Value of c2:');
                 c2f=0.0;%input('\nEnter Final Value of c2:');;
                 c2=c2i;
    elseif choice==16 
            o=sprintf('PSO with linearly increasing w, linearly decreasing c1 and constant c2.');
            wi=0.0;%input('\nEnter Initial Value of w:');
                 wf=0.9;%input('\nEnter Final Value of w:');
                 w=wi;
                 c1i=2.0;%input('\nEnter Initial Value of c1:');
                 c1f=0.0;%input('\nEnter Final Value of c1:');
                 c1=c1i;
                 c2=input('\nEnter Value of c2:');
                 c2i=c2;
                 c2f=c2;
    elseif choice==17 
            o=sprintf('PSO with linearly increasing w, linearly decreasing c1 and linearly increasing c2.');
            wi=input('\nEnter Initial Value of w:');
                 wf=input('\nEnter Final Value of w:');
                 w=wi;
                 c1i=2.0;%input('\nEnter Initial Value of c1:');
                 c1f=0.0;%input('\nEnter Final Value of c1:');
                 c1=c1i;
                 c2i=0.0;%input('\nEnter Initial Value of c2:');
                 c2f=2.0;%input('\nEnter Final Value of c2:');
                 c2=c2i;
    elseif choice==18 
            o=sprintf('PSO with linearly increasing w, linearly decreasing c1 and linearly decreasing c2.');
            wi=input('\nEnter Initial Value of w:');
                 wf=input('\nEnter Final Value of w:');
                 w=wi;
                 c1i=2.0;%input('\nEnter Initial Value of c1:');
                 c1f=0.0;%input('\nEnter Final Value of c1:');
                 c1=c1i;
                 c2i=2.0;%input('\nEnter Initial Value of c2:');
                 c2f=0.0;%input('\nEnter Final Value of c2:');;
                 c2=c2i;
    elseif choice==19 
            o=sprintf('PSO with linearly decreasing w, constant c1 and constant c2.');
            wi=0.9;%input('\nEnter Initial Value of w:');
                 wf=0.0;%input('\nEnter Final Value of w:');
                 w=wi;
                 c1=input('\nEnter Value of c1:');
                 c1i=c1;
                 c1f=c1;
                 c2=input('\nEnter Value of c2:');
                 c2i=c2;
                 c2f=c2;
    elseif choice==20 
            o=sprintf('PSO with linearly decreasing w, constant c1 and linearly increasing c2.');
            wi=0.9;%input('\nEnter Initial Value of w:');
                 wf=0.0;%input('\nEnter Final Value of w:');
                 w=wi;
                 c1=input('\nEnter Value of c1:');
                 c1i=c1;
                 c1f=c1;
                 c2i=0.0;%input('\nEnter Initial Value of c2:');
                 c2f=2.0;%input('\nEnter Final Value of c2:');
                 c2=c2i;
    elseif choice==21 
            o=sprintf('PSO with linearly decreasing w, constant c1 and linearly decreasing c2.');
            wi=0.9;%input('\nEnter Initial Value of w:');
                 wf=0.0;%input('\nEnter Final Value of w:');
                 w=wi;
                 c1=input('\nEnter Value of c1:');
                 c1i=c1;
                 c1f=c1;
                 c2i=2.0;%input('\nEnter Initial Value of c2:');
                 c2f=0.0;%input('\nEnter Final Value of c2:');;
                 c2=c2i;
    elseif choice==22 
            o=sprintf('PSO with linearly decreasing w, linearly increasing c1 and constant c2.');
            wi=0.9;%input('\nEnter Initial Value of w:');
                 wf=0.0;%input('\nEnter Final Value of w:');
                 w=wi;
                 c1i=0.0;%input('\nEnter Initial Value of c1:');
                 c1f=2.0;%input('\nEnter Final Value of c1:');
                 c1=c1i;
                 c2=input('\nEnter Value of c2:');
                 c2i=c2;
                 c2f=c2;
    elseif choice==23 
            o=sprintf('PSO with linearly decreasing w, linearly increasing c1 and linearly increasing c2.');
            wi=input('\nEnter Initial Value of w:');
                 wf=input('\nEnter Final Value of w:');
                 w=wi;
                 c1i=0.0;%input('\nEnter Initial Value of c1:');
                 c1f=2.0;%input('\nEnter Final Value of c1:');
                 c1=c1i;
                 c2i=0.0;%input('\nEnter Initial Value of c2:');
                 c2f=2.0;%input('\nEnter Final Value of c2:');
                 c2=c2i;
    elseif choice==24
            o=sprintf('PSO with linearly decreasing w, linearly increasing c1 linearly decreasing and c2.');
            wi=input('\nEnter Initial Value of w:');
                 wf=input('\nEnter Final Value of w:');
                 w=wi;
                 c1i=0.0;%input('\nEnter Initial Value of c1:');
                 c1f=2.0;%input('\nEnter Final Value of c1:');
                 c1=c1i;
                 c2i=2.0;%input('\nEnter Initial Value of c2:');
                 c2f=0.0;%input('\nEnter Final Value of c2:');;
                 c2=c2i;
    elseif choice==25 
            o=sprintf('PSO with linearly decreasing w, linearly decreasing c1 and constant c2.');
            wi=0.9;%input('\nEnter Initial Value of w:');
                 wf=0.0;%input('\nEnter Final Value of w:');
                 w=wi;
                 c1i=2.0;%input('\nEnter Initial Value of c1:');
                 c1f=0.0;%input('\nEnter Final Value of c1:');
                 c1=c1i;
                 c2=input('\nEnter Value of c2:');
                 c2i=c2;
                 c2f=c2;
    elseif choice==26 
            o=sprintf('PSO with linearly decreasing w, linearly decreasing c1 and linearly increasing c2.');
                 wi=0.4;%input('\nEnter Initial Value of w:');
                 wf=0.0;%input('\nEnter Final Value of w:');
                 w=wi;
                 c1i=2.0;%input('\nEnter Initial Value of c1:');
                 c1f=0.0;%input('\nEnter Final Value of c1:');
                 c1=c1i;
                 c2i=0.0;%input('\nEnter Initial Value of c2:');
                 c2f=2.0;%input('\nEnter Final Value of c2:');
                 c2=c2i;
    elseif choice==27 
            o=sprintf('PSO with linearly decreasing w, linearly decreasing c1 and linearly decreasing c2.');
            wi=input('\nEnter Initial Value of w:');
                 wf=input('\nEnter Final Value of w:');
                 w=wi;
                 c1i=2.0;%input('\nEnter Initial Value of c1:');
                 c1f=0.0;%input('\nEnter Final Value of c1:');
                 c1=c1i;
                 c2i=2.0;%input('\nEnter Initial Value of c2:');
                 c2f=0.0;%input('\nEnter Final Value of c2:');;
                 c2=c2i;
    elseif choice==0
            break;
    elseif choice>=28
            disp ('\nInvalid input');
    end
                 
 
    
    
    
if wi==wf
    x=sprintf('w = %0.2f',w);
else
    x=sprintf('w = %0.1f - %0.1f',wi,wf);
end

if c1i==c1f
    y=sprintf('c1 = %0.2f',c1);
else
    y=sprintf('c1 = %0.1f - %0.1f',c1i,c1f);
end

if c2i==c2f
    z=sprintf('c2 = %0.2f',c2);
else
    z=sprintf('c2 = %0.1f - %0.1f',c2i,c2f);
end

fn=sprintf('%s      %s      %s.txt',x,y,z);
fprintf('\n%d: %s      %s      %s',nmb,x,y,z);
nmb=nmb+1;
f=fopen(fn,'w');     %Opening File to save output
fprintf(f,'%s\r\n\r\n%s\t\t%s\t\t%s',o,x,y,z);
    
    
    
    
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
    
end


fprintf(f,'\r\nInitial best fitness: %0.2f   of particle : %d',a,b);
food_gbest.sol=pop_food(b).sol;
food_gbest.fitness=a;
fprintf(f,'\t\tgbest: ');
fprintf(f,'%0.0f   ',food_gbest.sol);

    
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
    
end


fprintf(f,'\r\nInitial best fitness: %0.2f   of particle : %d',a,b);
water_gbest.sol=pop_water(b).sol;
water_gbest.fitness=a;
fprintf(f,'\t\tgbest: ');
fprintf(f,'%0.0f   ',water_gbest.sol);


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
    
end


fprintf(f,'\r\nInitial best fitness: %0.2f   of particle : %d',a,b);
cloth_gbest.sol=pop_cloth(b).sol;
cloth_gbest.fitness=a;
fprintf(f,'\t\tgbest: ');
fprintf(f,'%0.0f   ',cloth_gbest.sol);


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
    
end


fprintf(f,'\r\nInitial best fitness: %0.2f   of particle : %d',a,b);
me_gbest.sol=pop_me(b).sol;
me_gbest.fitness=a;
fprintf(f,'\t\tgbest: ');
fprintf(f,'%0.0f   ',me_gbest.sol);


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
    
end


fprintf(f,'\r\nInitial best fitness: %0.2f   of particle : %d',a,b);
rm_gbest.sol=pop_rm(b).sol;
rm_gbest.fitness=a;
fprintf(f,'\t\tgbest: ');
fprintf(f,'%0.0f   ',rm_gbest.sol);
























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
    
for it=1:MaxIt
    
    fprintf(f,'\r\n\r\n\nITIRATION: %d--------------------------------------------------------------------w=%0.2f\tc1=%0.2f\tc2=%0.2f\r\n',it,w,c1,c2);
    
    %FOOD...................................
    tempf=[0,0,0,0,0];
    for i=1:nPop
        %{
        fprintf('\nmaxAlloc_food:');
        disp(maxAlloc_food);
        fprintf('\npbest_food:');
        disp(pop_food(i).pbest);
        fprintf('\ngbest_food:');
        disp(food_gbest.sol);
        fprintf('\nsol_food:');
        disp(pop_food(i).sol);
        %}
        maxAlloc_food = w*maxAlloc_food+c1*rand(1,1)*(pop_food(i).pbest-pop_food(i).sol)+c2*rand(1,1)*(food_gbest.sol-pop_food(i).sol);
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
%         plot_food(it,i)=pop_food(i).fitness;    %for plot
        
        fprintf(f,'\r\nIt %d particle-%d (Food): ',it,i);
        fprintf(f,'%0.0f  ',pop_food(i).sol);
        fprintf(f,'          Fitness : %0.12f',pop_food(i).fitness);
        tempf(i)=pop_food(i).fitness;
        if pop_food(i).fitness<pop_food(i).pbest_fitness
            pop_food(i).pbest_fitness=pop_food(i).fitness;
            pop_food(i).pbest=pop_food(i).sol;
            fprintf(f,'.......NEW PBEST');
            if pop_food(i).fitness<food_gbest.fitness
                food_gbest.fitness=pop_food(i).fitness;
                food_gbest.sol=pop_food(i).sol;
                fprintf(f,'.......NEW GBEST');
            end
        end
        pop_food(i).sol=pop_food(i).sol+maxAlloc_food;
%         pop_food(i).sol=max(pop_food(i).sol,minAlloc_food);
%         pop_food(i).sol=min(pop_food(i).sol,pdmd_food);
    end
    
    fprintf(f,'\r\n\r\ntempf fitness:');
    fprintf(f,' %0.12f',tempf);
    plot_food(it)=sum(tempf)/4;
    fprintf(f,'\r\n\r\nAvg fitness:');
    fprintf(f,' %0.12f',plot_food(it));
    
    %check if particles have converged or not
    %if isequal(pop_food(1).sol,pop_food(2).sol,pop_food(3).sol,pop_food(4).sol) && set_food==0
    if isequal(round(pop_food(1).fitness,5),round(pop_food(2).fitness,5),round(pop_food(3).fitness,5),round(pop_food(4).fitness,5)) && set_food==0
        cp_food=it;
        fprintf(f,'\r\n****************************FOOD particles have converged********************************');
        %fprintf('\r\n\r\n\r\n');
        %xyz=input('');
        set_food=1;
    end
    fprintf(f,'\r\n\r\n');
    
    %WATER...................
    
    tempw=[0,0,0,0];
    
     for i=1:nPop
        maxAlloc_water= w*maxAlloc_water+c1*rand(1,1)*(pop_water(i).pbest-pop_water(i).sol)+c2*rand(1,1)*(water_gbest.sol-pop_water(i).sol);
        %fprintf('\nMAX= ');
        %disp(maxAlloc_water);
        
        pop_water(i).fitness=FitnessFunction(pop_water(i).sol,pcost_water,totawater);
%         plot_water(it,i)=pop_water(i).fitness;    %for plot
        fprintf(f,'\r\nIt %d particle-%d (Water): ',it,i);
        fprintf(f,'%0.0f  ',pop_water(i).sol);
        fprintf(f,'          Fitness : %0.12f',pop_water(i).fitness);
        tempw(i)=pop_water(i).fitness;
        %disp([num2str(pop_water(i).sol),'          Fitness : ',num2str(pop_water(i).fitness)]);
        if pop_water(i).fitness<pop_water(i).pbest_fitness
            pop_water(i).pbest_fitness=pop_water(i).fitness;
            pop_water(i).pbest=pop_water(i).sol;
            fprintf(f,'.......NEW PBEST');
            if pop_water(i).fitness<water_gbest.fitness
                water_gbest.fitness=pop_water(i).fitness;
                water_gbest.sol=pop_water(i).sol;
                fprintf(f,'.......NEW GBEST');
            end
        end
        pop_water(i).sol=pop_water(i).sol+maxAlloc_water;
%         pop_water(i).sol=max(pop_water(i).sol,minAlloc_water);
%         pop_water(i).sol=min(pop_water(i).sol,pdmd_water);
     end
    
    fprintf(f,'\r\n\r\ntempf fitness:');
    fprintf(f,' %0.12f',tempw);
    plot_water(it)=sum(tempw)/4;
    fprintf(f,'\r\n\r\nAvg fitness:');
    fprintf(f,' %0.12f',plot_water(it));
    
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
    
    tempc=[0,0,0,0];
    
     for i=1:nPop
        maxAlloc_cloth= w*maxAlloc_cloth+c1*rand(1,1)*(pop_cloth(i).pbest-pop_cloth(i).sol)+c2*rand(1,1)*(cloth_gbest.sol-pop_cloth(i).sol);
        %fprintf('\nMAX= ');
        %disp(maxAlloc_cloth);
        
        pop_cloth(i).fitness=FitnessFunction(pop_cloth(i).sol,pcost_cloth,totacloth);
%         plot_cloth(it,i)=pop_cloth(i).fitness;    %for plot
        fprintf(f,'\r\nIt %d particle-%d (Cloth): ',it,i);
        fprintf(f,'%0.0f  ',pop_cloth(i).sol);
        fprintf(f,'          Fitness : %0.12f',pop_cloth(i).fitness);
        tempc(i)= pop_cloth(i).fitness;
        %disp([num2str(pop_cloth(i).sol),'          Fitness : ',num2str(pop_cloth(i).fitness)]);
        if pop_cloth(i).fitness<pop_cloth(i).pbest_fitness
            pop_cloth(i).pbest_fitness=pop_cloth(i).fitness;
            pop_cloth(i).pbest=pop_cloth(i).sol;
            fprintf(f,'.......NEW PBEST');
            if pop_cloth(i).fitness<cloth_gbest.fitness
                cloth_gbest.fitness=pop_cloth(i).fitness;
                cloth_gbest.sol=pop_cloth(i).sol;
                fprintf(f,'.......NEW GBEST');
            end
        end
        pop_cloth(i).sol=pop_cloth(i).sol+maxAlloc_cloth;
%         pop_cloth(i).sol=max(pop_cloth(i).sol,minAlloc_cloth);
%         pop_cloth(i).sol=min(pop_cloth(i).sol,pdmd_cloth);
     end
    
     
    fprintf(f,'\r\n\r\ntempf fitness:');
    fprintf(f,' %0.12f',tempc);
    plot_cloth(it)=sum(tempc)/4;
    fprintf(f,'\r\n\r\nAvg fitness:');
    fprintf(f,' %0.12f', plot_cloth(it));
     
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
    
    tempme=[0,0,0,0];
    
    for i=1:nPop
        maxAlloc_me= w*maxAlloc_me+c1*rand(1,1)*(pop_me(i).pbest-pop_me(i).sol)+c2*rand(1,1)*(me_gbest.sol-pop_me(i).sol);
        %fprintf('\nMAX= ');
        %disp(maxAlloc_me);
        
        pop_me(i).fitness=FitnessFunction(pop_me(i).sol,pcost_me,totame);
%         plot_me(it,i)=pop_me(i).fitness;    %for plot
        fprintf(f,'\r\nIt %d particle-%d (Medical Equipments): ',it,i);
        fprintf(f,'%0.0f  ',pop_me(i).sol);
        fprintf(f,'          Fitness : %0.12f',pop_me(i).fitness);
        tempme(i)=pop_me(i).fitness;
        %disp([num2str(pop_me(i).sol),'          Fitness : ',num2str(pop_me(i).fitness)]);
        if pop_me(i).fitness<pop_me(i).pbest_fitness
            pop_me(i).pbest_fitness=pop_me(i).fitness;
            pop_me(i).pbest=pop_me(i).sol;
            fprintf(f,'.......NEW PBEST');
            if pop_me(i).fitness<me_gbest.fitness
                me_gbest.fitness=pop_me(i).fitness;
                me_gbest.sol=pop_me(i).sol;
                fprintf(f,'.......NEW GBEST');
            end
        end
        pop_me(i).sol=pop_me(i).sol+maxAlloc_me;
%         pop_me(i).sol=max(pop_me(i).sol,minAlloc_me);
%         pop_me(i).sol=min(pop_me(i).sol,pdmd_me);
    end
    
    fprintf(f,'\r\n\r\ntempf fitness:');
    fprintf(f,' %0.12f',tempme);
    plot_me(it)=sum(tempme)/4;
    fprintf(f,'\r\n\r\nAvg fitness:');
    fprintf(f,' %0.12f',plot_me(it));
    
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
    
    temprm=[0,0,0,0];
    
    for i=1:nPop
        maxAlloc_rm= w*maxAlloc_rm+c1*rand(1,1)*(pop_rm(i).pbest-pop_rm(i).sol)+c2*rand(1,1)*(rm_gbest.sol-pop_rm(i).sol);
        %fprintf('\nMAX= ');
        %disp(maxAlloc_rm);
        
        pop_rm(i).fitness=FitnessFunction(pop_rm(i).sol,pcost_rm,totarm);
%         plot_rm(it,i)=pop_rm(i).fitness;    %for plot
        fprintf(f,'\r\nIt %d particle-%d (Rescue Members): ',it,i);
        fprintf(f,'%0.0f  ',pop_rm(i).sol);
        fprintf(f,'          Fitness : %0.12f',pop_rm(i).fitness);
        temprm(i)=pop_rm(i).fitness;
        %disp([num2str(pop_rm(i).sol),'          Fitness : ',num2str(pop_rm(i).fitness)]);
        if pop_rm(i).fitness<pop_rm(i).pbest_fitness
            pop_rm(i).pbest_fitness=pop_rm(i).fitness;
            pop_rm(i).pbest=pop_rm(i).sol;
            fprintf(f,'.......NEW PBEST');
            if pop_rm(i).fitness<rm_gbest.fitness
                rm_gbest.fitness=pop_rm(i).fitness;
                rm_gbest.sol=pop_rm(i).sol;
                fprintf(f,'.......NEW GBEST');
            end
        end
        pop_rm(i).sol=pop_rm(i).sol+maxAlloc_rm;
%         pop_rm(i).sol=max(pop_rm(i).sol,minAlloc_rm);
%         pop_rm(i).sol=min(pop_rm(i).sol,pdmd_rm);
    end
    
    fprintf(f,'\r\n\r\ntempf fitness:');
    fprintf(f,' %0.12f',temprm);
    plot_rm(it)=sum(temprm)/4;
    fprintf(f,'\r\n\r\nAvg fitness:');
    fprintf(f,' %0.12f',plot_rm(it));
    
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
    

    
    %UPDATING VARIABLES
         w=w+(wf-wi)/MaxIt;
         c1=c1+(c1f-c1i)/MaxIt;
         c2=c2+(c2f-c2i)/MaxIt;

end



%% Result
fn2=sprintf('%s---Result.txt',o);
fn3=sprintf('%s---Convergence Report.txt',o);
f2=fopen(fn2,'a');
% f3=fopen(fn3,'a');
fprintf(f2,'\r\n\r\n\r\n________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________\r\n\r\n\r\n\t\t\t\t\t%s\t\t%s\t\t%s\r\n',x,y,z);
% fprintf(f3,'\r\n\r\n________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________\r\n\r\n%s\t%s\t%s:\t\t',x,y,z);
%FOOD...................................
fprintf(f,'\r\n\r\n\r\n\r\n\nRESULT:\r\n.........\r\n\r\n                                    alocation\r\n                              [ a1   a2   a3   a4 ]\r\n\r\n');
fprintf('\r\n\r\n\r\n\r\n\nRESULT:\r\n.........\r\n\r\n                                    alocation\r\n                              [ a1   a2   a3   a4 ]\r\n\r\n');
fprintf(f,'\r\n            Food:               ');
fprintf('\r\n            Food:               ');
fprintf(f2,'\r\nFood:               ');
fprintf(f,'%0.0f   ',round(pop_food(1).sol));
fprintf('%0.0f   ',round(pop_food(1).sol));
fprintf(f2,'%0.0f   ',round(pop_food(1).sol));
fprintf(f,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_food(1).sol)),cp_food,round(pop_food(1).fitness,3),totfoodd,round(((sum(pop_food(1).sol))*100)/totfoodd),pcost_food,round(((sum(pop_food(1).sol))*100)/pcost_food),totafood,round(((sum(pop_food(1).sol))*100)/totafood));
fprintf('\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_food(1).sol)),cp_food,round(pop_food(1).fitness,3),totfoodd,round(((sum(pop_food(1).sol))*100)/totfoodd),pcost_food,round(((sum(pop_food(1).sol))*100)/pcost_food),totafood,round(((sum(pop_food(1).sol))*100)/totafood));
fprintf(f2,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_food(1).sol)),cp_food,round(pop_food(1).fitness,3),totfoodd,round(((sum(pop_food(1).sol))*100)/totfoodd),pcost_food,round(((sum(pop_food(1).sol))*100)/pcost_food),totafood,round(((sum(pop_food(1).sol))*100)/totafood));
if cp_food==inf
%     fprintf(f3,'(%d)Food\t',fc);
%     fc=fc+1;
end
%disp(['            FD: ',num2str(round(pop_food(1).sol)),sprintf('\t\tConvergance Point: '),num2str(cp_food),sprintf('\t\t\tFitness: '),num2str(round(pop_food(1).fitness,3)),sprintf('\t\t\tAllocation percentage w.r.t actual Demand: '),num2str(round(((sum(pop_food(1).sol))*100)/totfoodd)),sprintf('\t\t\t\tAllocation percentage w.r.t Plotted Demand: '),num2str(round(((sum(pop_food(1).sol))*100)/pcost_food)),sprintf('\t\t\t\tAllocation percentage w.r.t Allotadable Resources: '),num2str(round(((sum(pop_food(1).sol))*100)/totafood))]);

%disp(sum(pop_food(1).sol));


%WATER...................
if wi==wf
    fprintf(f,'\r\nw=%0.2f',w);
else
    fprintf(f,'\r\nw=%0.1f-%0.1f',wi,wf);
end
fprintf(f,'\r\n            Water:              ');
fprintf('\r\n            Water:              ');
fprintf(f2,'\r\nWater:              ');
fprintf(f,'%0.0f   ',round(pop_water(1).sol));
fprintf('%0.0f   ',round(pop_water(1).sol));
fprintf(f2,'%0.0f   ',round(pop_water(1).sol));
fprintf(f,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_water(1).sol)),cp_water,round(pop_water(1).fitness,3),totwaterd,round(((sum(pop_water(1).sol))*100)/totwaterd),pcost_water,round(((sum(pop_water(1).sol))*100)/pcost_water),totawater,round(((sum(pop_water(1).sol))*100)/totawater));
fprintf('\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_water(1).sol)),cp_water,round(pop_water(1).fitness,3),totwaterd,round(((sum(pop_water(1).sol))*100)/totwaterd),pcost_water,round(((sum(pop_water(1).sol))*100)/pcost_water),totawater,round(((sum(pop_water(1).sol))*100)/totawater));
fprintf(f2,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_water(1).sol)),cp_water,round(pop_water(1).fitness,3),totwaterd,round(((sum(pop_water(1).sol))*100)/totwaterd),pcost_water,round(((sum(pop_water(1).sol))*100)/pcost_water),totawater,round(((sum(pop_water(1).sol))*100)/totawater));
if cp_water==inf
%     fprintf(f3,'(%d)Water\t',wc);
%     wc=wc+1;
end
%disp(['            WT: ',num2str(round(pop_water(1).sol)),sprintf('\t\t\tConvergance Point: '),num2str(cp_water),sprintf('\t\t\tFitness: '),num2str(round(pop_water(1).fitness,3)),sprintf('\t\t\tAllocation percentage w.r.t actual Demand: '),num2str(round(((sum(pop_water(1).sol))*100)/totwaterd)),sprintf('\t\t\t\tAllocation percentage w.r.t Plotted Demand: '),num2str(round(((sum(pop_water(1).sol))*100)/pcost_water)),sprintf('\t\t\t\tAllocation percentage w.r.t Allotadable Resources: '),num2str(round(((sum(pop_water(1).sol))*100)/totawater))]);

%disp(sum(pop_water(1).sol));


%CLOTH...................
if c1i==c1f
    fprintf(f,'\r\nc1=%0.2f',c1);
else
    fprintf(f,'\r\nc1=%0.1f-%0.1f',c1i,c1f);
end
fprintf(f,'\r\n            Cloth:              ');
fprintf('\r\n            Cloth:              ');
fprintf(f2,'\r\nCloth:              ');
fprintf(f,'%0.0f   ',round(pop_cloth(1).sol));
fprintf('%0.0f   ',round(pop_cloth(1).sol));
fprintf(f2,'%0.0f   ',round(pop_cloth(1).sol));
fprintf(f,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_cloth(1).sol)),cp_cloth,round(pop_cloth(1).fitness,3),totclothd,round(((sum(pop_cloth(1).sol))*100)/totclothd),pcost_cloth,round(((sum(pop_cloth(1).sol))*100)/pcost_cloth),totacloth,round(((sum(pop_cloth(1).sol))*100)/totacloth));
fprintf('\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_cloth(1).sol)),cp_cloth,round(pop_cloth(1).fitness,3),totclothd,round(((sum(pop_cloth(1).sol))*100)/totclothd),pcost_cloth,round(((sum(pop_cloth(1).sol))*100)/pcost_cloth),totacloth,round(((sum(pop_cloth(1).sol))*100)/totacloth));
fprintf(f2,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_cloth(1).sol)),cp_cloth,round(pop_cloth(1).fitness,3),totclothd,round(((sum(pop_cloth(1).sol))*100)/totclothd),pcost_cloth,round(((sum(pop_cloth(1).sol))*100)/pcost_cloth),totacloth,round(((sum(pop_cloth(1).sol))*100)/totacloth));
if cp_cloth==inf
%     fprintf(f3,'(%d)Cloth\t',cc);
%     cc=cc+1;
end
%disp(['            CT: ',num2str(round(pop_cloth(1).sol)),sprintf('\t\t\tConvergance Point: '),num2str(cp_cloth),sprintf('\t\t\tFitness: '),num2str(round(pop_cloth(1).fitness,3)),sprintf('\t\t\tAllocation percentage w.r.t actual Demand: '),num2str(round(((sum(pop_cloth(1).sol))*100)/totclothd)),sprintf('\t\t\t\tAllocation percentage w.r.t Plotted Demand: '),num2str(round(((sum(pop_cloth(1).sol))*100)/pcost_cloth)),sprintf('\t\t\t\tAllocation percentage w.r.t Allotadable Resources: '),num2str(round(((sum(pop_cloth(1).sol))*100)/totacloth))]);

%disp(sum(pop_cloth(1).sol));


%ME...................
if c2i==c2f
    fprintf(f,'\r\nc2=%0.2f',c2);
else
    fprintf(f,'\r\nc2=%0.1f-%0.1f',c2i,c2f);
end
fprintf(f,'\r\n            Medical Equipments: ');
fprintf('\r\n            Medical Equipments: ');
fprintf(f2,'\r\nMedical Equipments: ');
fprintf(f,'%0.0f   ',round(pop_me(1).sol));
fprintf('%0.0f   ',round(pop_me(1).sol));
fprintf(f2,'%0.0f   ',round(pop_me(1).sol));
fprintf(f,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_me(1).sol)),cp_me,round(pop_me(1).fitness,3),totmed,round(((sum(pop_me(1).sol))*100)/totmed),pcost_me,round(((sum(pop_me(1).sol))*100)/pcost_me),totame,round(((sum(pop_me(1).sol))*100)/totame));
fprintf('\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_me(1).sol)),cp_me,round(pop_me(1).fitness,3),totmed,round(((sum(pop_me(1).sol))*100)/totmed),pcost_me,round(((sum(pop_me(1).sol))*100)/pcost_me),totame,round(((sum(pop_me(1).sol))*100)/totame));
fprintf(f2,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_me(1).sol)),cp_me,round(pop_me(1).fitness,3),totmed,round(((sum(pop_me(1).sol))*100)/totmed),pcost_me,round(((sum(pop_me(1).sol))*100)/pcost_me),totame,round(((sum(pop_me(1).sol))*100)/totame));
if cp_me==inf
%     fprintf(f3,'(%d)Medical Equipment\t',mec);
%     mec=mec+1;
end
%disp(['            ME: ',num2str(round(pop_me(1).sol)),sprintf('\t\t\tConvergance Point: '),num2str(cp_me),sprintf('\t\t\tFitness: '),num2str(round(pop_me(1).fitness,3)),sprintf('\t\t\tAllocation percentage w.r.t actual Demand: '),num2str(round(((sum(pop_me(1).sol))*100)/totmed)),sprintf('\t\t\t\tAllocation percentage w.r.t Plotted Demand: '),num2str(round(((sum(pop_me(1).sol))*100)/pcost_me)),sprintf('\t\t\t\tAllocation percentage w.r.t Allotadable Resources: '),num2str(round(((sum(pop_me(1).sol))*100)/totame))]);

%disp(sum(pop_me(1).sol));
    
    
%RM...................
fprintf(f,'\r\n\r\n            Rescue Members:    	');
fprintf('\r\n            Rescue Members:    	');
fprintf(f2,'\r\nRescue Members:     ');
fprintf(f,'%0.0f    ',round(pop_rm(1).sol));
fprintf('%0.0f    ',round(pop_rm(1).sol));
fprintf(f2,'%0.0f    ',round(pop_rm(1).sol));
fprintf(f,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_rm(1).sol)),cp_rm,round(pop_rm(1).fitness,3),totrmd,round(((sum(pop_rm(1).sol))*100)/totrmd),pcost_rm,round(((sum(pop_rm(1).sol))*100)/pcost_rm),totarm,round(((sum(pop_rm(1).sol))*100)/totarm));
fprintf('\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_rm(1).sol)),cp_rm,round(pop_rm(1).fitness,3),totrmd,round(((sum(pop_rm(1).sol))*100)/totrmd),pcost_rm,round(((sum(pop_rm(1).sol))*100)/pcost_rm),totarm,round(((sum(pop_rm(1).sol))*100)/totarm));
fprintf(f2,'\t\t\tTotal Allocated: %d\t\t\tConvergence Point: %d\t\t\tFitness: %0.3f\t\tTotal Actual Demand: %d (%d%%)\t\t\t\tTotal Plotted Demand: %d (%d%%)\t\t\tTotal Allotadable Resources: %0.0f (%d%%)',sum(round(pop_rm(1).sol)),cp_rm,round(pop_rm(1).fitness,3),totrmd,round(((sum(pop_rm(1).sol))*100)/totrmd),pcost_rm,round(((sum(pop_rm(1).sol))*100)/pcost_rm),totarm,round(((sum(pop_rm(1).sol))*100)/totarm));
if cp_rm==inf
%     fprintf(f3,'(%d)Rescue Member\t',rmc);
%     rmc=rmc+1;
end
%disp(['            RM: ',num2str(round(pop_rm(1).sol)),sprintf('\t\t\t\tConvergance Point: '),num2str(cp_rm),sprintf('\t\t\tFitness: '),num2str(round(pop_rm(1).fitness,3)),sprintf('\t\t\tAllocation percentage w.r.t actual Demand: '),num2str(round(((sum(pop_rm(1).sol))*100)/totrmd)),sprintf('\t\t\t\tAllocation percentage w.r.t Plotted Demand: '),num2str(round(((sum(pop_rm(1).sol))*100)/pcost_rm)),sprintf('\t\t\t\tAllocation percentage w.r.t Allotadable Resources: '),num2str(round(((sum(pop_rm(1).sol))*100)/totarm))]);

%disp(sum(pop_rm(1).sol));

% fclose(f3);
fclose(f2);
fclose(f);
%% Plot
%for i=1:nPop
    
    figure;plot(plot_food,'kd','LineWidth', 1)
    title('Iteration vs Fitness'),xlabel('Iteration','FontSize',12,'FontWeight','bold'),ylabel('Fitness','FontSize',12,'FontWeight','bold')
    hold on; plot(plot_water,'k*','LineWidth', 1);plot(plot_cloth,'k+','LineWidth', 1);plot(plot_me,'ko','LineWidth', 1);plot(plot_rm,'k^','LineWidth', 1); hold off;
    legend('Food','Water','Cloth','Medical Equipments','Rescue Member')
    
%end


fprintf('\r\n\r\n\r\n');
xyz=input('');
end