function graphs(p,m,s)
%---------------------------------------------------------------------------------------------------------------------------
% This function creates graphs on the value and policy functions. For
% displaying them, you should activate the option such that p.fig=1 (see
% parameters.m)
%---------------------------------------------------------------------------------------------------------------------------
LW=1.5;
FS=16;
idx_oo=zeros(1,p.naa);
for d_2=2:p.naa
    idx_oo(1,d_2)=s.g_n(d_2)-s.g_n(d_2-1);
end
xi=find(idx_oo<0);
if p.fig==1
% Value function
    figure()
        scatter(m.a_grid, s.V,'filled','r')
        hold on;
        grid on;
        xlabel('$a$','fontsize',FS,'interpreter','latex')
        ylabel('$V(a)$','fontsize',FS,'interpreter','latex')
        title('Value function')
        scatter(m.a_grid(xi),s.V(xi),'filled','k','HandleVisibility','off','SizeData',100)
        yline(0,'LineStyle',':', 'LineWidth',LW,'HandleVisibility','off')
        xlim([p.Amin p.Amax])
        ymin=min(s.V);
        ymax=max(s.V);
        ylim([ymin ymax])
        ax = gca;
        ax.FontSize = 16;
    saveas(gcf,'VFun','epsc')
% Assets policy function
    figure()
        scatter(m.a_grid, s.g_a,'filled','r')
        hold on;
        grid on;
        xlabel('$a$','fontsize',FS,'interpreter','latex')
        ylabel('$g_a(a)$','fontsize',FS,'interpreter','latex')
        title('Assets policy function')
        yline(0,'LineStyle',':', 'LineWidth',LW,'HandleVisibility','off')
        xlim([p.Amin p.Amax])
        ymin=min(s.g_a);
        ymax=max(s.g_a);
        ylim([ymin ymax])
        ax = gca;
        ax.FontSize = 16;
    saveas(gcf,'A_PolFun','epsc')
% Consumption policy function
    figure()
        scatter(m.a_grid, s.g_c,'filled','r')
        hold on;
        grid on;
        xlabel('$a$','fontsize',FS,'interpreter','latex')
        ylabel('$g_c(a)$','fontsize',FS,'interpreter','latex')
        title('Consumption policy function')
        yline(0,'LineStyle',':', 'LineWidth',LW,'HandleVisibility','off')
        xlim([p.Amin p.Amax])
        ymin=min(s.g_c);
        ymax=max(s.g_c);
        ylim([ymin ymax])
        ax = gca;
        ax.FontSize = 16;
    saveas(gcf,'C_PolFun','epsc')
% Labor policy function
    figure()
        scatter(m.a_grid, s.g_n,'filled','r')
        hold on;
        grid on;
        xlabel('$a$','fontsize',FS,'interpreter','latex')
        ylabel('$g_n(a)$','fontsize',FS,'interpreter','latex')
        title('Labor policy function')
        yline(0,'LineStyle',':', 'LineWidth',LW,'HandleVisibility','off')
        xlim([p.Amin p.Amax])
        ylim([0 1])
        ax = gca;
        ax.FontSize = 16;
    saveas(gcf,'L_PolFun','epsc')
end
%---------------------------------------------------------------------------------------------------------------------------