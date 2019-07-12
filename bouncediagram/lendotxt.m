A1 = dlmread('num.txt')
b=size(A1)
c=b(1,1)
d=b(1,2)
k=0

nl=A1(1,1)
nc=A1(1,2)
ch=A1(1,3)
cv=A1(1,4)
partidaX=0;
partidaY=0;
chegada=0;

%tirando a primeira linha
for i=2:c
  for j=0:d-1
%     k=k+1;
    X(i-1,j+1) = A1(i,j+1);
  end
end
disp(X)

%encontrando 2 e 3
for i=2:c
  for j=0:d-1
%     k=k+1;
    chegada=chegada+1;
 %   partidaX=partidaX+i-1;
  %  partidaY=partidaY+j+1;
    Part(i-1,j+1) = A1(i,j+1);
    
    if Part(i-1,j+1)==2
        partx=i-1;
        party=j+1;
        disp(partx)
        disp(party)
    end
    
    if Part(i-1,j+1)==3
        chegx=i-1;
        chegy=j+1;
        disp(chegx)
        disp(chegy)
    end
    
  end
end