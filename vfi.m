function s=vfi(p,m)
%---------------------------------------------------------------------------------------------------------------------------
% This function executes the VFI algorithm to solve a model with discrete
% choice. It saves the solution in the structure "s" 
%---------------------------------------------------------------------------------------------------------------------------
distV=1;
iter=0;
% Period T (end of the economy)
% Working state
c1=p.w*m.z_grid+(1+p.r)*m.a_grid;
V1=utility(c1,p.sigma)-p.phi; 
% Not working state
c0=(1+p.r)*m.a_grid;
V0=utility(c0,p.sigma); 
% Actual value function (comparing between both before)
V=max(V1,V0);
tic;
while distV>p.tol && iter<p.maxiter
    [Vnew,g_a,g_n]=vfi_step(p,m,V);
    distV=norm(V-Vnew)./(1+norm(V));
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

