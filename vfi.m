function s=vfi(p,m)
%---------------------------------------------------------------------------------------------------------------------------
% This function executes the VFI algorithm to solve a model with discrete
% choice. It saves the solution in the structure "s" 
%---------------------------------------------------------------------------------------------------------------------------
c_ww=p.w*m.z_grid+(1+p.r)*m.a_grid;
c_nw=(1+p.r)*m.a_grid;
V_ww=utility(c_ww,p.sigma)-p.phi;% value function of working
V_nw=utility(c_nw,p.sigma); % value function of not working
V=max(V_ww,V_nw);% the "actual" value function (comparing between both before)
distV=1;
iter=0;
tic;
while distV>p.tol && iter<p.maxiter
    [Vnew,g_a,g_n]=vfi_step(p,m,V);
    distV=max(abs(V(:)-Vnew(:)));
    V=Vnew;
    iter=iter+1;
    if p.disp1==1   
        disp(['VFI iteration number ',num2str(iter)])
        disp(['error = ',num2str(distV)])
    end
end
endtime=toc;
if p.disp1==1   
    disp(['Time to execute the algorithm ',num2str(endtime)])
end
s.g_a=g_a;
s.g_c=p.w*m.z_grid+(1+p.r)*m.a_grid-s.g_a;
s.V=V;
s.g_n=g_n;
%---------------------------------------------------------------------------------------------------------------------------

