A1 = dlmread('num.txt')
b=size(A1)
c=b(1,1)
d=b(1,2)
k=0

nl=A1(1,1)
nc=A1(1,2)
ch=A1(1,3)
cv=A1(1,4)

for i=2:c
  for j=0:d-1
%     k=k+1;
    X(i-1,j+1) = A1(i,j+1);
  end
end
disp(X)