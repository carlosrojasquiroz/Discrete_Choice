function [Vnew,g_a,g_n]=vfi_step(p,m,V)
%---------------------------------------------------------------------------------------------------------------------------
% This function gets the optimal saving and working policy
%---------------------------------------------------------------------------------------------------------------------------
V1=zeros(1,p.naa);
p1=zeros(1,p.naa);
V0=zeros(1,p.naa);
p0=zeros(1,p.naa);
for d_2=1:p.naa
    % Working state
    c1=p.w*m.z_grid+(1+p.r)*m.a_grid(1,d_2)-m.a_grid;
    V_aux1=utility(c1,p.sigma)-p.phi+p.beta*V;
    [V1(1,d_2),p1(1,d_2)]=max(V_aux1);  
    % Not working state
    c0=(1+p.r)*m.a_grid(1,d_2)-m.a_grid;
    V_aux0=utility(c0,p.sigma)+p.beta*V;
    [V0(1,d_2),p0(1,d_2)]=max(V_aux0);
end
% Actual value
Vnew=max(V1,V0);
g_n=(V1>V0);
g_a=g_n.*m.a_grid(p1)+(1-g_n).*m.a_grid(p0);
%---------------------------------------------------------------------------------------------------------------------------