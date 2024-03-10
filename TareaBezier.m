clear all;
close all;

dim = 3;
N = 5%7;
Puntos = [0 10 30 40 70;-13 18 -2 12 -6; 21 12 18 -42 27];%21 12 18 -42 27 34

figure(1)
BezierAnimacion(2,N,Puntos(1:2,:),'Bezier5puntos.mp4');
pause(1);
figure(2)
BezierAnimacion(3,N,Puntos(1:3,:),'BezierPrueba3D.mp4');
