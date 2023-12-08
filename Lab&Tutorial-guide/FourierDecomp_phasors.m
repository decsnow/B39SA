% Fourier series animation using phasor addition

function FourierDecomp
global delx1 delx2 dely1 dely2 DELX1 DELX2 DELY1 DELY2 xLCf1 yLCf1 xLCf2 ...
       yLCf2 minXf1 minXf2 minYf1 minYf2

   
close all
    t = 0:pi/50:6*pi;
    X1 = 4*cos(t)/pi;
    Y1 = 4*sin(t)/pi;
    X2 = 4*cos(3*t)/(3*pi);
    Y2 = 4*sin(3*t)/(3*pi);
    X3 = 4*cos(5*t)/(5*pi);
    Y3 = 4*sin(5*t)/(5*pi);
    X4 = 4*cos(7*t)/(7*pi);
    Y4 = 4*sin(7*t)/(7*pi);
    
    Yf  = [];
    N   = 50;
    X2s = linspace(0,4/pi,N);
    X3s = linspace(0,4/pi + 4/(3*pi),N);
    X4s = linspace(0,4/pi + 4/(3*pi) + 4/(5*pi),N);
    
    xLCf1 = 0.0300;
    yLCf1 = 0.1600;
    Wf1   = 0.3230;
    Hf1   = 0.6800;
    
    xLCf2 = 0.4030;
    yLCf2 = 0.1600;
    Wf2   = 0.5670;
    Hf2   = 0.6800;
    
    minXf1 = -2.5;
    maxXf1 = 2.5;
    minYf1 = -2.5;
    maxYf1 = 2.5;
    
    minXf2 = 0;
    maxXf2 = 20;
    minYf2 = -2.5;
    maxYf2 = 2.5;
    
    POS = [xLCf1 yLCf1 Wf1 Hf1
           xLCf2 yLCf2 Wf2 Hf2];
       
    delx1 = maxXf1 - minXf1;
    delx2 = maxXf2 - minXf2;

    dely1 = maxYf1 - minYf1;
    dely2 = maxYf2 - minYf2;

    DELX1 = Wf1;
    DELX2 = Wf2;

    DELY1 = Hf1;
    DELY2 = Hf2;

 
 figure('units','normalized','outerposition',[0 0.05 1 0.95])
 set(gcf,'color','w');
 pause(20)
for n = 2:numel(t) + N
    if n <= numel(t)
        h = subplot(1,2,1);
        plot(X1,Y1,'b','Linewidth',2); hold on
        plot(X2,Y2,'r','Linewidth',2);
        plot(X3,Y3,'g','Linewidth',2);
        plot(X4,Y4,'k','Linewidth',2); 
        plot([0,X1(n)],[0,Y1(n)],'.-b','Linewidth',2,'MarkerSize',15);
        plot([0,X2(n)],[0,Y2(n)],'.-r','Linewidth',2,'MarkerSize',15);
        plot([0,X3(n)],[0,Y3(n)],'.-g','Linewidth',2,'MarkerSize',15);
        plot([0,X4(n)],[0,Y4(n)],'.-k','Linewidth',2,'MarkerSize',15); hold off
        grid on
        axis([minXf1,maxXf1,minYf1,maxYf1])
        title('Harmonic Circle','FontSize',12)
        set(gca,'FontSize',12)
        set(h,'pos',POS(1,:));

        h = subplot(1,2,2);
        plot(t(1:n),Y1(1:n),'-b','Linewidth',2); hold on
        plot(t(1:n),Y2(1:n),'-r','Linewidth',2);
        plot(t(1:n),Y3(1:n),'-g','Linewidth',2);
        plot(t(1:n),Y4(1:n),'-k','Linewidth',2); 
        plot(t(n),Y1(n),'.b','MarkerSize',15); 
        plot(t(n),Y2(n),'.r','MarkerSize',15);
        plot(t(n),Y3(n),'.g','MarkerSize',15);
        plot(t(n),Y4(n),'.k','MarkerSize',15); hold off
        
        C = [screenloc([X1(n),Y1(n)],1),screenloc([t(n),Y1(n)],2)];
        h1 = annotation('line',C(1,:),C(2,:),'Tag' , 'connect1');
        set(h1, 'LineStyle','--'); set(h1, 'Color','b'); 
        C = [screenloc([X2(n),Y2(n)],1),screenloc([t(n),Y2(n)],2)];
        h2 = annotation('line',C(1,:),C(2,:),'Tag' , 'connect2');
        set(h2, 'LineStyle','--'); set(h2, 'Color','r'); 
        C = [screenloc([X3(n),Y3(n)],1),screenloc([t(n),Y3(n)],2)];
        h3 = annotation('line',C(1,:),C(2,:),'Tag' , 'connect3');
        set(h3, 'LineStyle','--'); set(h3, 'Color','g'); 
        C = [screenloc([X4(n),Y4(n)],1),screenloc([t(n),Y4(n)],2)];
        h4 = annotation('line',C(1,:),C(2,:),'Tag' , 'connect4');
        set(h4, 'LineStyle','--'); set(h4, 'Color','k'); 
        
        grid on
        axis([minXf2,maxXf2,minYf2,maxYf2])
        title('Harmonics','FontSize',12)
        xlabel('x','FontSize',12)
        set(gca,'FontSize',12)
        set(h,'pos',POS(2,:));
    else
        np = n - numel(t);
        h = subplot(1,2,1);
        plot(X1,Y1,'b','Linewidth',2); hold on
        plot(X2s(np) + X2,Y2,'r','Linewidth',2);
        plot(X3s(np) + X3,Y3,'g','Linewidth',2);
        plot(X4s(np) + X4,Y4,'k','Linewidth',2);  
        plot([0,X1(end)],[0,Y1(end)],'.-b','Linewidth',2,'MarkerSize',15);
        plot([X2s(np),X2s(np) + X2(end)],[0,Y2(end)],'.-r','Linewidth',2,'MarkerSize',15);
        plot([X3s(np),X3s(np) + X3(end)],[0,Y3(end)],'.-g','Linewidth',2,'MarkerSize',15);
        plot([X4s(np),X4s(np) + X4(end)],[0,Y4(end)],'.-k','Linewidth',2,'MarkerSize',15); hold off
        
        grid on
        axis([minXf1,maxXf1,minYf1,maxYf1])
        title('Harmonic Circle','FontSize',12)
        set(gca,'FontSize',12)
        set(h,'pos',POS(1,:));
        
        h = subplot(1,2,2);
        plot(t,Y1,'-b','Linewidth',2); hold on
        plot(t,Y2,'-r','Linewidth',2);
        plot(t,Y3,'-g','Linewidth',2);
        plot(t,Y4,'-k','Linewidth',2); hold off
        grid on
        axis([minXf2,maxXf2,minYf2,maxYf2])
        title('Harmonics','FontSize',12)
        xlabel('x','FontSize',12)
        set(gca,'FontSize',12)
        set(h,'pos',POS(2,:));
    end 
    drawnow
    delete(findall(gcf,'Tag','connect1'))
    delete(findall(gcf,'Tag','connect2'))
    delete(findall(gcf,'Tag','connect3'))
    delete(findall(gcf,'Tag','connect4'))
end


for n = 1:numel(t)
    X11 = X1 ; Y11 = Y1;
    X22 = X11(n) + X2; Y22 = Y11(n) + Y2;
    X33 = X22(n) + X3; Y33 = Y22(n) + Y3;
    X44 = X33(n) + X4; Y44 = Y33(n) + Y4;
    
    h = subplot(1,2,1);
    plot(X11,Y11,'b','Linewidth',2); hold on
    plot(X22,Y22,'r','Linewidth',2);
    plot(X33,Y33,'g','Linewidth',2);
    plot(X44,Y44,'k','Linewidth',2);  
    plot([0,X11(n)],[0,Y11(n)],'.-b','Linewidth',2);
    plot([X11(n),X22(n)],[Y11(n),Y22(n)],'.-r','Linewidth',2);
    plot([X22(n),X33(n)],[Y22(n),Y33(n)],'.-g','Linewidth',2);
    plot([X33(n),X44(n)],[Y33(n),Y44(n)],'.-k','Linewidth',2); hold off   
    grid on
    axis([minXf1,maxXf1,minYf1,maxYf1])
    title('Harmonics','FontSize',12)
    set(gca,'FontSize',12)
    set(h,'pos',POS(1,:));
    
    h = subplot(1,2,2);
    Yf = [Yf,Y44(n)];
    plot(t(1:n),Yf(1:n),'m','Linewidth',2); hold on
    plot(t(n),Yf(n),'.m','MarkerSize',15); hold off
    grid on
    title('Summation of first four Harmonics','FontSize',12)
    xlabel('x','FontSize',12)
    set(gca,'FontSize',12)
    axis([minXf2,maxXf2,minYf2,maxYf2])
    set(h,'pos',POS(2,:));
    
    C = [screenloc([X44(n),Y44(n)],1),screenloc([t(n),Yf(n)],2)];
    h1 = annotation('line',C(1,:),C(2,:),'Tag' , 'connect1');
    set(h1, 'LineStyle','--'); set(h1, 'Color','m'); 
    
    drawnow
    delete(findall(gcf,'Tag','connect1'))
end

function C = screenloc(aC,aID)
global delx1 delx2 dely1 dely2 DELX1 DELX2 DELY1 DELY2 xLCf1 yLCf1 xLCf2 ...
       yLCf2 minXf1 minXf2 minYf1 minYf2
x = aC(1); y = aC(2);
if aID == 1
    X = xLCf1 + (x - minXf1)/delx1*DELX1;
    Y = yLCf1 + (y - minYf1)/dely1*DELY1;
else
    X = xLCf2 + (x - minXf2)/delx2*DELX2;
    Y = yLCf2 + (y - minYf2)/dely2*DELY2;
end
C = [X;Y];

    