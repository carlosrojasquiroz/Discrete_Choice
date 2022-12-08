clc,close,clear;
%---------------------------------------------------------------------------------------------------------------------------
%% SIM with discrete choices
%---------------------------------------------------------------------------------------------------------------------------
% This code solves the standard incomplete markets model (SIM) with discrete
% choices (working or not). The current version of the model doesn't have
% idiosyncratic shocks. 
%---------------------------------------------------------------------------------------------------------------------------
%% 1. Parameters
%---------------------------------------------------------------------------------------------------------------------------
        p=parameters();
%---------------------------------------------------------------------------------------------------------------------------
%% 2. Matrices (grid specification for assets)
%---------------------------------------------------------------------------------------------------------------------------
        m=matrices(p);
%---------------------------------------------------------------------------------------------------------------------------
%% 3. Individual Policy and value functions
%---------------------------------------------------------------------------------------------------------------------------
        s=vfi(p,m);
%---------------------------------------------------------------------------------------------------------------------------
%% 4. Graphs
%---------------------------------------------------------------------------------------------------------------------------
        graphs(p,m,s)
%---------------------------------------------------------------------------------------------------------------------------
                                    % (c) Carlos Rojas Quiroz - December 2022