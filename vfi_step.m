function [Vnew,p_a,work]=vfi_step(p,m,V)
%---------------------------------------------------------------------------------------------------------------------------
% This function gets the optimal saving and working policy
%---------------------------------------------------------------------------------------------------------------------------
V_ww=zeros(1,p.naa);
p_ww=zeros(1,p.naa);
V_nw=zeros(1,p.naa);
p_nw=zeros(1,p.naa);
for d_2=1:p.naa
    % Consumption
    cW=p.w*m.z_grid+(1+p.r)*m.a_grid(1,d_2)-m.a_grid;
    cNW=(1+p.r)*m.a_grid(1,d_2)-m.a_grid;
    % Value of working
    V_auxW=utility(cW,p.sigma)-p.phi+p.beta*V;
    [V_ww(1,d_2),p_ww(1,d_2)]=max(V_auxW);
    % Value of not working
    V_auxNW=utility(cNW,p.sigma)+p.beta*V;
    [V_nw(1,d_2),p_nw(1,d_2)]=max(V_auxNW);
end
% Actual value
Vnew=max(V_ww,V_nw);
work=(V_ww>V_nw);
p_a=work.*p_ww+(1-work).*p_nw;
%---------------------------------------------------------------------------------------------------------------------------