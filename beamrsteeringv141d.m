%2D FFT beamforming
clc;
clear all;
close all;
c=3e8;
%frequency and wavelength of observing source
f=1420e6;
lambda=c/f;
ls = 2;
%distance between antennas in x direction
dx = lambda/ls;
%propagation constant
k = 2*pi/lambda;
%Number of antennas in y direction
M = 8;
%zenithangle
zenithangle = 0:1:90;
zenithangler = deg2rad(zenithangle);
A = ones(1,M);

y = 1;

  %Source direction
sourcedirdze = 90;
sourcedirzer = deg2rad(sourcedirdze);
m = 1:1:M;
%Progressive Phase shift in y and x direction 
delta = -k.*dx.*cos(sourcedirzer);

 for p =  1:length(zenithangler) 
 w2 = A(m).*exp(1i.*(m-1).*(k.*dx.*cos(zenithangler(p))+delta)); 
 AF(p) = sum(w2);
endfor

plot(zenithangle,AF);
 [maxP,maxIdx]=max(AF);
 fprintf('Maximum value %f at theta=%f\n',maxP,zenithangle(maxIdx));
ylabel('Array factor of x');
xlabel('zenith- -90 to 90,az- 0 and 180');
title('Array factor')