function A = A_jumping_leg(in1,in2)
%A_JUMPING_LEG
%    A = A_JUMPING_LEG(IN1,IN2)

%    This function was generated by the Symbolic Math Toolbox version 8.7.
%    02-Dec-2021 14:19:37

I1 = in2(8,:);
I2 = in2(9,:);
c1 = in2(3,:);
c2 = in2(4,:);
l1 = in2(1,:);
l2 = in2(2,:);
m1 = in2(5,:);
m2 = in2(6,:);
mh = in2(7,:);
th1 = in1(2,:);
th2 = in1(3,:);
t2 = cos(th1);
t3 = sin(th1);
t4 = th1+th2;
t5 = c1.^2;
t6 = c2.^2;
t7 = l2.^2;
t8 = l1.*t2;
t9 = cos(t4);
t10 = l1.*t3;
t11 = sin(t4);
t12 = c1.*m1.*t2;
t13 = t8.*2.0;
t14 = t9.^2;
t15 = t11.^2;
t16 = c2.*t9;
t17 = l2.*t9;
t18 = c2.*t11;
t19 = l2.*t11;
t20 = t16.*2.0;
t21 = t17.*2.0;
t22 = m2.*t16;
t23 = mh.*t17;
t24 = t8+t16;
t25 = t8+t17;
t26 = t10+t18;
t27 = t10+t19;
t28 = t13+t20;
t29 = t13+t21;
t30 = t22+t23;
t31 = t18.*t26.*2.0;
t32 = t19.*t27.*2.0;
t35 = t20.*t24;
t36 = t21.*t25;
t33 = (m2.*t28)./2.0;
t34 = (mh.*t29)./2.0;
t37 = t31+t35;
t38 = t32+t36;
t39 = (m2.*t37)./2.0;
t40 = (mh.*t38)./2.0;
t41 = t12+t33+t34;
t42 = t39+t40;
A = reshape([m1+m2+mh,t41,t30,t41,I1+(m1.*(t2.^2.*t5.*2.0+t3.^2.*t5.*2.0))./2.0+(m2.*(t24.^2.*2.0+t26.^2.*2.0))./2.0+(mh.*(t25.^2.*2.0+t27.^2.*2.0))./2.0,t42,t30,t42,I2+(m2.*(t6.*t14.*2.0+t6.*t15.*2.0))./2.0+(mh.*(t7.*t14.*2.0+t7.*t15.*2.0))./2.0],[3,3]);
