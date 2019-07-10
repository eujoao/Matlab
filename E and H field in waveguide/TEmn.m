function [Ez,x,y,z] = TEmn(a,b,m,n,k,ind)
pass = 50;


k1 = k;
kx = m*pi/a;                      %Número de onda em x
ky = n*pi/b;                      %Número de onda em y
beta = sqrt(k1^2 - (kx^2 + ky^2)); %Constante de propagação
lambdag = 2*pi/beta;              %Comprimento de onda guiada


comp_guia = real(lambdag);
if ind ==1
x = linspace(0,a,pass);
y = linspace(0,b,pass);
z = linspace(0,comp_guia,pass);
else
x = linspace(-a/2,a/2,pass);
y = linspace(-b/2,b/2,pass);
z = linspace(-comp_guia/2,comp_guia/2,pass);
end

Ez = zeros(pass,pass,pass);

    for ii=1:1:pass
            for jj=1:1:pass
                for kk=1:1:pass
                    Ez(ii,jj,kk) = cos((kx*x(ii)))*cos((ky*y(jj)))*exp((-1j)*beta*z(kk)); 
                end
            end
    end


