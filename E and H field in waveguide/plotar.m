function fig = plotar(lambda,a,b)

        str = ('1/2a \rightarrow ');
        str1 = ('1/2b \uparrow');
        aa = a;
        bb = b;
        lambda1 = lambda;
       
        if  2*bb ~= aa
            bb = aa/2;
        end
         matriz = [0:1/(2*aa*1e+2):lambda;0:1/(2*bb*1e+2):2*lambda1];
         
         nn = (1/(2*bb*1e+2))*ones(1,length(matriz(1,:)));
         mm = (1/(2*aa*1e+2))*ones(1,length(matriz(2,:)));
         pp = (2/(2*bb*1e+2))*ones(1,length(matriz(1,:)));
         qq = (2/(2*aa*1e+2))*ones(1,length(matriz(2,:)));
         rr = (3/(2*bb*1e+2))*ones(1,length(matriz(1,:)));
         ss = (3/(2*aa*1e+2))*ones(1,length(matriz(2,:)));
         tt = (4/(2*aa*1e+2))*ones(1,length(matriz(2,:)));
         
        figure(2) 
        teta = linspace(0,pi/2,20);
        yy = lambda1*sin(teta);
        xx = lambda1*cos(teta);
        plot(xx, yy, 'k-','LineWidth',2);
        axis([0 lambda1 0 lambda1]);
        title('Modos Propagantes');
        set(gca,'xticklabel',{[]});
        set(gca,'yticklabel',{[]});
        xlabel('m');
        ylabel('n');
        text(0.01,-0.04,str,'FontSize',14);
        text(-0.06,0.05,str1,'FontSize',14);
        %grid on
        hold on 
        sz = 40;
        scatter(matriz(1,:),nn,sz,'MarkerEdgeColor',[0 0 0 ],...
              'MarkerFaceColor',[0 0 0],...
              'LineWidth',1.5);
        scatter(mm,matriz(2,:),sz,'MarkerEdgeColor',[0 0 0],...
              'MarkerFaceColor',[0 0 0],...
              'LineWidth',1.5);  
        scatter(matriz(1,:),pp,sz,'MarkerEdgeColor',[0 0 0],...
              'MarkerFaceColor',[0 0 0],...
              'LineWidth',1.5);
        scatter(qq,matriz(2,:),sz,'MarkerEdgeColor',[0 0 0],...
              'MarkerFaceColor',[0 0 0],...
              'LineWidth',1.5);
        scatter(rr,matriz(1,:),sz,'MarkerEdgeColor',[0 0 0],...
              'MarkerFaceColor',[0 0 0],...
              'LineWidth',1.5);
       scatter(ss,matriz(2,:),sz,'MarkerEdgeColor',[0 0 0],...
              'MarkerFaceColor',[0 0 0],...
              'LineWidth',1.5);
       scatter(tt,matriz(2,:),sz,'MarkerEdgeColor',[0 0 0],...
              'MarkerFaceColor',[0 0 0],...
              'LineWidth',1.5);

end