%   Daniel Wijaya
%   27/10/2018
%   AERO Advanced McGill
%   output desired airfoil geometry based on several predefined points into
%   files read into solidworks macro

%define airfoil shapes
e423 =   [12           0
     11.959     0.01908
     11.845       0.078
     11.676     0.17208
     11.464     0.28572
     11.203     0.40512
     10.888       0.528
     10.521     0.65772
     10.107      0.7944
     9.6523     0.93636
     9.1648      1.0812
     8.6508      1.2258
     8.1173      1.3669
      7.571      1.5007
     7.0189      1.6229
     6.4672      1.7292
     5.9216      1.8139
     5.3844      1.8712
     4.8557      1.8994
     4.3379      1.8989
     3.8336      1.8708
     3.3462      1.8166
     2.8784      1.7382
     2.4343      1.6388
     2.0179      1.5211
     1.6333      1.3874
      1.284      1.2404
    0.97272      1.0828
    0.70224     0.91752
    0.47436     0.74784
    0.29052     0.57744
    0.15144     0.41028
    0.05772     0.25116
    0.00852     0.10548
    0.00024     0.01056
    0.00396    -0.02304
    0.00852    -0.04344
      0.015    -0.06216
    0.01884     -0.0708
    0.02328    -0.07872
    0.02844    -0.08604
    0.03456    -0.09252
    0.04176    -0.09876
     0.0498    -0.10488
    0.06852    -0.11628
    0.09012    -0.12684
     0.1278    -0.14124
     0.1638    -0.15192
    0.34704     -0.1782
    0.59364    -0.17784
    0.90396    -0.14832
     1.2804     -0.0888
     1.7262    -0.00024
     2.2472     0.11064
     2.8426     0.22956
     3.5035      0.3438
     4.2196     0.44244
     4.9739     0.51396
      5.744     0.55512
      6.513      0.5712
     7.2695      0.5658
     8.0028     0.54012
     8.7004     0.49512
     9.3494       0.435
     9.9403       0.366
     10.466     0.29328
     10.921     0.22128
     11.301     0.15432
     11.603     0.09528
     11.822      0.0468
     11.955     0.01272
         12           0];
ls417 = [       12              -0.09396           
     11.7               0.07248           
     11.4               0.15444           
     11.1                0.2358           
     10.8               0.31668           
     10.5               0.39756           
     10.2               0.47796           
      9.9               0.55728           
      9.6               0.63492           
      9.3               0.70956           
        9               0.78204           
      8.7               0.85152           
      8.4               0.91668           
      8.1               0.97728           
      7.8                1.0325           
      7.5                1.0816           
      7.2                1.1249           
      6.9                1.1609           
      6.6                  1.19           
        6                1.2323           
      5.4                1.2547           
      4.8                  1.26           
      4.2                1.2491           
      3.6                1.2203           
        3                1.1734           
      2.4                1.1051           
      2.1                1.0618           
      1.8                1.0096           
      1.5               0.94908           
      1.2               0.87708           
      0.9               0.78732           
      0.6                 0.672           
     0.45               0.59688           
      0.3                0.4998           
     0.15               0.36828           
     0.06                0.2442           
    0.024                 0.156           
        0                     0           
    0.024              -0.11688           
     0.06              -0.17328           
     0.15              -0.24624           
      0.3              -0.32292           
     0.45              -0.38292           
      0.6              -0.42828           
      0.9              -0.50508           
      1.2                -0.564           
      1.5              -0.61044           
      1.8              -0.65112           
      2.1                -0.684           
      2.4              -0.71112           
        3               -0.7518           
      3.6              -0.77376           
      4.2              -0.78204           
      4.8              -0.77796           
      5.4              -0.76128           
        6              -0.73092           
      6.6              -0.68196           
      6.9              -0.64752           
      7.2              -0.60732           
      7.5              -0.56136           
      7.8               -0.5118           
      8.1               -0.4596           
      8.4              -0.40596           
      8.7               -0.3516           
        9              -0.29532           
      9.3               -0.2436           
      9.6              -0.19044           
      9.9              -0.14292           
     10.2              -0.10224           
     10.5               -0.0678           
     10.8              -0.04224           
     11.1              -0.02976           
     11.4              -0.03084           
     11.7              -0.04752           
       12              -0.09396];

% start actual thing: need to define: note values in feet
%   b1, b2, b3, b4 (only thing that really corresponds to diagram)
%   cB, cR, cT
%   x1, x2
%   alpha1, alpha2, alpha3
%also later will have to normalize top (max value of each airfoil) to same
%value (probably set to y = 0)

%can ask for input params later
b = zeros(1,4); z = [0,zeros(1,4)];
for i=1:4
    prompt = ['b', num2str(i), ' (in feet):\n'];
    b(i) = input(prompt);
    z(i+1) = 12*sum(b(1:i));
end
%span: req. b(1:4)
%{
b(1) = 0.8;
b(2) = 0.8;
b(3) = 2.075;
b(4) = 2.075;

for i=1:4
    z(i+1) = 12*sum(b(1:i));
end
%}
%chord req. req the one parameter for x(3:5)
c = zeros(5,1); x = c;
for i=1:5
    prompt = ['c', num2str(i), ' (in feet):\n'];
    c(i) = input(prompt);
    prompt = ['x', num2str(i), ' (in feet):\n'];
    x(i) = 12*input(prompt);
end
%{
c(1:2) = 1.46;
c(3:4) = 1;
c(5) = 0.85;

x(1) = 0;
x(2) = 0;
x(3:5) = 0.25*12;
%}
%rotation (input in degrees): need alphadeg(1,2,4)
alphaDeg = zeros (1,5);
for i = 1:3
    prompt = ['AOI ', num2str(i), ' (in degrees):\n'];
    alphaDeg(2*i-1) = input(prompt);
end
alphaDeg(1) = 3;
alphaDeg(2) = alphaDeg(1);
alphaDeg(3) = 0.755;
alphaDeg(5) = -1.245;
alphaDeg(4) = alphaDeg(3) - (alphaDeg(5)-alphaDeg(3)) * b(3)/(b(3)+b(4));
alpha = -alphaDeg*pi/180;


af1 = airfoilManipulator (ls417, c(1), alpha(1), x(1), z(1));
af2 = airfoilManipulator (ls417, c(2), alpha(2), x(2), z(2));
af3 = airfoilManipulator (e423, c(3), alpha(3), x(3), z(3));
af4 = airfoilManipulator (e423, c(4), alpha(4), x(4), z(4));
af5 = airfoilManipulator (e423, c(5), alpha(5), x(5), z(5));

endpts = [af1(end,:),af2(end,:),af3(end,:),af4(end,:),af5(end,:)];

hold on
axis equal
plot3(af1(:,1),af1(:,2),af1(:,3));
plot3(af2(:,1),af2(:,2),af2(:,3));
plot3(af3(:,1),af3(:,2),af3(:,3));
plot3(af4(:,1),af4(:,2),af4(:,3));
plot3(af5(:,1),af5(:,2),af5(:,3));

dlmwrite('af1.sldcrv', af1, 'delimiter','\t','newline','pc');
dlmwrite('af2.sldcrv', af2, 'delimiter','\t','newline','pc');
dlmwrite('af3.sldcrv', af3, 'delimiter','\t','newline','pc');
dlmwrite('af4.sldcrv', af4, 'delimiter','\t','newline','pc');
dlmwrite('af5.sldcrv', af5, 'delimiter','\t','newline','pc');
dlmwrite('endpts.txt', endpts, 'delimiter','\t','newline','pc');

