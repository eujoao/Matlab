     
r = [0 .25 .5 1 2];
for i = 1:1:length(r)                           % Plot dos círculos reais

    x0 = r(i)/(1+r(i));
    raio = 1/(1+r(i));
    x = x0-raio:.01:x0+raio;
    gama_r = sqrt(raio^2 - (x-x0).^2);      %Cálculo do gama real 
    plot(x,real(gama_r),'k','linewidth',1);
    hold on
    plot(x,-real(gama_r),'k','linewidth',1);
       

end

x1 = [.001 .2 .5 1 2 5];
for i= 1:1:length(x1)                       % Plot dos círculos imaginários 
     
    
     y0= 1/(x1(i));                         %Setando um y0 pequeno para criar a reta central
     raio1= (1/x1(i));                      %Setando um raio1 pequeno para criar a reta central
     y=1-raio1 :.001: 1+raio1;
     
     gama_i= sqrt(raio1.^2-(y-1).^2)+ y0;   %Cálculo do gama imginário dos cículos superiores 
     aux = sqrt(real(gama_i).^2+(y).^2);    %Cálculo do módulo das coordenadas x e y 
     ind = find(aux<=1);                    %Encontrando os índices de módulos menores que 1
     
     plot(y(ind),-real(gama_i(ind)),'k');
     hold on
     plot(y(ind),real(gama_i(ind)),'k');
     hold on

     gama_i2= sqrt(raio1.^2-(y-1).^2)- y0;   
     aux1 = sqrt(real(gama_i2).^2+(y).^2);  %Cálculo do módulo das coordenadas x e y
     ind1 = find(aux1<=1);                  %Encontrando os índices de módulos menores que 1

     plot(y(ind1),real(gama_i2(ind1)),'k');
     hold on
     plot(y(ind1),-real(gama_i2(ind1)),'k');
     axis([-1.15 1.15 -1.15 1.15]);
     hold on
    
     %========================================Informando alguns valores de reatância de acordo com o ponto 
     text(.95,.41,'j5','linewidth',2);
     text(.63,.87,'j2');
     text(0,1.1,'j1');
     text(-.74,.87,'j0.5');
     text(-1.05,.45,'j0.2');
     text(-1.1,0,'j0');
     %========================================Informando alguns valores de reatância de acordo com o ponto 
     text(.95,-.41,'-j5');
     text(.63,-.87,'-j2');
     text(0,-1.05,'-j1');
     text(-.74,-.87,'-j0.5');
     text(-1.07,-.42,'-j0.2');
     text(1.03,0.02,'\infty');
end

     Z0 = 50;
     Zl = 100+100i;
     zl = Zl/Z0;                                %Normalizando a impedancia de carga
     yl = 1/zl;
     gama = (zl-1)/(zl+1);                      %Cálculo do coeficiente de reflexão
     gamayl = (yl-1)/(yl+1);
     mod = abs(gama);                           %Extraindo o módulo do coeficiente de reflexão 
     teta = angle(gama);                        %Extraindo a fase do coeficiente de reflexão
     modyl = abs(gamayl);
     tetayl = angle(gamayl);
     SWR = (1+mod)/(1-mod);                     %Cálculo do COE (VSWR

     theta = linspace(0,2*pi,50);
     polar(teta, mod, 'ro') ;                   % Plot de zl
     polar(tetayl, modyl, 'go')                 % Plot de yl
     hold on
     
     gamacos = abs(gama)*cos(theta);
     gamasen = abs(gama)*sin(theta);
     plot(gamacos,gamasen,'b--');
     
     
     set(gca,'xticklabel',{[]});             %Apagando as informações do eixo x
     set(gca,'yticklabel',{[]});             %Apagando as informações do eixo y
     title(' Carta de Smith ');
     hold on                       
     
     
%PLOTAR RESULTADOS    
%      
%      jg = cellfun(@str2num,S11);
%      gamamed = abs(jg);
%      tetamed = angle(jg);
%      polar(tetamed,gamamed,'r.');
          
     
     
     