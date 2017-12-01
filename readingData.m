close all;
clear all;
clc;

load('100m.mat');
val = (val-1024)/200;
samplePoint = length(val(1,:));
time = (1:samplePoint)/360;
plot(time, val(1,:))

%dt = time(2)-time(1);
%Dval = [diff(val(1,:))/dt 0];
%figure(2)
%plot(time, Dval)

%DDval = [diff(Dval)/dt 0];
%figure(3)
%plot(time, DDval)

th = max(val(1,:))*0.8;
beat = 0;
for i = 1:samplePoint
    if val(1,i) > th
        if sign(val(1,i-1)-val(1,i)) ~= sign(val(1,i)-val(1,i+1))
            beat = beat+1;
        end
    end
end

beatrate = beat*6;
disp('Heart rate is: ');disp(beatrate)