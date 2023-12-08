%% Exercise 4.1
% Script matex_4_1.m
%
m = 4; % Number of harmonics to be used.
t = -7:0.01:7; % Create a vector of time instants.
f0 = 1/3; % Fundamental frequency is f0 = 1/3 Hz.
omega0 = 2*pi*f0;
x = 1/3; % Recall that a0=1/3.
% We will start by setting x(t)=a0.
% Start the loop to compute the contribution of each harmonic.
for k = 1:m
    ak = 1/(pi*k)*sin(k*omega0 );
    bk = 1/(pi*k)*(1-cos(k*omega0 ));
    x = x+ak*cos(k*omega0*t)+bk*sin(k*omega0*t);
end
% Graph the resulting approximation to x(t).
clf;
plot(t,x); grid;
title('Approximation using m=4');
xlabel('Time (sec)');
ylabel('Amplitude');

%% Exercise 4.39
% Compute the signal x( t )
A = 1;
T0 = 1;
xp = @( t ) A*( t <=T0/2)-A*( t >T0 / 2) ; % One period
t = [ -1.5:0.005:2 .5];
x = xp(mod( t , T0 ) ) ;
% Compute the approximation
b1 = 4*A/pi ;
b2 = 0;
b3 = 4*A/(3* pi );
b4 = 0;
b5 = 2*A/(5*pi);
f0 = 1/T0 ;
xhat = b1* sin (2* pi * f0 * t )+b2* sin (4* pi * f0 * t )+b3* sin (6* pi * f0 * t )+b4* sin (8* pi * f0 * t )+b5* sin (10* pi * f0 * t ) ;
% Graph the signal and the approximation
plot ( t , x , t , xhat ) ;
axis ([ -1.5 ,2.5 , -1.6 ,2.4]);
title('The signal x( t ) and i t    s approximation ' ) ;
xlabel ( ' t ( sec ) ' ) ;
legend( ' Original signal ' , 'Approximation ' ) ;
grid ;


%% Exercise 4.40
% Compute the signal x ( t )
A = 1;
xp = @( t ) A*( t<=0.3); % One period
t =  -1.5:0.005:2.5 ;
x = xp (mod( t , 1 ) ) ;
% Compute the approximation
a0 = 0.3*A;
a1 = A* sin ( 0.6* pi )/ pi ;
b1 = A*(1-cos ( 0.6* pi ) ) / pi ;
xhat = a0+a1* cos (2* pi * t )+b1* sin (2* pi * t ) ;
% Graph the signal and the approximation
plot ( t , x , t , xhat ) ;
axis ([ -1.5 ,2.5 , -0.5 ,1.8]);
title( 'The signal x ( t ) and i t s approximation ' ) ;
xlabel ( ' t ( sec )' ) ;
legend( ' Original signal ' , ' Approximation ' ) ;
grid ;


%% Exercise 4.41
% Compute the signal x ( t )
xp = @( t ) 2*( t <1)+1*(( t >=1)&(t <=2)); % One period
t = -4:0.005:6;
x = xp (mod( t , 3 ) ) ; % Periodic extension
% Compute the c o e f f i c i e n t s
k =  1 : 10  ;
a0 = 1;
a = ( sin (2* pi *k/3)+ sin (4* pi *k / 3 ) )./( pi *k ) ;
b = (2-cos (2* pi *k/3)-cos (4* pi *k / 3 ) )./( pi *k ) ;
% Approximation with M=3 harmonics
xhat = a0*ones( size ( t ) ) ;
for m=1:3 
xhat = xhat+a(m) * cos (2* pi *m* t /3)+b(m) * sin (2* pi *m* t / 3 ) ;
end 
plot ( t , x , t , xhat ) ;
axis ([ -3 ,3 , -1 ,3.5]);
xlabel ( ' t ' ) ;
legend( ' Original signal ' , 'Approx . with M=3 ' ) ;
grid ;
% Approximation e r r o r f o r M=3
plot ( t , x-xhat ) ;
axis ([ -3 ,3 , -1.2 ,1.2]);
xlabel ( ' t ' ) ;
grid ;

%% Exercise 4.42
% The code below computes and graphs the original signal, the approximation using M = 3
% harmonics, and the approximation error.
% Compute the signal x ( t )
xp = @( t ) exp(-2*t ) ; % One period
t =  -1: 0.005: 2 ;
x = xp (mod( t , 1 ) ) ; % Periodic extension
% Compute the EFS c o e f f i c i e n t s
k =  1 : 10  ;
a0 = 0.4323;
a = 3.4587./ ( 4+ 4* pi * pi *k .* k ) ;
b = 3.4587* pi *k./ ( 4+ 4* pi *pi *k .* k ) ;
% Approximation with M=3 harmonics
xhat = a0*ones(size(t)) ;
for m= 1:3 
xhat = xhat+a(m)*cos ( 2* pi *m*t )+b(m)*sin ( 2* pi *m*t ) ;
end 
plot ( t , x , t , real ( xhat ) ) ;
axis ( [ -1 , 2 , -0.2 , 1.8 ] );
xlabel ( 't' ) ;
legend( 'O riginal signal ' , ' Approx . with M=3 ' ) ;
grid ;
% Approximation e r r o r f o r M=3
plot ( t , x-real ( xhat ) ) ;
axis ( [ -1 , 2 , -0.5 , 0.5 ] );
xlabel ( 't ') ;
grid ;
%To use M = 4 harmonics, modify line 12 as
% 12 for m= 1:4 ,
% To use M = 5 harmonics, modify it as
% 12 for m= 1:5 ,

%% Exercise 4.43
% Compute and graph the l i n e spectrum f o r d=0.4
k =  -20:20;
d = 0.4 ;
l = sym(k*d);
c = d*sinc(l) ;
stem( k , c ) ;
axis ([ -20.5 ,20.5 , -0.3 ,1.2]);
title(' c_k ' ) ;
xlabel ( 'k ' ) ;
grid ;

%% Exercise 4.44
% The code below computes and graphs the original signal and 
% its approximation using M = 2harmonics.
% Compute the half−wave rectified sinusoid
t =  -0.25: 0.005: 2.25 ;
xp = @(t) sin ( 2* pi *t ).*( t <= 0.5 ); % One period
x = xp (mod( t , 1 ) ) ;
% Compute the CFS c o e f f i c i e n t s f o r k = 0 , . . . , 1 0
k =  1 : 10  ;
dk = zeros ( size ( k ) ) ;
d0 = 1/pi ; % d0 = c0
dk ( 1 ) = 0.5 ;
for m= 2:2:100 
dk (m) = 2/ ( pi *(m*m-1 ) );
end 
theta = zeros ( size ( k ) ) ;
theta ( 1 ) = -pi / 2;
for m = 2: 2: 100 
theta (m) = pi ;
end 
% Compute and graph the approximation using M=2 harmonics
omg0 = 2*pi ;
xhat = d0*ones ( size ( t ) ) ;
for m= 1:100
xhat = xhat+dk (m) *cos(m*omg0*t + theta(m) ) ;
end 
plot ( t , x , t , xhat , 'r' ) ;
axis ( [ -0.25 , 2.25 , -0.2 , 1.8 ] );
xlabel ( 't' ) ;
legend( 'O riginal signal ' , ' Approx . fo r M=2 ' ) ;
grid ;
%To use M = 4 harmonics, modify line 21 as
% 21 for m= 1:4 ,
% To use M = 6 harmonics, modify it as
% 21 for m= 1:6 ,

%% Exercise 4.45
% Anonymous function to compute the transform o f a pulse
P = @( f , tau ) tau * sinc ( sym(f * tau) ) ;
% Compute and graph the transform o f modulated pulse
tau = 3 ;
f0 = 2 ;
f =  -4 : 0.005 : 4  ;
X = 0.5*P( f +f0 , tau ) + 0.5*P ( f-f0 , tau ) ;
plot ( f , X ) ;
axis ( [ -4 , 4 , -0.6 , 2] ) ;
title ( 'X( f ) ' ) ;
xlabel ( ' f (Hz) ' ) ;
grid ;

% Parts (a) through (d) of Problem 4.27 can be verified using following code listings:
% V e r i f y part (a ) of Problem 4.27
f =  -12:0.02:12;
X1 = 0.5* sinc ( sym(f+5))+0.5* sinc( sym(f-5) );
plot ( f , X1 ) ;
grid ;
axis ([ -12 ,12 , -0.3 ,1.2]);
title ( 'X( f ) ' ) ;
xlabel ( ' f (Hz) ' ) ;

% V e r i f y part (b ) of Problem 4.27 
X2 = sinc (sym(2* f +10))+ sinc (sym(2* f -10));
plot ( f , X2 ) ;c;
grid ;
axis ([ -12 ,12 , -0.3 ,1.2]);
title ( 'X( f ) ' ) ;
xlabel ( ' f (Hz) ' ) ;

 % V e r i f y part ( c ) of Problem 4.27
X3 = 0.25* sinc ( sym(( f +5)/2))+0.25* sinc ( sym(( f-5)/2));
plot ( f , X3 ) ;
grid ;
axis ([ -12 ,12 , -0.3 ,1.2]);
title ( 'X( f ) ' ) ;
xlabel ( ' f (Hz) ' ) ;

% V e r i f y part (d) of Problem 4.27
X4 = 0.125* sinc ( sym(( f +5)/4))+0.125* sinc ( sym(( f -5)/4));
plot ( f , X4 ) ;
grid ;
axis ([ -12 ,12 , -0.3 ,1.2]);
title ( 'X( f ) ' ) ;
xlabel ( ' f (Hz) ' ) ;

%% Exercise 4.46
% Compute the EFS coefficients
d = 0.5 ;
k =  -25:25;
c = d* sinc ( sym(k*d) ) ;
offset = -k (1)+1; % MATLAB index of center c o e f f i c i e n t " c0 "
% Set f0 = 1 Hz and c r e a t e a time vector .
f0 = 1;
t =  -2:0.005:2;
% Compute the signal f o r M=1
m = 1;
xhat = zeros ( size ( t ) ) ;
for i=-m:m
xhat = xhat+c ( i + offset ) * exp( 1i *2* pi * i * f0 * t ) ;
end 
plot ( t , real ( xhat ) ) ;
axis ([ -2 ,2 , -0.2 ,1.2]);
grid ;