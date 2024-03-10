function [ N ] = BezierAnimacion( dim, N ,Pts,Name )
%Hace una animacion de la construccion de una curva de bezier
%dim es la dimension de los P, si estan en el plnano dim = 2 y en el espacio dim = 3
%N es el numero de puntos que se dan de referencia
%P es la martriz de los puntos de referencia
%Name es la cadena de caracteres que corresponde al nombre del video que se va a guardar

writerObj = VideoWriter(Name);
open(writerObj);

P = zeros(dim,N, N);
P(:,1:N, 1) = Pts;

inc = 1/100;
for t = 0:inc:1;
  if dim == 2  
    plot(P(1,1:N, 1),P(2,1:N, 1));
    hold on;
    plot(P(1,1:N, 1),P(2,1:N, 1),'ob');
  else  
    plot3(P(1,1:N, 1),P(2,1:N, 1),P(3,1:N, 1));
    hold on;
    plot3(P(1,1:N, 1),P(2,1:N, 1),P(3,1:N, 1),'ob');
  end
    for k = 2: N
        for i = 1:(N - k + 1)
            P(:,i,k) = PolBezier(k-1, P(:,i:(i+k-1),1), t, dim);
        end
        if dim == 2
            plot(P(1,1:(N - k + 1),k),P(2,1:(N - k + 1),k));
            axis([min(P(1,1:N, 1)),max(P(1,1:N, 1)),min(P(2,1:N, 1)),max(P(2,1:N, 1))]);
        else
            plot3(P(1,1:(N - k + 1),k),P(2,1:(N - k + 1),k),P(3,1:(N - k + 1),k));
            axis([min(P(1,1:N, 1)),max(P(1,1:N, 1)),min(P(2,1:N, 1)),max(P(2,1:N, 1)),min(P(3,1:N, 1)),max(P(3,1:N, 1))]);
        end    
        hold on;    
    end
    Curve = zeros(dim,round(t/inc + 1));
    for s = 0:inc:t;
        Curve(:,round(s/inc+1)) =  PolBezier(N-1, P(:,1:N,1), s, dim)
    end
    if dim == 2
            plot(Curve(1,:),Curve(2,:),'r');
        else
            plot3(Curve(1,:),Curve(2,:),Curve(3,:),'r');
        end 
    grid on;
    hold off;
pause(0.01)    
frame = getframe;
    writeVideo(writerObj,frame);
end
close(writerObj);

end

