clear all 
hold on 

x = [0:1:11];
y2 = [255*9.81 254*9.81 273*9.81 277*9.81 333*9.81 321*9.81 318*9.81 317*9.81 313*9.81 308*9.81 207*9.81 218*9.81];
y2=y2./1000;
%plot (x,y2) 
xlabel('Time/s')
ylabel('Force/N')
title('Test 11')

x = [0:1:11];
y3 = [244*9.81 289*9.81 282*9.81 322*9.81 337*9.81 331*9.81 322*9.81 314*9.81 307*9.81 310*9.81 218*9.81 212*9.81];
y3=y3./1000;
%plot (x,y3) 
xlabel('Time/s')
ylabel('Force/N')
title('Test 8')  

x = [0:1:11];
y4 = [235*9.81 295*9.81 319*9.81 331*9.81 328*9.81 318*9.81 314*9.81 306*9.81 210*9.81 219*9.81 215*9.81 212*9.81];
y4=y4./1000;
%plot (x,y4) 
xlabel('Time/s')
ylabel('Force/N')
title('Test 9') 

x = [0:1:11];
y5 = [205*9.81 273*9.81 325*9.81 326*9.81 327*9.81 316*9.81 314*9.81 317*9.81 309*9.81 275*9.81 213*9.81 211*9.81];
y5=y5./1000;
%plot (x,y5) 
xlabel('Time/s')
ylabel('Force/N')
title('Test 10')  

x = [0:1:11];
y6 = [240*9.81 300*9.81 299*9.81 314*9.81 322*9.81 309*9.81 310*9.81 310*9.81 325*9.81 209*9.81 214*9.81 210*9.81];
y6=y6./1000;
%plot (x,y6) 
xlabel('Time/s')
ylabel('Force/N')
title('Average')

%%Average Force
z= (y2+y3+y4+y5+y6)./5 ;
plot(z)