function [ Bt ] = PolBezier(Num,P,t,dim)
%Num es el grado del polinomio (numero de puntos -1), P es una matriz de puntos 
%t es el escalar entre 0 y 1
%Bt es una matriz de las coordenadas del punto de bezier 

Bt = zeros(dim,1);
S1 = zeros(dim,1);  
%aqui vamos a calcular la suma 
 
    for j=0:(Num)
      S1= P(:,j+1).*((nchoosek((Num),j)*((1-t)^((Num)-(j)))*(t^(j))));
      S1; %P
      Bt; %P
      Bt = Bt + S1;  
    end  
end

