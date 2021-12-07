function COM = COM_jumping_leg(in1,in2)
%COM_JUMPING_LEG
%    COM = COM_JUMPING_LEG(IN1,IN2)

%    This function was generated by the Symbolic Math Toolbox version 6.1.
%    16-Oct-2015 09:57:43

c1 = in2(2,:);
c2 = in2(3,:);
dth = in1(4,:);
dy = in1(3,:);
l = in2(1,:);
m1 = in2(4,:);
m2 = in2(5,:);
mh = in2(6,:);
th = in1(2,:);
y = in1(1,:);
t2 = cos(th);
t3 = sin(th);
t4 = m1+m2+mh;
t5 = 1.0./t4;
t6 = c2.*t3;
t7 = l.*t3;
t8 = c2.*t2;
COM = [-t5.*(m2.*(t8-l.*t2)-c1.*m1.*t2);t5.*(m2.*(t6+t7+y)+m1.*(y+c1.*t3)+mh.*(y+l.*t3.*2.0));dth.*t5.*(m2.*(t6-t7)-c1.*m1.*t3);dy+dth.*t5.*(m2.*(t8+l.*t2)+c1.*m1.*t2+l.*mh.*t2.*2.0)];