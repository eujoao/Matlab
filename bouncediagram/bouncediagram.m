clc; 
disp('             Circuito equivalente      ');
disp('    -------[Rg]-============--------');
disp('    |                              |');
disp(['Vg  =       '  char(915) 'g = ?   Z0   ' char(915) 'l = ?  [Rl]']);
disp('    |                              |');
disp('    ------------============--------');

%Cálculos relacionados a onda
%Entrada de variáveis
rg = input(['Digite o valor da resitência do gerador (Rg)[' char(937) ']: ' ]);
r0 = input(['Digite o valor da impedância da linha (Z0)[' char(937) ']: ' ]);
rl = input(['Digite o valor da resitência da carga (Rl)[' char(937) ']: ']);
vg = input('Digite o valor da tensão do gerador (Vg)[V]: ');

% Cálculo dos coeficientes de reflex.
gamal = (rl - r0)/(rl + r0); 
gamag = (rg - r0)/(rg + r0);
v1 = r0*(vg)/(rg + r0);

n = 10; 

%Inicializando os vetores v(onda) e aux(somatório acumulado)
v = zeros(1,n);
soma = 0; 
aux =  zeros(1,n);

for i = 1:10

    %Setando o valor inicial v(0)
    if i == 1
        soma = v1;
        v(i) = v1;
        aux(i) = soma;
    else      %índices pares de v(t) vezes o gama da carga       
        if mod(i,2) == 0
            v(i) = v(i-1)*gamal;
        else  %índices ímpares de v(t) vezes o gama do gerador
            v(i) = v(i-1)*gamag;
        end
        soma = soma + v(i); %Soma acumulados de todos os v's
        aux(i) = soma;      %Armazenando cada uma das somas
    end 
    
end
%========================================= Código para plotar o
%mapa/obstáculos
kkk = 1;
A1 = dlmread('num.txt');
b=size(A1);
c=b(1,1);%numero de linhas
d=b(1,2);%numero de colunas
f=c-1;
g=d;
% xval=0;
% yval=0;

nl=A1(1,1);
nc=A1(1,2);
ch=A1(1,3);
cv=A1(1,4);
partidaX=0;
partidaY=0;
chegada=0;
%diagonalcusto=
%tirando a primeira linha
for i=2:c
  for j=0:d-1
%     k=k+1;
    X(i-1,j+1) = A1(i,j+1);
  end
end


%DEFINE THE 2-D MAP ARRAY
MAX_X=f;
MAX_Y=g;
MAX_VAL=1000;
%This array stores the coordinates of the map and the 
%Objects in each coordinate
MAP=2*(ones(MAX_X,MAX_Y));
%xlim([1 d]);
%ylim([1 f]);

% Obtain Obstacle, Target and Robot Position
% Initialize the MAP with input values
% Obstacle=-1,Target = 0,Robot=1,Space=2
j=0;
x_val = 1;
y_val = 1;

axis([1 MAX_X+1 1 MAX_Y+1])

%ax.YTick = 0:1:MAX_Y+1;
%ax.XTick = 0:1:MAX_X+1;
%ylim(f)
set(gca,'xtick',0:1:d);
set(gca,'ytick',0:1:f);
title('Bounce Diagram')
xlabel('V(z,t) = 0 -> Z')
ylabel('V(z,t) = 0 -> nT')
grid on;
hold on;
n=0;%Number of Obstacles

% BEGIN Interactive Obstacle, Target, Start Location selection
pause(1);
RGB = imread('jogos.png');
h=msgbox('Que os Jogos Comecem!','','custom',RGB);
uiwait(h,10);
if ishandle(h) == 1
    delete(h);
end
%file = uiputfile

% h=msgbox('Selecione o ponto de chegada');
% uiwait(h,5);
% if ishandle(h) == 1
%     delete(h);
% end
% xlabel('Por favor selecione o ponto de chegada','Color','black');
% but=0;
% Posicao Inicial
    
for i=2:c
  for j=0:d-1
%     k=k+1;
    chegada=chegada+1;
 %   partidaX=partidaX+i-1;
  %  partidaY=partidaY+j+1;
    Part(i-1,j+1) = A1(i,j+1);
    
%     if Part(i-1,j+1)==2
%         partx=i-1;
%         party=j+1;
%         disp(partx)
%         disp(party)
%     end
    
    if Part(i-1,j+1)==2
        chegx=i-1;
        chegy=j+1;
        disp(chegx);
        disp(chegy);
    end
    
  end
end
xval=chegx;
yval=chegy;




% [xval,yval,but]
% end

%xval=floor(xval);
%yval=floor(yval);
xTarget=xval;%X Coordinate of the Target
yTarget=yval;%Y Coordinate of the Target

MAP(xval,yval)=0;%Initialize MAP with location of the target
plot(xval+.5,yval+.5,'bs','MarkerEdgeColor','k','MarkerSize',10,'MarkerFaceColor',[0,0.7,0.9]);
text(xval+1,yval+.5,'Reg. Perm.')

pause(2);
% h=msgbox('Select Obstacles using the Left Mouse button,to select the last obstacle use the Right button');
%   xlabel('Select Obstacles using the Left Mouse button,to select the last obstacle use the Right button','Color','blue');
% uiwait(h,10);
% 
% 
% if ishandle(h) == 1
%     delete(h);
% end
k = 0;
k1 = 1;
w = 1;
w1 = 1;
% Criando os obstaculos
for i=1:f
  for j=1:d
%     k=k+1;
    chegada=chegada+1;
 %   partidaX=partidaX+i-1;
  %  partidaY=partidaY+j+1;
    Obst(i,j) = X(i,j);
    
    if Obst(i,j)==1 %Obstáculos internos 
       xval=i;
        yval=j;
        MAP(xval,yval)=-1;
        plot(xval+.5,yval+.5,' ');
    end
    if Obst(i,j)==6 %Plot dos períodos 
       xval=i;
        yval=j;
        MAP(xval,yval)=-1;
        plot(xval+.5,yval+.5,' ');
        text(xval+.5-0.5,yval+.5+.2, [num2str(w1) 'T']);
        w1 = w1 + 1;
    end
    if Obst(i,j)== 8 %Plot dos valores de Gama (L/G) 
        xval=i;
        yval=j;
        MAP(xval,yval)=-1;
        if mod(w,2) == 0;  
            plot(xval+.5,yval+.5,' ');
            text(xval,yval+.5,['\Gamma_{L} = ' num2str(gamal)])
            w = w + 1;
        else
            plot(xval+.5,yval+.5,' ');
            text(xval-2,yval+.5,['\Gamma_{G} = ' num2str(gamag)])
            w = w + 1;
        end
    end
    if Obst(i,j)==9 %preenchimento externo azul
       xval=i;
        yval=j;
        MAP(xval,yval)=-1;
        plot(xval+.5,yval+.5,' '); %'mo','MarkerEdgeColor','k','MarkerSize',10,'MarkerFaceColor',[0,0.5,0.4]);
    end
    if Obst(i,j)==4 %Barras laterais 
       xval=i;
        yval=j;
        MAP(xval,yval)=-1;
        plot(xval+.5,yval+.5,'bs','MarkerEdgeColor','k','MarkerSize',10,'MarkerFaceColor',[0,0.5,0.4]);
    end
    if Obst(i,j)==7 % Valores ímpares do vetor v 
        kkk = 2*k + 1;
        xval=i;
        yval=j;
        MAP(xval,yval)=-1;
        plot(xval+.5,yval+.5,' ');
        text(xval-3.5,yval+.5,['Vg = ' num2str(aux(kkk)) 'V'])
        k = k + 1; 
    end
     if Obst(i,j)==5 % Valores pares do vetor v
        kkk = 2*k1;
        xval=i;
        yval=j;
        MAP(xval,yval)=-1;
        plot(xval+.5,yval+.5,' ');
        text(xval,yval+.5,['Vg = ' num2str(aux(kkk)) 'V'])
        k1 = k1 + 1;       
    end
  end
end

% Chegada'target'
for i=2:c
  for j=0:d-1
%     k=k+1;
    chegada=chegada+1;
 %   partidaX=partidaX+i-1;
  %  partidaY=partidaY+j+1;
    Inipos(i-1,j+1) = A1(i,j+1);
    
    if Inipos(i-1,j+1)==3
        xval=i-1;
        yval=j+1;
%         MAP(xval,yval)=1;
%         plot(xval+.5,yval+.5,'m*');
        xStart=xval;%Starting Position
        yStart=yval;%Starting Position
        MAP(xval,yval)=1;
        plot(xval+.5,yval+.5,'hk','MarkerFaceColor',[0 0.2 0.1]);
    end
  end
end
% while but == 1
%     [xval,yval,but] = ginput(1);
%     xval=floor(xval);
%     yval=floor(yval);
%     MAP(xval,yval)=-1;%Put on the closed list as well
%     plot(xval+.5,yval+.5,'ro');
%  end%End of While loop
%  
pause(1);

% h=msgbox('Please Select the Vehicle initial position using the Left Mouse button');
% uiwait(h,5);
% if ishandle(h) == 1
%     delete(h);
% end
% xlabel('Please Select the Vehicle initial position ','Color','black');
% but=0;
% while (but ~= 1) %Repeat until the Left button is not clicked
%     [xval,yval,but]=ginput(1);
%     xval=floor(xval);
%     yval=floor(yval);
% end


% xStart=xval;%Starting Position
% yStart=yval;%Starting Position
% MAP(xval,yval)=1;
%  plot(xval+.5,yval+.5,'bo');

 
 %End of obstacle-Target pickup

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LISTS USED FOR ALGORITHM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%OPEN LIST STRUCTURE
%--------------------------------------------------------------------------
%IS ON LIST 1/0 |X val |Y val |Parent X val |Parent Y val |h(n) |g(n)|f(n)|
%--------------------------------------------------------------------------
OPEN=[];
%CLOSED LIST STRUCTURE
%--------------
%X val | Y val |
%--------------
% CLOSED=zeros(MAX_VAL,2);
CLOSED=[];

%Put all obstacles on the Closed list
k=1;%Dummy counter
for i=1:MAX_X
    for j=1:MAX_Y
        if(MAP(i,j) == -1)
            CLOSED(k,1)=i; 
            CLOSED(k,2)=j; 
            k=k+1;
        end
    end
end
CLOSED_COUNT=size(CLOSED,1);
%set the starting node as the first node
xNode=xval;
yNode=yval;
OPEN_COUNT=1;
path_cost=0;
goal_distance=distance(xNode,yNode,xTarget,yTarget);
OPEN(OPEN_COUNT,:)=insert_open(xNode,yNode,xNode,yNode,path_cost,goal_distance,goal_distance);%popular lista de abertos
OPEN(OPEN_COUNT,1)=0;
CLOSED_COUNT=CLOSED_COUNT+1;
CLOSED(CLOSED_COUNT,1)=xNode;
CLOSED(CLOSED_COUNT,2)=yNode;
NoPath=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START ALGORITHM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while((xNode ~= xTarget || yNode ~= yTarget) && NoPath == 1)
%  plot(xNode+.5,yNode+.5,'go');
 exp_array=expand_array(xNode,yNode,path_cost,xTarget,yTarget,CLOSED,MAX_X,MAX_Y);%pega um noe e retorna uma lista de sucessores
 exp_count=size(exp_array,1);
 %UPDATE LIST OPEN WITH THE SUCCESSOR NODES
 %OPEN LIST FORMAT
 %--------------------------------------------------------------------------
 %IS ON LIST 1/0 |X val |Y val |Parent X val |Parent Y val |h(n) |g(n)|f(n)|
 %--------------------------------------------------------------------------
 %EXPANDED ARRAY FORMAT
 %--------------------------------
 %|X val |Y val ||h(n) |g(n)|f(n)|
 %--------------------------------
 for i=1:exp_count
    flag=0;
    for j=1:OPEN_COUNT
        if(exp_array(i,1) == OPEN(j,2) && exp_array(i,2) == OPEN(j,3) )
            OPEN(j,8)=min(OPEN(j,8),exp_array(i,5)); %#ok<*SAGROW>
            if OPEN(j,8)== exp_array(i,5)
                %UPDATE PARENTS,gn,hn
                OPEN(j,4)=xNode;
                OPEN(j,5)=yNode;
                OPEN(j,6)=exp_array(i,3);
                OPEN(j,7)=exp_array(i,4);
            end;%End of minimum fn check
            flag=1;
        end;%End of node check
%         if flag == 1
%             break;
    end;%End of j for
    if flag == 0
        OPEN_COUNT = OPEN_COUNT+1;
        OPEN(OPEN_COUNT,:)=insert_open(exp_array(i,1),exp_array(i,2),xNode,yNode,exp_array(i,3),exp_array(i,4),exp_array(i,5));
     end;%End of insert new element into the OPEN list
 end;%End of i for
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %END OF WHILE LOOP
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %Find out the node with the smallest fn 
  index_min_node = min_fn(OPEN,OPEN_COUNT,xTarget,yTarget);
  if (index_min_node ~= -1)    
   %Set xNode and yNode to the node with minimum fn
   xNode=OPEN(index_min_node,2);
   yNode=OPEN(index_min_node,3);
   path_cost=OPEN(index_min_node,6);%Update the cost of reaching the parent node
  %Move the Node to list CLOSED
  CLOSED_COUNT=CLOSED_COUNT+1;
  CLOSED(CLOSED_COUNT,1)=xNode;
  CLOSED(CLOSED_COUNT,2)=yNode;
  OPEN(index_min_node,1)=0;
  else
      %No path exists to the Target!!
      NoPath=0;%Exits the loop!
  end;%End of index_min_node check
end;%End of While Loop
%Once algorithm has run The optimal path is generated by starting of at the
%last node(if it is the target node) and then identifying its parent node
%until it reaches the start node.This is the optimal path

i=size(CLOSED,1);
Optimal_path=[];
xval=CLOSED(i,1);
yval=CLOSED(i,2);
i=1;
Optimal_path(i,1)=xval;
Optimal_path(i,2)=yval;
i=i+1;

if ( (xval == xTarget) && (yval == yTarget))
    inode=0;
   %Traverse OPEN and determine the parent nodes
   parent_x=OPEN(node_index(OPEN,xval,yval),4);%node_index returns the index of the node
   parent_y=OPEN(node_index(OPEN,xval,yval),5);
   
   while( parent_x ~= xStart || parent_y ~= yStart)
           Optimal_path(i,1) = parent_x;
           Optimal_path(i,2) = parent_y;
           %Get the grandparents:-)
           inode=node_index(OPEN,parent_x,parent_y);
           parent_x=OPEN(inode,4);%node_index returns the index of the node
           parent_y=OPEN(inode,5);
           i=i+1;
    end;
 j=size(Optimal_path,1);
 %Plot the Optimal Path!
 p=plot(Optimal_path(j,1)+.5,Optimal_path(j,2)+.5,'ko');
 j=j-1;
 for i=j:-1:1
  pause(.25);
  set(p,'XData',Optimal_path(i,1)+.5,'YData',Optimal_path(i,2)+.5);
 drawnow ;
 end;
 plot(Optimal_path(:,1)+.5,Optimal_path(:,2)+.5);
else
 pause(1);
 h=msgbox('Sorry, No path exists to the Target!','warn');
 uiwait(h,5);
end
    
optsize=size(Optimal_path);
rowopt=optsize(1,1);
columopt=optsize(1,2);

% %Populando a matriz OptTemp
% cont=0;
% for i=1:1:rowopt
%   for j=1:1:columopt
% 
%    
% 
%     OptTemp(i,j) = Optimal_path(i,j);
%     
%   end 
% end
% 
% j=1;
% custh=0;
% 
% for i=1:1:rowopt-1;
%   
% 
% if OptTemp(i,j)~=Optimal_path(i+1,j)
%   custh=custh+1;
%     
%  
% end
% end
clc; 
disp('             Circuito equivalente      ');
disp(['     -------[' num2str(rg) char(937)  ']-============------------']);
disp('     |                                   |');
disp([num2str(vg) 'V  =  '  char(915) 'g = ' num2str(gamag) '   ' num2str(r0) char(937) '  ' char(915) 'l = ' num2str(gamal) ' [' num2str(rl) char(937) ']']);
disp('     |                                   |');
disp('     ------------============-------------');

% Calculate histograms for the beak data
% minBeak = min(aux);
% maxBeak = max(aux);
% nbins = minBeak:.5:maxBeak;
% [nB, xB] = hist(aux, nbins);
% % Create a stair plot of beak sizes
% figure
% stairs(nB, xB, 'b')
% % Add title and axis labels
% title('Ground finch beak sizes')
% xlabel('Beak size in mm')
% ylabel('Fraction of birds with beak size')
