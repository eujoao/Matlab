clc
clear 

ZL = input('Digite o valor de ZL formato(r+xi): ');
Z0 = input('Digite o valor de Z0: ');
f = input('Digite a frequência de operação em [GHz]: ');

f = f*1e9;
c = 3*1e8;

disp('1 - REDE EM L: ');
disp('2 - TOCO SIMPLES EM PARALELO: ');
disp('3 - TOCO SIMPLES EM SÉRIE: ');
disp('4 - TRANFORMADOR DE QUARTO DE ONDA: ');
n = input('Qual método de casamento será utilizado: ');

switch(n)
%REDE EM L=================================================================
    case 1
        RL = real(ZL);
        XL = imag(ZL);
        w = 2*pi*f;

        if RL > Z0
            num1 = XL + sqrt(RL/Z0)*sqrt(RL^2+XL^2-Z0*RL);
            num2 = XL - sqrt(RL/Z0)*sqrt(RL^2+XL^2-Z0*RL);
            den = RL^2 + XL ^2;
    
            B1 = num1/den;
            B2 = num2/den;
    
            X1 = (1/B1)+(XL*Z0)/RL - Z0/(B1*RL);
            X2 = (1/B2)+(XL*Z0)/RL - Z0/(B2*RL);
    
            b1 = B1*Z0;
            x1 = X1/Z0;
            b2 = B2*Z0;
            x2 = X2/Z0;
    
            format shortE
            C1 = b1/(w*Z0);
            L1 = x1*Z0/(w);
            C2 = -1/(x2*Z0*w);
            L2 = -Z0/(b2*w);
            clc
            disp('Rede de casamento em L (RL > Z0)');
            disp(['C1 = ' num2str(C1) 'F e L1 = ' num2str(L1,3) 'H com C1||ZL']);
            disp(['C2 = ' num2str(C2) 'F e L2 = ' num2str(L2,3) 'H com L2||ZL']);
            disp('    ');
            disp('--------[jX]-----------');
            disp('              |       |');
            disp('Z0           [jB]    [ZL]');
            disp('              |       |');
            disp('-----------------------');
        elseif RL < Z0
            X1 = sqrt(RL*(Z0-RL))-XL;
            X2 = (-1)*sqrt(RL*(Z0-RL))-XL;
    
            B1 = sqrt((Z0-RL)/RL)/Z0;
            B2 = (-1)*sqrt((Z0-RL)/RL)/Z0;
    
            b1 = B1*Z0;
            x1 = X1/Z0;
            b2 = B2*Z0;
            x2 = X2/Z0;
    
            format shortE
            C1 = b1/(w*Z0);
            L1 = x1*Z0/(w);
            C2 = -1/(x2*Z0*w);
            L2 = -Z0/(b2*w);
            clc
            disp('Rede de casamento em L (RL < Z0)');
            disp(['C1 = ' num2str(C1) 'F e L1 = ' num2str(L1,3) 'H com C1||ZL']);
            disp(['C2 = ' num2str(C2) 'F e L2 = ' num2str(L2,3) 'H com L2||ZL']);
            disp('    ');
            disp('-------------[jX]------');
            disp('          |           |');
            disp('Z0       [jB]        [ZL]');
            disp('          |           |');
            disp('-----------------------');
        end
%==========================================================================
%TOCO EM PARALELO==========================================================
    case 2 
        RL = real(ZL);
        XL = imag(ZL);
        Y0 = 1/Z0;

        num1 = (XL+sqrt(RL*((Z0-RL)^2+XL^2)/Z0));
        num2 = (XL-sqrt(RL*((Z0-RL)^2+XL^2)/Z0));
        den = RL-Z0;

        t1 = num1/den;
        t2 = num2/den;

        d1 = (1/(2*pi))*atan(t1);
        d2 = (1/(2*pi))*(pi+atan(t2));

        if d1 < 0
            d1 = d1+.5;
        end

        if d2 < 0
            d2 = d2+.5;
        end

        numb1 = (RL^2)*t1-(Z0-XL*t1)*(XL+Z0*t1);
        numb2 = (RL^2)*t2-(Z0-XL*t2)*(XL+Z0*t2);
        denb1 = Z0*(RL^2+(XL+Z0*t1)^2);
        denb2 = Z0*(RL^2+(XL+Z0*t2)^2);

        B1 = numb1/denb1;
        B2 = numb2/denb2;

        l1 = ((-1)/(2*pi))*(atan(Y0/B2))+.25;
        l2 = ((1)/(2*pi))*(pi-atan(Y0/B1))-.25;
        l3 = ((1)/(2*pi))*(pi-atan(B1*Z0))-.25;
        l4 = ((-1)/(2*pi))*(atan(B2*Z0))+.25;
        clc    
        disp('Para um toco em paralelo (OC);')
        disp(['d1=' num2str(round(d1,3)) char(955) ' ou ' num2str(round(d1*(c/f),3)) 'm e l1=' num2str(round(l1,3)) char(955) ' ou ' num2str(round(l1*(c/f),3)) 'm']);
        disp(['d2=' num2str(round(d2,3)) char(955) ' ou ' num2str(round(d2*(c/f),3)) 'm e l2=' num2str(round(l2,3)) char(955) ' ou ' num2str(round(l2*(c/f),3)) 'm']);
        disp('Para um toco em paralelo (CC)');
        disp(['l1=' num2str(round(l3,3)) char(955) ' ou ' num2str(round(l3*(c/f),3)) 'm e l2=' num2str(round(l4,3)) char(955) ' ou ' num2str(round(l4*(c/f),3)) 'm']);
        disp('   ');
        disp('    L / /\          ');
        disp('_____/_/  \________');
        disp('           \        ');
        disp('Y0         /|---d---|[YL]');
        disp('  ________/__________');
%==========================================================================
%TOCO EM SÉRIE=============================================================
    case 3
        YL = 1/ZL;
        Y0 = 1/Z0;
        GL = real(YL);
        BL = imag(YL);

        num11 = BL + sqrt(GL*((Y0-GL)^2+BL^2)/Y0);
        num21 = BL - sqrt(GL*((Y0-GL)^2+BL^2)/Y0);
        den11 = GL-Y0;

        t11 = num11/den11;
        t21 = num21/den11;

        numx1 = (GL^2)*t11-(Y0-BL*t11)*(BL+Y0*t11);
        numx2 = (GL^2)*t21-(Y0-BL*t21)*(BL+Y0*t21);
        denx1 = Y0*((GL^2)+(BL+Y0*t11)^2);
        denx2 = Y0*((GL^2)+(BL+Y0*t21)^2);

        X1 = numx1/denx1;
        X2 = numx2/denx2;


        dx1 = (1/(2*pi))*(pi+atan(t11));
        dx2 = (1/(2*pi))*(atan(t21));

        if dx1 < 0
            dx1 = dx1+.5;
        end

        if dx2 < 0
            dx2 = dx2+.5;
        end

        lx1 = (-1/(2*pi))*atan(Z0/X2);
        lx2 = (1/(2*pi))*(atan(X1/Z0))+.25;
        lx3 = ((-1)/(2*pi))*(atan(Z0/X2))+.25;
        lx4 = ((1)/(2*pi))*(atan(X1/Z0));

        disp('Para um toco em série (OC)');
        disp(['d1=' num2str(round(dx1,3)) char(955) ' ou ' num2str(round(dx1*(c/f),3)) 'm e l1=' num2str(round(lx1,3)) char(955) ' ou ' num2str(round(lx1*(c/f),3)) 'm']);
        disp(['d2=' num2str(round(dx2,3)) char(955) ' ou ' num2str(round(dx2*(c/f),3)) 'm e l2=' num2str(round(lx2,3)) char(955) ' ou ' num2str(round(lx2*(c/f),3)) 'm']);
        disp('Para um toco em série (CC)');
        disp(['l1=' num2str(round(lx3,3)) char(955) ' ou ' num2str(round(lx3*(c/f),3)) 'm e l2=' num2str(round(lx4,3)) char(955) ' ou ' num2str(round(lx4*(c/f),3)) 'm']);
        disp('____________________');
        disp('Z0                  [ZL]');
        disp('________     _______ ');
        disp('     L| |   |---d---|');
        disp('      | |___|');
%==========================================================================
%TRANSFORMADOR DE QUARTO DE ONDA===========================================
    case 4
        RL = real(ZL);
        
        Z1 = sqrt(Z0*RL);
        L = (c/f)/4;
        clc
        disp('TRANSFORMADOR DE QUARTO DE ONDA');
        disp(['Z = ' num2str(Z1) char(8486) ' e L = ' char(955) '/4 ou ' num2str(L) 'm']);

%==========================================================================
end

