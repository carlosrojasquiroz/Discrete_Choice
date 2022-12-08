function u=utility(c_aux,sigma)
%---------------------------------------------------------------------------------------------------------------------------
% This function computes the utility of a vector of consumption points, c_aux. 
% The utility form is the CRRA.
%---------------------------------------------------------------------------------------------------------------------------
[R,C]=size(c_aux);
for ind_1=1:R
    for ind_2=1:C
    c_aux(ind_1,ind_2)=max(c_aux(ind_1,ind_2),0);
    end
end
if sigma==1
    u=log(c_aux);
else
    u=(c_aux.^(1-sigma)-1)./(1-sigma);
end
%---------------------------------------------------------------------------------------------------------------------------