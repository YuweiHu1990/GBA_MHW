
load('slanCM_Data.mat');

%% Figure 1a 
load('Figure_1a.mat');
load('ONI_Plot.mat');

total=[.55 .55 .55];
Colormap_Choice=slanCM(188,20);

Moderate=Colormap_Choice(1,:);

Strong=Colormap_Choice(5,:);

Severe=Colormap_Choice(13,:);

Extreme=Colormap_Choice(9,:);

ylim_max=2e3;
ylim_min=0;

figure
set(gcf,'position',[0 0 100*16 100*3]);
h1 = axes('position', [0.07 0.11 0.92 0.78]);
ONI_Back=ONI_EL;
ONI_Back(ONI_LA~=0)=ONI_LA(ONI_LA~=0);
ONI_Back(ONI_Back==0)=NaN;
Monthpart=0.5:1:month_size-0.5;

Data=GBA_CumIntensity_monthly_mean;
hold on
for i=1:month_size
    if ~isnan(ONI_Back(i))
        a=patch([Monthpart(i)-0.5;Monthpart(i)-0.5;Monthpart(i)+0.5;Monthpart(i)+0.5],[ylim_min;ylim_max;ylim_max; ylim_min],ONI_Back(i),'EdgeColor','none','FaceAlpha',.2);
        set(get(get(a,'Annotation'),'LegendInformation'),'IconDisplayStyle','off')
        colormap(flipud(slanCM('RdBu')));
        clim([-3 3]);
        
        
    else
        continue;
    end
end


line2=area(Monthpart,squeeze(Data(:,2)),'FaceColor',Moderate,'EdgeColor','none');
line3=area(Monthpart,squeeze(Data(:,3)),'FaceColor',Strong,'EdgeColor','none');
line4=area(Monthpart,squeeze(Data(:,4)),'FaceColor',Severe,'EdgeColor','none');
line5=area(Monthpart,squeeze(Data(:,5)),'FaceColor',Extreme,'EdgeColor','none');


line2.FaceAlpha=0.7;
line3.FaceAlpha=0.7;
line4.FaceAlpha=0.7;
line5.FaceAlpha=0.7;

ylim([ylim_min ylim_max]);


ylabel('Intensity (°C)','Fontsize',20);


grid on
ax=gca;
ax.GridLineStyle = '-.';
ax.GridAlpha=0.3;

set(ax,'Fontsize',20);
xticks(5+12*2:48:5+12*41);
xticklabels(1984:4:2020);
% xminortick

for i=1:41

        p1 = [ylim_min, ylim_max];
        p2 = [5+i*12,5+i*12];
        
        line1=line(p2,p1,'Linestyle','-.','Color',[.3 .3 .3],'LineWidth',0.7);
        line1.Color(4)=0.8;

end

xlim([0 496]);
Figure_Title = 'Spatial integrated intensity in Greater Bay Area';
title(Figure_Title,'Fontsize',20,'FontName','Arial',"HorizontalAlignment","center","FontWeight","normal");
legend([ line2 line3 line4 line5 ],{'Moderate','Strong','Severe','Extreme'},'Location','north','Orientation','horizontal','Fontsize',20);
legend boxoff
box on
set(gca,'Fontname','Arial','Linewidth',1.5,'Fontsize',20);

set(gcf,'color','white','paperpositionmode','auto');
hold off
%% Figure 1b

load('Figure_1b_d.mat');
Spatial_Data = MHW_weekly_mean_intensity_time_1.*GBA_outlier_mask;
Figure_Name = 'GBA_MHW_Pick_time_1';
Figure_Title = 'Mean intensity (°C): 26 Sep - 2 Oct 2017';
Colorbar_Title = '';
Colormap_Choice = (slanCM('thermal'));
Colorbar_Min_Max = [0.5 4];
Colorbar_interval = 0.5:0.25:4;
Colorbar_Tick_interval = 1:1:4;
Save_dir=[];
scale_factor=0.01;
Plot_type='pcolor'; 

PlotGBAMap(Spatial_Data, Figure_Name, Figure_Title, Colorbar_Title, Colormap_Choice, Colorbar_Min_Max, ...
    Colorbar_interval, Colorbar_Tick_interval, Save_dir, scale_factor, Plot_type)
%% Figure 1c
Spatial_Data = MHW_weekly_mean_intensity_time_2.*GBA_outlier_mask;
Figure_Name = 'GBA_MHW_Pick_time_2';
Figure_Title = 'Mean intensity (°C): 27 May - 2 Jun 2018';
Colorbar_Title = '';
Colormap_Choice = (slanCM('thermal'));
Colorbar_Min_Max = [0.5 4];
Colorbar_interval = 0.5:0.25:4;
Colorbar_Tick_interval = 1:1:4;
Save_dir=[];
scale_factor=0.01;
Plot_type='pcolor';

PlotGBAMap(Spatial_Data, Figure_Name, Figure_Title, Colorbar_Title, Colormap_Choice, Colorbar_Min_Max, ...
    Colorbar_interval, Colorbar_Tick_interval, Save_dir, scale_factor, Plot_type)

%% Figure 1d
Spatial_Data = MHW_weekly_mean_intensity_time_3.*GBA_outlier_mask;
Figure_Name = 'GBA_MHW_Pick_time_3';
Figure_Title = 'Mean intensity (°C): 30 Mar - 5 Apr 2021';
Colorbar_Title = '';
Colormap_Choice = (slanCM('thermal'));
Colorbar_Min_Max = [0.5 4];
Colorbar_interval = 0.5:0.25:4;
Colorbar_Tick_interval = 1:1:4;
Save_dir=[];
scale_factor=0.01;
Plot_type='pcolor';

PlotGBAMap(Spatial_Data, Figure_Name, Figure_Title, Colorbar_Title, Colormap_Choice, Colorbar_Min_Max, ...
    Colorbar_interval, Colorbar_Tick_interval, Save_dir, scale_factor, Plot_type)
%% Figure 1e
load('Figure_1e.mat');
figure;
Color_map = slanCM(188,20);
X=2:4;

Y=[ML_T_tendency_Valid_volume_weight, ML_Horizontal_advection_term_volume_weight, ML_Heat_Flux_volume_weight,Entraiment_term_volume_weight...
    ,ML_Residual_term_volume_weight;  ML_T_tendency_Valid_volume_weight_D, ML_Horizontal_advection_term_volume_weight_D, ...
    ML_Heat_Flux_volume_weight_D,Entraiment_term_volume_weight_D,ML_Residual_term_volume_weight_D; ML_T_tendency_Valid_volume_weight_S, ...
    ML_Horizontal_advection_term_volume_weight_S, ML_Heat_Flux_volume_weight_S,Entraiment_term_volume_weight_S ,ML_Residual_term_volume_weight_S; ];

hold on;
b=bar(X, Y,'barwidth',0.95);

b(1).FaceColor=[1 1 1].*0.25;
b(2).FaceColor=Color_map(1,:);
b(3).FaceColor=Color_map(5,:);
b(4).FaceColor=Color_map(9,:);
b(5).FaceColor=[1 1 1].*0.5;
b(1).EdgeColor=[1 1 1].*0.25;
b(2).EdgeColor=Color_map(1,:);
b(3).EdgeColor=Color_map(5,:);
b(4).EdgeColor=Color_map(9,:);
b(5).EdgeColor=[1 1 1].*0.5;
xticks([ 2 3 4])
xticklabels({'Full region'; 'Bathys > 50m';'Bathys ≤ 50m'});
xtickangle(gca,0);
yticks(-0.2:0.1:0.2);
ylabel('ML heat budget term (°C/day)','Fontsize',20);
ylim([-0.2 0.2]);
a=gca;
a.YGrid = 'on';
set(a,'layer','top','GridLineStyle','-.');
box on;
title('Aug 30 - Sep 29 2017 (onset)','Fontsize',20,'FontName','Calibri',"HorizontalAlignment","center","FontWeight","normal");
set(gcf,'position',[0 0 100*6 100*6]);
set (gca,'position',[0.15,0.1,0.80,0.80] );
set(gca,'Fontname','Calibri','Linewidth',1.5,'Fontsize',20);

legend_Name_1 = sprintf('Tendency');
legend_Name_2 = sprintf('Advection');
legend_Name_3 = 'NHF';
legend_Name_4 = 'Entrainment';
legend_Name_5 = 'Residual';

legend([b(1) b(2) b(3)],{ legend_Name_1,legend_Name_2, legend_Name_3},...
    'Location','north','Orientation','horizontal','Fontsize',20,'box','off','FontName','Calibri');
ah=axes('position',get(gca,'position'),'visible','off');

legend(ah,[b(4) b(5)],{legend_Name_4, legend_Name_5},...
    'Location','south','Orientation','horizontal','Fontsize',20,'box','off','FontName','Calibri');
hold off
set(gcf,'color','white','paperpositionmode','auto');

%% Figure 1f 
load('Figure_1f.mat');

figure;
Color_map = slanCM(188,20);
X=2:4;

Y=[ML_T_tendency_Valid_volume_weight, ML_Horizontal_advection_term_volume_weight, ML_Heat_Flux_volume_weight,Entraiment_term_volume_weight...
    ,ML_Residual_term_volume_weight;  ML_T_tendency_Valid_volume_weight_D, ML_Horizontal_advection_term_volume_weight_D, ...
    ML_Heat_Flux_volume_weight_D,Entraiment_term_volume_weight_D,ML_Residual_term_volume_weight_D; ML_T_tendency_Valid_volume_weight_S, ...
    ML_Horizontal_advection_term_volume_weight_S, ML_Heat_Flux_volume_weight_S,Entraiment_term_volume_weight_S ,ML_Residual_term_volume_weight_S; ];

hold on;
b=bar(X, Y,'barwidth',0.95);

b(1).FaceColor=[1 1 1].*0.25;
b(2).FaceColor=Color_map(1,:);
b(3).FaceColor=Color_map(5,:);
b(4).FaceColor=Color_map(9,:);
b(5).FaceColor=[1 1 1].*0.5;
b(1).EdgeColor=[1 1 1].*0.25;
b(2).EdgeColor=Color_map(1,:);
b(3).EdgeColor=Color_map(5,:);
b(4).EdgeColor=Color_map(9,:);
b(5).EdgeColor=[1 1 1].*0.5;
xticks([ 2 3 4])
xticklabels({'Full region'; 'Bathys > 50m';'Bathys ≤ 50m'});
xtickangle(gca,0);
yticks(-0.2:0.1:0.2);
ylabel('ML heat budget term (°C/day)','Fontsize',20);
ylim([-0.2 0.2]);
a=gca;
a.YGrid = 'on';
set(a,'layer','top','GridLineStyle','-.');
box on;
title('May 1 - 30 2018 (onset)','Fontsize',20,'FontName','Calibri',"HorizontalAlignment","center","FontWeight","normal");
set(gcf,'position',[0 0 100*6 100*6]);
set (gca,'position',[0.15,0.1,0.80,0.80] );
set(gca,'Fontname','Calibri','Linewidth',1.5,'Fontsize',20);

legend_Name_1 = sprintf('Tendency');
legend_Name_2 = sprintf('Advection');
legend_Name_3 = 'NHF';
legend_Name_4 = 'Entrainment';
legend_Name_5 = 'Residual';

h1=legend([b(1) b(2) b(3)],{ legend_Name_1,legend_Name_2, legend_Name_3},...
   'Orientation','horizontal','Fontsize',20,'box','off','FontName','Calibri');
ah=axes('position',get(gca,'position'),'visible','off');
set(h1,'position',[0.55,0.23,0.01,0.01],'units','normalized');

h2=legend(ah,[b(4) b(5)],{legend_Name_4, legend_Name_5},...
    'Location','south','Orientation','horizontal','Fontsize',20,'box','off','FontName','Calibri');
set(h2,'position',[0.55,0.14,0.01,0.01],'units','normalized');
hold off
set(gcf,'color','white','paperpositionmode','auto');

%% Figure 1g
load('Figure_1g.mat');

figure;
Color_map = slanCM(188,20); 
X=2:4;

Y=[ML_T_tendency_Valid_volume_weight, ML_Horizontal_advection_term_volume_weight, ML_Heat_Flux_volume_weight,Entraiment_term_volume_weight...
    ,ML_Residual_term_volume_weight;  ML_T_tendency_Valid_volume_weight_D, ML_Horizontal_advection_term_volume_weight_D, ...
    ML_Heat_Flux_volume_weight_D,Entraiment_term_volume_weight_D,ML_Residual_term_volume_weight_D; ML_T_tendency_Valid_volume_weight_S, ...
    ML_Horizontal_advection_term_volume_weight_S, ML_Heat_Flux_volume_weight_S,Entraiment_term_volume_weight_S ,ML_Residual_term_volume_weight_S; ];

hold on;
b=bar(X, Y,'barwidth',0.95);

b(1).FaceColor=[1 1 1].*0.25;
b(2).FaceColor=Color_map(1,:);
b(3).FaceColor=Color_map(5,:);
b(4).FaceColor=Color_map(9,:);
b(5).FaceColor=[1 1 1].*0.5;
b(1).EdgeColor=[1 1 1].*0.25;
b(2).EdgeColor=Color_map(1,:);
b(3).EdgeColor=Color_map(5,:);
b(4).EdgeColor=Color_map(9,:);
b(5).EdgeColor=[1 1 1].*0.5;
xticks([ 2 3 4])
xticklabels({'Full region'; 'Bathys > 50m';'Bathys ≤ 50m'});
xtickangle(gca,0);
yticks(-0.2:0.1:0.2);
ylabel('ML heat budget term (°C/day)','Fontsize',20);
ylim([-0.2 0.2]);
a=gca;
a.YGrid = 'on';
set(a,'layer','top','GridLineStyle','-.');
box on;
title('Mar 4 - Apr 2 2021 (onset)','Fontsize',20,'FontName','Calibri',"HorizontalAlignment","center","FontWeight","normal");
set(gcf,'position',[0 0 100*6 100*6]);
set (gca,'position',[0.15,0.1,0.80,0.80] );
set(gca,'Fontname','Calibri','Linewidth',1.5,'Fontsize',20);

legend_Name_1 = sprintf('Tendency');
legend_Name_2 = sprintf('Advection');
legend_Name_3 = 'NHF';
legend_Name_4 = 'Entrainment';
legend_Name_5 = 'Residual';

legend([b(1) b(2) b(3)],{ legend_Name_1,legend_Name_2, legend_Name_3},...
    'Location','north','Orientation','horizontal','Fontsize',20,'box','off','FontName','Calibri');
ah=axes('position',get(gca,'position'),'visible','off');

legend(ah,[b(4) b(5)],{legend_Name_4, legend_Name_5},...
    'Location','south','Orientation','horizontal','Fontsize',20,'box','off','FontName','Calibri');
hold off
set(gcf,'color','white','paperpositionmode','auto');
%% FIgure 1h
load('Figure_1h.mat');

figure;
Color_map = slanCM(188,20); 
X=2:4;

Y=[ML_T_tendency_Valid_volume_weight, ML_Horizontal_advection_term_volume_weight, ML_Heat_Flux_volume_weight,Entraiment_term_volume_weight...
    ,ML_Residual_term_volume_weight;  ML_T_tendency_Valid_volume_weight_D, ML_Horizontal_advection_term_volume_weight_D, ...
    ML_Heat_Flux_volume_weight_D,Entraiment_term_volume_weight_D,ML_Residual_term_volume_weight_D; ML_T_tendency_Valid_volume_weight_S, ...
    ML_Horizontal_advection_term_volume_weight_S, ML_Heat_Flux_volume_weight_S,Entraiment_term_volume_weight_S ,ML_Residual_term_volume_weight_S; ];

hold on;
b=bar(X, Y,'barwidth',0.95);

b(1).FaceColor=[1 1 1].*0.25;
b(2).FaceColor=Color_map(1,:);
b(3).FaceColor=Color_map(5,:);
b(4).FaceColor=Color_map(9,:);
b(5).FaceColor=[1 1 1].*0.5;
b(1).EdgeColor=[1 1 1].*0.25;
b(2).EdgeColor=Color_map(1,:);
b(3).EdgeColor=Color_map(5,:);
b(4).EdgeColor=Color_map(9,:);
b(5).EdgeColor=[1 1 1].*0.5;
xticks([ 2 3 4])
xticklabels({'Full region'; 'Bathys > 50m';'Bathys ≤ 50m'});
xtickangle(gca,0);
yticks(-0.2:0.1:0.2);
ylabel('ML heat budget term (°C/day)','Fontsize',20);
ylim([-0.2 0.2]);
a=gca;
a.YGrid = 'on';
set(a,'layer','top','GridLineStyle','-.');
box on;
title('Sep 30 - Oct 29 2017 (decline)','Fontsize',20,'FontName','Calibri',"HorizontalAlignment","center","FontWeight","normal");
set(gcf,'position',[0 0 100*6 100*6]);
set (gca,'position',[0.15,0.1,0.80,0.80] );
set(gca,'Fontname','Calibri','Linewidth',1.5,'Fontsize',20);

legend_Name_1 = sprintf('Tendency');
legend_Name_2 = sprintf('Advection');
legend_Name_3 = 'NHF';
legend_Name_4 = 'Entrainment';
legend_Name_5 = 'Residual';

legend([b(1) b(2) b(3)],{ legend_Name_1,legend_Name_2, legend_Name_3},...
    'Location','north','Orientation','horizontal','Fontsize',20,'box','off','FontName','Calibri');
ah=axes('position',get(gca,'position'),'visible','off');

legend(ah,[b(4) b(5)],{legend_Name_4, legend_Name_5},...
    'Location','south','Orientation','horizontal','Fontsize',20,'box','off','FontName','Calibri');
hold off
set(gcf,'color','white','paperpositionmode','auto');

%% FIgure 1i
load('Figure_1i.mat');

figure;
Color_map = slanCM(188,20);
X=2:4;

Y=[ML_T_tendency_Valid_volume_weight, ML_Horizontal_advection_term_volume_weight, ML_Heat_Flux_volume_weight,Entraiment_term_volume_weight...
    ,ML_Residual_term_volume_weight;  ML_T_tendency_Valid_volume_weight_D, ML_Horizontal_advection_term_volume_weight_D, ...
    ML_Heat_Flux_volume_weight_D,Entraiment_term_volume_weight_D,ML_Residual_term_volume_weight_D; ML_T_tendency_Valid_volume_weight_S, ...
    ML_Horizontal_advection_term_volume_weight_S, ML_Heat_Flux_volume_weight_S,Entraiment_term_volume_weight_S ,ML_Residual_term_volume_weight_S; ];

hold on;
b=bar(X, Y,'barwidth',0.95);

b(1).FaceColor=[1 1 1].*0.25;
b(2).FaceColor=Color_map(1,:);
b(3).FaceColor=Color_map(5,:);
b(4).FaceColor=Color_map(9,:);
b(5).FaceColor=[1 1 1].*0.5;
b(1).EdgeColor=[1 1 1].*0.25;
b(2).EdgeColor=Color_map(1,:);
b(3).EdgeColor=Color_map(5,:);
b(4).EdgeColor=Color_map(9,:);
b(5).EdgeColor=[1 1 1].*0.5;
xticks([ 2 3 4])
xticklabels({'Full region'; 'Bathys > 50m';'Bathys ≤ 50m'});
xtickangle(gca,0);
yticks(-0.2:0.1:0.2);
ylabel('ML heat budget term (°C/day)','Fontsize',20);
ylim([-0.2 0.2]);
a=gca;
a.YGrid = 'on';
set(a,'layer','top','GridLineStyle','-.');
box on;
title('May 31 - Jun 29 2018 (decline)','Fontsize',20,'FontName','Calibri',"HorizontalAlignment","center","FontWeight","normal");
set(gcf,'position',[0 0 100*6 100*6]);
set (gca,'position',[0.15,0.1,0.80,0.80] );
set(gca,'Fontname','Calibri','Linewidth',1.5,'Fontsize',20);

legend_Name_1 = sprintf('Tendency');
legend_Name_2 = sprintf('Advection');
legend_Name_3 = 'NHF';
legend_Name_4 = 'Entrainment';
legend_Name_5 = 'Residual';

legend([b(1) b(2) b(3)],{ legend_Name_1,legend_Name_2, legend_Name_3},...
    'Location','north','Orientation','horizontal','Fontsize',20,'box','off','FontName','Calibri');
ah=axes('position',get(gca,'position'),'visible','off');

legend(ah,[b(4) b(5)],{legend_Name_4, legend_Name_5},...
    'Location','south','Orientation','horizontal','Fontsize',20,'box','off','FontName','Calibri');
hold off
set(gcf,'color','white','paperpositionmode','auto');
%% FIgure 1j
load('Figure_1j.mat');

figure;
Color_map = slanCM(188,20); % colormap
X=2:4;

Y=[ML_T_tendency_Valid_volume_weight, ML_Horizontal_advection_term_volume_weight, ML_Heat_Flux_volume_weight,Entraiment_term_volume_weight...
    ,ML_Residual_term_volume_weight;  ML_T_tendency_Valid_volume_weight_D, ML_Horizontal_advection_term_volume_weight_D, ...
    ML_Heat_Flux_volume_weight_D,Entraiment_term_volume_weight_D,ML_Residual_term_volume_weight_D; ML_T_tendency_Valid_volume_weight_S, ...
    ML_Horizontal_advection_term_volume_weight_S, ML_Heat_Flux_volume_weight_S,Entraiment_term_volume_weight_S ,ML_Residual_term_volume_weight_S; ];
% b6=line([1.5 3.5],[0 0],'color',[ 1 1 1]*0.1,'Linewidth',1);
hold on;
b=bar(X, Y,'barwidth',0.95);

b(1).FaceColor=[1 1 1].*0.25;
b(2).FaceColor=Color_map(1,:);
b(3).FaceColor=Color_map(5,:);
b(4).FaceColor=Color_map(9,:);
b(5).FaceColor=[1 1 1].*0.5;
b(1).EdgeColor=[1 1 1].*0.25;
b(2).EdgeColor=Color_map(1,:);
b(3).EdgeColor=Color_map(5,:);
b(4).EdgeColor=Color_map(9,:);
b(5).EdgeColor=[1 1 1].*0.5;
xticks([ 2 3 4])
xticklabels({'Full region'; 'Bathys > 50m';'Bathys ≤ 50m'});
xtickangle(gca,0);
yticks(-0.2:0.1:0.2);
ylabel('ML heat budget term (°C/day)','Fontsize',20);
ylim([-0.2 0.2]);
a=gca;
a.YGrid = 'on';
set(a,'layer','top','GridLineStyle','-.');
box on;
title('Apr 3 - May 2 2021 (decline)','Fontsize',20,'FontName','Calibri',"HorizontalAlignment","center","FontWeight","normal");
set(gcf,'position',[0 0 100*6 100*6]);
set (gca,'position',[0.15,0.1,0.80,0.80] );
set(gca,'Fontname','Calibri','Linewidth',1.5,'Fontsize',20);

legend_Name_1 = sprintf('Tendency');
legend_Name_2 = sprintf('Advection');
legend_Name_3 = 'NHF';
legend_Name_4 = 'Entrainment';
legend_Name_5 = 'Residual';

legend([b(1) b(2) b(3)],{ legend_Name_1,legend_Name_2, legend_Name_3},...
    'Location','north','Orientation','horizontal','Fontsize',20,'box','off','FontName','Calibri');
ah=axes('position',get(gca,'position'),'visible','off');

legend(ah,[b(4) b(5)],{legend_Name_4, legend_Name_5},...
    'Location','south','Orientation','horizontal','Fontsize',20,'box','off','FontName','Calibri');
hold off
set(gcf,'color','white','paperpositionmode','auto');