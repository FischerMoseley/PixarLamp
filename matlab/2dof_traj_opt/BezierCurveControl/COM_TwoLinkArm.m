function COM = COM_TwoLinkArm(in1,in2)
%COM_TWOLINKARM
%    COM = COM_TWOLINKARM(IN1,IN2)

%    This function was generated by the Symbolic Math Toolbox version 5.10.
%    23-Oct-2013 01:04:35

dth1 = in1(2,:);
dth2 = in1(4,:);
l = in2(1,:);
m1 = in2(2,:);
m2 = in2(3,:);
th1 = in1(1,:);
th2 = in1(3,:);
t2 = cos(th1);
t3 = m1+m2;
t4 = 1.0./t3;
t5 = sin(th1);
t6 = m1.*t5.*(1.0./2.0);
t7 = sin(th2);
t8 = m1.*t2.*(1.0./2.0);
t9 = cos(th2);
COM = [t4.*(t8+m2.*(t9.*(1.0./2.0)+l.*t2));t4.*(t6+m2.*(t7.*(1.0./2.0)+l.*t5));-dth1.*t4.*(t6+l.*m2.*t5)-dth2.*m2.*t4.*t7.*(1.0./2.0);dth1.*t4.*(t8+l.*m2.*t2)+dth2.*m2.*t4.*t9.*(1.0./2.0)];
