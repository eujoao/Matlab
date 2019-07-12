function dist = distance(x1,y1,x2,y2)


A1 = dlmread('num.txt')
b=size(A1)
c=b(1,1)%numero de linhas
d=b(1,2)%numero de colunas
f=c-1;
g=d;
% xval=0;
% yval=0;

nl=A1(1,1)
nc=A1(1,2)
ch=A1(1,3)
cv=A1(1,4)

%This function calculates the distance between any two cartesian 
%coordinates.
%   Copyright 2009-2010 The MathWorks, Inc.

dist=2*sqrt(((x1-x2)*ch)^2 + ((y1-y2)*cv)^2);
