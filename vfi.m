function s=vfi(p,m)
%---------------------------------------------------------------------------------------------------------------------------
% This function executes the VFI algorithm to solve a model with discrete
% choice. It saves the solution in the structure "s" 
%---------------------------------------------------------------------------------------------------------------------------
V_ww=utility(p.w*m.z_grid+(1+p.r)*m.a_grid,p.sigma)-p.phi;% value function of working
V_nw=utility((1+p.r)*m.a_grid,p.sigma); % value function of not working
V=max(V_ww,V_nw);% the "actual" value function (comparing between both before)
distV=1;
iter=0;
tic;
while distV>p.tol && iter<p.maxiter
    [Vnew,p_a,g_n]=vfi_step(p,m,V);
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
s.g_a=m.a_grid(p_a);
s.g_c=p.w*m.z_grid+(1+p.r)*m.a_grid-s.g_a;
s.p_a=p_a;
s.V=V;
s.g_n=g_n;
%---------------------------------------------------------------------------------------------------------------------------

