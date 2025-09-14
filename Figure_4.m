load('slanCM_Data.mat');
%% Figure 4a
load('Figure_4a.mat');

ML_U_MEAN_anomaly = ML_U_MEAN;
ML_V_MEAN_anomaly = ML_V_MEAN;

ML_U_MEAN_anomaly(:,:,1:3) = ML_U_MEAN(:,:,1:3) - ML_U_MEAN_Clim(:,:,8);
ML_U_MEAN_anomaly(:,:,4:end) = ML_U_MEAN(:,:,4:end) - ML_U_MEAN_Clim(:,:,9);

ML_V_MEAN_anomaly(:,:,1:3) = ML_V_MEAN(:,:,1:3) - ML_V_MEAN_Clim(:,:,8);
ML_V_MEAN_anomaly(:,:,4:end) = ML_V_MEAN(:,:,4:end) - ML_V_MEAN_Clim(:,:,9);

Spatial_Data = ML_Horizontal_advection_term_volume_weight_map;

UU_Data=mean(ML_U_MEAN_anomaly(2:end,2:end,2:end),3,'omitnan');
VV_Data=mean(ML_V_MEAN_anomaly(2:end,2:end,2:end),3,'omitnan'); % only rotate data in the plot command

if Spatial_p_Advection <0.05
    Figure_Title = sprintf('Horizontal advection term (R=%.2f)',Spatial_corr_Advection);
else 
    Figure_Title = sprintf('Horizontal advection term');
end

Colorbar_Title = '°C/day';
Colormap_Choice = slanCM('coolwarm');
Colorbar_Min_Max = [-0.4 0.4];
Colorbar_interval = -0.4:0.02:0.4;
Colorbar_Tick_interval = -0.4:0.2:0.4;

scale_factor=1;
Plot_type='pcolor';

figure;
[X,Y]=meshgrid(BRAN_T_lon_GBA,BRAN_T_lat_GBA);
m_proj('equ','long',[111.6 115.8],'lat',[21.4 23.6]);

if (strcmp(Plot_type,'pcolor'))
m_pcolor(X,Y,flipud(rot90(Spatial_Data.*scale_factor)));
shading flat

elseif (strcmp(Plot_type,'contourf'))
m_contourf(X,Y,flipud(rot90(Spatial_Data.*scale_factor)),Colorbar_interval,'edgecolor','none');
end    
    
colormap(Colormap_Choice)
 
ax=m_contfbar([0.15 .85],0.65,Colorbar_Min_Max,Colorbar_interval,'edgecolor','none','endpiece','yes','axfrac',0.04);
ax.XLabel.String = Colorbar_Title;
ax.LineWidth = 1;

set(ax,'tickdir','out','TickLength',[0.01 10],'box','on','Fontsize',20,'XTick',Colorbar_Tick_interval,'FontName','Arial','fontweight', 'normal');% 
hold on;
m_etopo2('contour',[-50;-20],'edgecolor','w','ShowText','on','color','w');% '\color[rgb]{0.4,0.4,0.4}'

m_gshhs_f('patch',[1 1 1]*.95);
m_grid('tickdir','in','xtick', 112 :1: 115.5 ,'xticklable',112 :1: 115.5,...
    'ytick',21.5:0.5:23 ,'yticklable',21.5:0.5:23,'Linewidth',2,'Fontsize',20,'backgroundcolor',[.95 .95 .95],'FontName','Calibri');

vector_scale=1;
Color_Choice = [0 0 0];
m_quiver(X(1:1:end,1:1:end),Y(1:1:end,1:1:end),UU_Data(1:1:end,1:1:end)'.*vector_scale,VV_Data(1:1:end,1:1:end)'.*vector_scale,0,'Color',Color_Choice(1,:),'linewidth',1);

h=m_quiver(111.8,22.5,0.2*vector_scale,0,0);
set(h,'linewidth',1.5,'Color',Color_Choice(1,:));
h.ShowArrowHead='on';
h.MaxHeadSize=1;
m_text(111.8,22.7,'ML current anomaly' ,'fontsize',20,'fontweight', 'normal','FontName','Calibri'); 
m_text(112.2,22.5,'0.2 m/s' ,'fontsize',20,'fontweight', 'normal','FontName','Calibri'); 
title(Figure_Title,'Fontsize',18,'FontName','Arial',"HorizontalAlignment","center","FontWeight","normal");
set(gcf,'position',[0 0 100*6  100*3.5]);
set (gca,'position',[0.12,0.06,0.82,0.86] )
set(gca,'Fontname','Arial','Linewidth',1.5);
set(gcf,'color','white','paperpositionmode','auto');


%% Figure 4b
load('Figure_4b.mat');
ML_U_MEAN_anomaly = ML_U_MEAN;
ML_V_MEAN_anomaly = ML_V_MEAN;

ML_U_MEAN_anomaly(:,:,1) = ML_U_MEAN(:,:,1) - ML_U_MEAN_Clim(:,:,4);
ML_U_MEAN_anomaly(:,:,2:end) = ML_U_MEAN(:,:,2:end) - ML_U_MEAN_Clim(:,:,5);

ML_V_MEAN_anomaly(:,:,1) = ML_V_MEAN(:,:,1) - ML_V_MEAN_Clim(:,:,4);
ML_V_MEAN_anomaly(:,:,2:end) = ML_V_MEAN(:,:,2:end) - ML_V_MEAN_Clim(:,:,5);

Spatial_Data = ML_Horizontal_advection_term_volume_weight_map;

UU_Data=mean(ML_U_MEAN_anomaly(2:end,2:end,2:end),3,'omitnan');
VV_Data=mean(ML_V_MEAN_anomaly(2:end,2:end,2:end),3,'omitnan'); % only rotate data in the plot command


if Spatial_p_Advection <0.05
    Figure_Title = sprintf('Horizontal advection term (R=%.2f)',Spatial_corr_Advection);
else 
    Figure_Title = sprintf('Horizontal advection term');
end

Colorbar_Title = '°C/day';
Colormap_Choice = slanCM('coolwarm');
Colorbar_Min_Max = [-0.4 0.4];
Colorbar_interval = -0.4:0.02:0.4;
Colorbar_Tick_interval = -0.4:0.2:0.4;

scale_factor=1;
Plot_type='pcolor';

figure;
[X,Y]=meshgrid(BRAN_T_lon_GBA,BRAN_T_lat_GBA);
m_proj('equ','long',[111.6 115.8],'lat',[21.4 23.6]);

if (strcmp(Plot_type,'pcolor'))
m_pcolor(X,Y,flipud(rot90(Spatial_Data.*scale_factor)));
shading flat

elseif (strcmp(Plot_type,'contourf'))
m_contourf(X,Y,flipud(rot90(Spatial_Data.*scale_factor)),Colorbar_interval,'edgecolor','none');
end    
    
colormap(Colormap_Choice)
 
ax=m_contfbar([0.15 .85],0.65,Colorbar_Min_Max,Colorbar_interval,'edgecolor','none','endpiece','yes','axfrac',0.04);
ax.XLabel.String = Colorbar_Title;
ax.LineWidth = 1;

set(ax,'tickdir','out','TickLength',[0.01 10],'box','on','Fontsize',20,'XTick',Colorbar_Tick_interval,'FontName','Arial','fontweight', 'normal');% 
hold on;
m_etopo2('contour',[-50;-20],'edgecolor','w','ShowText','on','color','w');% '\color[rgb]{0.4,0.4,0.4}'

m_gshhs_f('patch',[1 1 1]*.95);
m_grid('tickdir','in','xtick', 112 :1: 115.5 ,'xticklable',112 :1: 115.5,...
    'ytick',21.5:0.5:23 ,'yticklable',21.5:0.5:23,'Linewidth',2,'Fontsize',20,'backgroundcolor',[.95 .95 .95],'FontName','Calibri');

vector_scale=1;
Color_Choice = [0 0 0];
m_quiver(X(1:1:end,1:1:end),Y(1:1:end,1:1:end),UU_Data(1:1:end,1:1:end)'.*vector_scale,VV_Data(1:1:end,1:1:end)'.*vector_scale,0,'Color',Color_Choice(1,:),'linewidth',1);

h=m_quiver(111.8,22.5,0.2*vector_scale,0,0);
set(h,'linewidth',1.5,'Color',Color_Choice(1,:));
h.ShowArrowHead='on';
h.MaxHeadSize=1;
m_text(111.8,22.7,'ML current anomaly' ,'fontsize',20,'fontweight', 'normal','FontName','Calibri'); 
m_text(112.2,22.5,'0.2 m/s' ,'fontsize',20,'fontweight', 'normal','FontName','Calibri'); 
title(Figure_Title,'Fontsize',18,'FontName','Arial',"HorizontalAlignment","center","FontWeight","normal");
set(gcf,'position',[0 0 100*6  100*3.5]);
set (gca,'position',[0.12,0.06,0.82,0.86] )
set(gca,'Fontname','Arial','Linewidth',1.5);
set(gcf,'color','white','paperpositionmode','auto');


%% Figure 4c
load('Figure_4c.mat');

ML_U_MEAN_anomaly = ML_U_MEAN;
ML_V_MEAN_anomaly = ML_V_MEAN;

ML_U_MEAN_anomaly(:,:,1:29) = ML_U_MEAN(:,:,1:29) - ML_U_MEAN_Clim(:,:,3);
ML_U_MEAN_anomaly(:,:,30:end) = ML_U_MEAN(:,:,30:end) - ML_U_MEAN_Clim(:,:,4);

ML_V_MEAN_anomaly(:,:,1:29) = ML_V_MEAN(:,:,1:29) - ML_V_MEAN_Clim(:,:,3);
ML_V_MEAN_anomaly(:,:,30:end) = ML_V_MEAN(:,:,30:end) - ML_V_MEAN_Clim(:,:,4);

Spatial_Data = ML_Horizontal_advection_term_volume_weight_map;

UU_Data=mean(ML_U_MEAN_anomaly(2:end,2:end,2:end),3,'omitnan');
VV_Data=mean(ML_V_MEAN_anomaly(2:end,2:end,2:end),3,'omitnan'); % only rotate data in the plot command

if Spatial_p_Advection <0.05
    Figure_Title = sprintf('Horizontal advection term (R=%.2f)',Spatial_corr_Advection);
else 
    Figure_Title = sprintf('Horizontal advection term');
end

Colorbar_Title = '°C/day';
Colormap_Choice = slanCM('coolwarm');
Colorbar_Min_Max = [-0.4 0.4];
Colorbar_interval = -0.4:0.02:0.4;
Colorbar_Tick_interval = -0.4:0.2:0.4;
scale_factor=1;
Plot_type='pcolor';

figure;
[X,Y]=meshgrid(BRAN_T_lon_GBA,BRAN_T_lat_GBA);
m_proj('equ','long',[111.6 115.8],'lat',[21.4 23.6]);

if (strcmp(Plot_type,'pcolor'))
m_pcolor(X,Y,flipud(rot90(Spatial_Data.*scale_factor)));
shading flat

elseif (strcmp(Plot_type,'contourf'))
m_contourf(X,Y,flipud(rot90(Spatial_Data.*scale_factor)),Colorbar_interval,'edgecolor','none');
end    
    
colormap(Colormap_Choice)
 
ax=m_contfbar([0.15 .85],0.65,Colorbar_Min_Max,Colorbar_interval,'edgecolor','none','endpiece','yes','axfrac',0.04);
ax.XLabel.String = Colorbar_Title;
ax.LineWidth = 1;

set(ax,'tickdir','out','TickLength',[0.01 10],'box','on','Fontsize',20,'XTick',Colorbar_Tick_interval,'FontName','Arial','fontweight', 'normal');% 
hold on;
m_etopo2('contour',[-50;-20],'edgecolor','w','ShowText','on','color','w');% '\color[rgb]{0.4,0.4,0.4}'

m_gshhs_f('patch',[1 1 1]*.95);
m_grid('tickdir','in','xtick', 112 :1: 115.5 ,'xticklable',112 :1: 115.5,...
    'ytick',21.5:0.5:23 ,'yticklable',21.5:0.5:23,'Linewidth',2,'Fontsize',20,'backgroundcolor',[.95 .95 .95],'FontName','Calibri');

vector_scale=1;
Color_Choice = [0 0 0];
m_quiver(X(1:1:end,1:1:end),Y(1:1:end,1:1:end),UU_Data(1:1:end,1:1:end)'.*vector_scale,VV_Data(1:1:end,1:1:end)'.*vector_scale,0,'Color',Color_Choice(1,:),'linewidth',1);

h=m_quiver(111.8,22.5,0.2*vector_scale,0,0);
set(h,'linewidth',1.5,'Color',Color_Choice(1,:));
h.ShowArrowHead='on';
h.MaxHeadSize=1;
m_text(111.8,22.7,'ML current anomaly' ,'fontsize',20,'fontweight', 'normal','FontName','Calibri'); 
m_text(112.2,22.5,'0.2 m/s' ,'fontsize',20,'fontweight', 'normal','FontName','Calibri'); 
title(Figure_Title,'Fontsize',18,'FontName','Arial',"HorizontalAlignment","center","FontWeight","normal");
set(gcf,'position',[0 0 100*6  100*3.5]);
set (gca,'position',[0.12,0.06,0.82,0.86] )
set(gca,'Fontname','Arial','Linewidth',1.5);
set(gcf,'color','white','paperpositionmode','auto');

%% Figure 4d
load('Figure_4d.mat');
Avea_weight = dX.*dY;

Depth_W_MEAN_timeseries = zeros(1,30);
STD_Depth_W_MEAN_timeseries = zeros(1,30);

MLD_timeseries = zeros(1,30);
STD_MLD_timeseries = zeros(1,30);
MASK = MASK_Deep_50m(:,:,1);
for day_order=1:30
W_temp = squeeze(Depth_W_MEAN(:,:,day_order));

MLD_temp= squeeze(ML_depth(2:end,2:end,day_order+1));



Depth_W_MEAN_timeseries(day_order) = squeeze(sum(W_temp.*Avea_weight,'all','omitnan')./...
        sum(Avea_weight(~isnan(W_temp)),'omitnan'));
STD_Depth_W_MEAN_timeseries(day_order) = std(W_temp(~isnan(W_temp)),'omitnan');

MLD_timeseries(day_order) = squeeze(sum(MLD_temp.*Avea_weight,'all','omitnan')./...
        sum(Avea_weight(~isnan(MLD_temp)),'omitnan'));

STD_MLD_timeseries (day_order) = std(MLD_temp(~isnan(MLD_temp)),'omitnan');

end

figure;

X_data2= (1:1:30)-0.5;
Y_data2= Depth_W_MEAN_timeseries; 
high_line2 = Depth_W_MEAN_timeseries + STD_Depth_W_MEAN_timeseries; 
low_line2 = Depth_W_MEAN_timeseries - STD_Depth_W_MEAN_timeseries; 

X_data1= (1:1:30)-0.5;
Y_data1 =MLD_timeseries; 

high_line1 = MLD_timeseries + STD_MLD_timeseries;
low_line1 = MLD_timeseries - STD_MLD_timeseries;



X_point = []; % location of vertical line
Y_point = []; % location of horizontal line
Color_map = slanCM(188,20); % colormap
Color_choice1 = Color_map(3,:); % Color of the Y1 confident interval
Color_choice2 =  [1 1 1].*0.3 ;  % Color of the grid line 
Color_choice4 =Color_map(1,:); % Color of the Y1 values
Color_choice5 =Color_map(5,:); % Color of the Y2 values
Color_choice6 =Color_map(7,:); % Color of the Y2 confident interval



X_tick = 5:5:25;
X_ticklabel = {'Day 5'; 'Day 10';'Day 15';'Day 20';'Day 25'};
X_lim = [0 30];
Y_tick_2 = -5e-5:2e-5:5e-5; 

Y_tick_1 = 0:20:100; 


Y_lim_2 = [-5e-5 5e-5];
Y_lim_1 = [0 100];

Y_label_2 = 'Vertical velocity (m/s)';
Y_label_1 = 'Mixed-layer depth (m)';

Figure_name = 'GBA_W_MLD_Onset_Pick_time_1_timeseries_Xpixels_600'; 
Font_size = 20;
Line_number1 = [];
Line_number2 = [];
Figure_size = [0 0 100* 7 100*4];
Plot_location = [15 10 70 78]*0.01;
Figure_Title = [];

[mdl_R,mdl_P] = corrcoef(Y_data2(1:end-1),Y_data1(2:end));
 Fit_data=sprintf('R = %.2f (MLD lags by 1 day,p<0.01)',mdl_R(2));
 disp(mdl_P(2));



yyaxis left
patch([X_data1  X_data1(end:-1:1)], [high_line1 low_line1(end:-1:1)], Color_choice1, 'edgecolor', 'none','FaceAlpha',0.3);
    hold on;
a1=plot(X_data1, Y_data1, 'color', Color_choice4, 'marker', '.','MarkerSize',13,'Linewidth',1.5);
ylabel(Y_label_1,'Fontsize',Font_size);
yticks(Y_tick_1);

ylim(Y_lim_1);

yyaxis right
patch([X_data1  X_data1(end:-1:1)], [high_line2 low_line2(end:-1:1)], Color_choice6, 'edgecolor', 'none','FaceAlpha',0.3);
    hold on;
a2=plot(X_data2, Y_data2, 'color', Color_choice5, 'marker', '.','MarkerSize',13,'Linewidth',1.5);

ylabel(Y_label_2,'Fontsize',Font_size);
yticks(Y_tick_2);

ylim(Y_lim_2);
xticks(X_tick)
xticklabels(X_ticklabel);

ax=gca;
set(ax,'Fontsize',Font_size);

set(gca,'layer','top');
title( Fit_data,'Fontsize',Font_size,'FontName','Calibri',"HorizontalAlignment","center","FontWeight","normal");


set(gcf,'position',Figure_size);
set (gca,'position',Plot_location);
set(gca,'Fontname','Calibri','Linewidth',1.5);
box on
hold off
set(gcf,'color','white','paperpositionmode','auto');

%% Figure 4e
load('Figure_4e.mat');
Avea_weight = dX.*dY;

Depth_W_MEAN_timeseries = zeros(1,30);
STD_Depth_W_MEAN_timeseries = zeros(1,30);

MLD_timeseries = zeros(1,30);
STD_MLD_timeseries = zeros(1,30);
MASK = MASK_Deep_50m(:,:,1);
for day_order=1:30
W_temp = squeeze(Depth_W_MEAN(:,:,day_order));

MLD_temp= squeeze(ML_depth(2:end,2:end,day_order+1));



Depth_W_MEAN_timeseries(day_order) = squeeze(sum(W_temp.*Avea_weight,'all','omitnan')./...
        sum(Avea_weight(~isnan(W_temp)),'omitnan'));
STD_Depth_W_MEAN_timeseries(day_order) = std(W_temp(~isnan(W_temp)),'omitnan');

MLD_timeseries(day_order) = squeeze(sum(MLD_temp.*Avea_weight,'all','omitnan')./...
        sum(Avea_weight(~isnan(MLD_temp)),'omitnan'));

STD_MLD_timeseries (day_order) = std(MLD_temp(~isnan(MLD_temp)),'omitnan');

end

figure;

X_data2= (1:1:30)-0.5;
Y_data2= Depth_W_MEAN_timeseries; 
high_line2 = Depth_W_MEAN_timeseries + STD_Depth_W_MEAN_timeseries; 
low_line2 = Depth_W_MEAN_timeseries - STD_Depth_W_MEAN_timeseries; 

X_data1= (1:1:30)-0.5;
Y_data1 =MLD_timeseries; 

high_line1 = MLD_timeseries + STD_MLD_timeseries;
low_line1 = MLD_timeseries - STD_MLD_timeseries;



X_point = []; % location of vertical line
Y_point = []; % location of horizontal line
Color_map = slanCM(188,20); % colormap
Color_choice1 = Color_map(3,:); % Color of the Y1 confident interval
Color_choice2 =  [1 1 1].*0.3 ;  % Color of the grid line 
Color_choice4 =Color_map(1,:); % Color of the Y1 values
Color_choice5 =Color_map(5,:); % Color of the Y2 values
Color_choice6 =Color_map(7,:); % Color of the Y2 confident interval



X_tick = 5:5:25;
X_ticklabel = {'Day 5'; 'Day 10';'Day 15';'Day 20';'Day 25'};
X_lim = [0 30];
Y_tick_2 = -5e-5:2e-5:5e-5; 

Y_tick_1 = 0:20:100; 


Y_lim_2 = [-5e-5 5e-5];
Y_lim_1 = [0 100];

Y_label_2 = 'Vertical velocity (m/s)';
Y_label_1 = 'Mixed-layer depth (m)';

Figure_name = 'GBA_W_MLD_Onset_Pick_time_2_timeseries_Xpixels_600'; 
Font_size = 20;
Line_number1 = [];
Line_number2 = [];
Figure_size = [0 0 100* 7 100*4];
Plot_location = [15 10 70 78]*0.01;
Figure_Title = [];

[mdl_R,mdl_P] = corrcoef(Y_data2(1:end-1),Y_data1(2:end));
 Fit_data=sprintf('R = %.2f (MLD lags by 1 day,p<0.01)',mdl_R(2));
 disp(mdl_P(2));

yyaxis left
patch([X_data1  X_data1(end:-1:1)], [high_line1 low_line1(end:-1:1)], Color_choice1, 'edgecolor', 'none','FaceAlpha',0.3);
    hold on;
a1=plot(X_data1, Y_data1, 'color', Color_choice4, 'marker', '.','MarkerSize',13,'Linewidth',1.5);
ylabel(Y_label_1,'Fontsize',Font_size);
yticks(Y_tick_1);
ylim(Y_lim_1);

yyaxis right
patch([X_data1  X_data1(end:-1:1)], [high_line2 low_line2(end:-1:1)], Color_choice6, 'edgecolor', 'none','FaceAlpha',0.3);
    hold on;
a2=plot(X_data2, Y_data2, 'color', Color_choice5, 'marker', '.','MarkerSize',13,'Linewidth',1.5);

ylabel(Y_label_2,'Fontsize',Font_size);
yticks(Y_tick_2);
ylim(Y_lim_2);
xticks(X_tick)
xticklabels(X_ticklabel);

ax=gca;
set(ax,'Fontsize',Font_size);

set(gca,'layer','top');
title( Fit_data,'Fontsize',Font_size,'FontName','Calibri',"HorizontalAlignment","center","FontWeight","normal");

set(gcf,'position',Figure_size);
set (gca,'position',Plot_location);
set(gca,'Fontname','Calibri','Linewidth',1.5);
box on
hold off
set(gcf,'color','white','paperpositionmode','auto');

%% Figure 4f
load('Figure_4f.mat');
Avea_weight = dX.*dY;

Depth_W_MEAN_timeseries = zeros(1,30);
STD_Depth_W_MEAN_timeseries = zeros(1,30);

MLD_timeseries = zeros(1,30);
STD_MLD_timeseries = zeros(1,30);
MASK = MASK_Deep_50m(:,:,1);
for day_order=1:30
W_temp = squeeze(Depth_W_MEAN(:,:,day_order));

MLD_temp= squeeze(ML_depth(2:end,2:end,day_order+1));



Depth_W_MEAN_timeseries(day_order) = squeeze(sum(W_temp.*Avea_weight,'all','omitnan')./...
        sum(Avea_weight(~isnan(W_temp)),'omitnan'));
STD_Depth_W_MEAN_timeseries(day_order) = std(W_temp(~isnan(W_temp)),'omitnan');

MLD_timeseries(day_order) = squeeze(sum(MLD_temp.*Avea_weight,'all','omitnan')./...
        sum(Avea_weight(~isnan(MLD_temp)),'omitnan'));

STD_MLD_timeseries (day_order) = std(MLD_temp(~isnan(MLD_temp)),'omitnan');

end

figure;

X_data2= (1:1:30)-0.5;
Y_data2= Depth_W_MEAN_timeseries; 
high_line2 = Depth_W_MEAN_timeseries + STD_Depth_W_MEAN_timeseries; 
low_line2 = Depth_W_MEAN_timeseries - STD_Depth_W_MEAN_timeseries; 

X_data1= (1:1:30)-0.5;
Y_data1 =MLD_timeseries; 

high_line1 = MLD_timeseries + STD_MLD_timeseries;
low_line1 = MLD_timeseries - STD_MLD_timeseries;



X_point = []; % location of vertical line
Y_point = []; % location of horizontal line
Color_map = slanCM(188,20); % colormap
Color_choice1 = Color_map(3,:); % Color of the Y1 confident interval
Color_choice2 =  [1 1 1].*0.3 ;  % Color of the grid line 
Color_choice4 =Color_map(1,:); % Color of the Y1 values
Color_choice5 =Color_map(5,:); % Color of the Y2 values
Color_choice6 =Color_map(7,:); % Color of the Y2 confident interval



X_tick = 5:5:25;
X_ticklabel = {'Day 5'; 'Day 10';'Day 15';'Day 20';'Day 25'};
X_lim = [0 30];
Y_tick_2 = -5e-5:2e-5:5e-5; 

Y_tick_1 = (0:10:50)*2; 


Y_lim_2 = [-5e-5 5e-5];
Y_lim_1 = [0 50]*2;

Y_label_2 = 'Vertical velocity (m/s)';
Y_label_1 = 'Mixed-layer depth (m)';

Figure_name = 'GBA_W_MLD_Onset_Pick_time_3_timeseries_Xpixels_600'; 
Font_size = 20;
Line_number1 = [];
Line_number2 = [];
Figure_size = [0 0 100* 7 100*4];
Plot_location = [15 10 70 78]*0.01;
Figure_Title = [];

[mdl_R,mdl_P] = corrcoef(Y_data2(1:end-1),Y_data1(2:end));
 Fit_data=sprintf('R = %.2f (MLD lags by 1 day,p<0.01)',mdl_R(2));
 disp(mdl_P(2));

yyaxis left
patch([X_data1  X_data1(end:-1:1)], [high_line1 low_line1(end:-1:1)], Color_choice1, 'edgecolor', 'none','FaceAlpha',0.3);
    hold on;
a1=plot(X_data1, Y_data1, 'color', Color_choice4, 'marker', '.','MarkerSize',13,'Linewidth',1.5);
ylabel(Y_label_1,'Fontsize',Font_size);
yticks(Y_tick_1);

ylim(Y_lim_1);

yyaxis right
patch([X_data1  X_data1(end:-1:1)], [high_line2 low_line2(end:-1:1)], Color_choice6, 'edgecolor', 'none','FaceAlpha',0.3);
    hold on;
a2=plot(X_data2, Y_data2, 'color', Color_choice5, 'marker', '.','MarkerSize',13,'Linewidth',1.5);

ylabel(Y_label_2,'Fontsize',Font_size);
yticks(Y_tick_2);
% yticklabels(Y_ticklabel_2);
ylim(Y_lim_2);
xticks(X_tick)
xticklabels(X_ticklabel);

ax=gca;
set(ax,'Fontsize',Font_size);

set(gca,'layer','top');
title( Fit_data,'Fontsize',Font_size,'FontName','Calibri',"HorizontalAlignment","center","FontWeight","normal");

set(gcf,'position',Figure_size);
set (gca,'position',Plot_location);
set(gca,'Fontname','Calibri','Linewidth',1.5);
box on
hold off
set(gcf,'color','white','paperpositionmode','auto');

%% Figure 4g
load('Figure_4g.mat');

ML_U_MEAN_anomaly = ML_U_MEAN;
ML_V_MEAN_anomaly = ML_V_MEAN;

ML_U_MEAN_anomaly(:,:,1:2) = ML_U_MEAN(:,:,1:2) - ML_U_MEAN_Clim(:,:,9);
ML_U_MEAN_anomaly(:,:,3:end) = ML_U_MEAN(:,:,3:end) - ML_U_MEAN_Clim(:,:,10);


ML_V_MEAN_anomaly(:,:,1:2)  = ML_V_MEAN(:,:,1:2)  - ML_V_MEAN_Clim(:,:,9);
ML_V_MEAN_anomaly(:,:,3:end) = ML_V_MEAN(:,:,3:end) - ML_V_MEAN_Clim(:,:,10);


Spatial_Data = ML_Horizontal_advection_term_volume_weight_map;

UU_Data=mean(ML_U_MEAN_anomaly(2:end,2:end,2:end),3,'omitnan');
VV_Data=mean(ML_V_MEAN_anomaly(2:end,2:end,2:end),3,'omitnan'); % only rotate data in the plot command

Figure_Name = 'GBA_ML_Heat_budget_H_advection_Decline_anomaly_Pick_time_1' ;

if Spatial_p_Advection <0.05
    Figure_Title = sprintf('Horizontal advection term (R=%.2f)',Spatial_corr_Advection);
else 
    Figure_Title = sprintf('Horizontal advection term');
end
Colorbar_Title = '°C/day';
Colormap_Choice = slanCM('coolwarm');
Colorbar_Min_Max = [-0.4 0.4];
Colorbar_interval = -0.4:0.02:0.4;
Colorbar_Tick_interval = -0.4:0.2:0.4;

scale_factor=1;
Plot_type='pcolor';

figure;
[X,Y]=meshgrid(BRAN_T_lon_GBA,BRAN_T_lat_GBA);
m_proj('equ','long',[111.6 115.8],'lat',[21.4 23.6]);

if (strcmp(Plot_type,'pcolor'))
m_pcolor(X,Y,flipud(rot90(Spatial_Data.*scale_factor)));
shading flat

elseif (strcmp(Plot_type,'contourf'))
m_contourf(X,Y,flipud(rot90(Spatial_Data.*scale_factor)),Colorbar_interval,'edgecolor','none');
end    
    
colormap(Colormap_Choice)
 
ax=m_contfbar([0.15 .85],0.65,Colorbar_Min_Max,Colorbar_interval,'edgecolor','none','endpiece','yes','axfrac',0.04);
ax.XLabel.String = Colorbar_Title;
ax.LineWidth = 1;

set(ax,'tickdir','out','TickLength',[0.01 10],'box','on','Fontsize',20,'XTick',Colorbar_Tick_interval,'FontName','Arial','fontweight', 'normal');% 
hold on;
m_etopo2('contour',[-50;-20],'edgecolor','w','ShowText','on','color','w');% '\color[rgb]{0.4,0.4,0.4}'

m_gshhs_f('patch',[1 1 1]*.95);
m_grid('tickdir','in','xtick', 112 :1: 115.5 ,'xticklable',112 :1: 115.5,...
    'ytick',21.5:0.5:23 ,'yticklable',21.5:0.5:23,'Linewidth',2,'Fontsize',20,'backgroundcolor',[.95 .95 .95],'FontName','Calibri');

vector_scale=1;
Color_Choice = [0 0 0];
m_quiver(X(1:1:end,1:1:end),Y(1:1:end,1:1:end),UU_Data(1:1:end,1:1:end)'.*vector_scale,VV_Data(1:1:end,1:1:end)'.*vector_scale,0,'Color',Color_Choice(1,:),'linewidth',1);

h=m_quiver(111.8,22.5,0.2*vector_scale,0,0);
set(h,'linewidth',1.5,'Color',Color_Choice(1,:));
h.ShowArrowHead='on';
h.MaxHeadSize=1;
m_text(111.8,22.7,'ML current anomaly' ,'fontsize',20,'fontweight', 'normal','FontName','Calibri'); 
m_text(112.2,22.5,'0.2 m/s' ,'fontsize',20,'fontweight', 'normal','FontName','Calibri'); 
title(Figure_Title,'Fontsize',18,'FontName','Calibri',"HorizontalAlignment","center","FontWeight","normal");
set(gcf,'position',[0 0 100*6  100*3.5]);
set (gca,'position',[0.12,0.06,0.82,0.86] )
set(gca,'Fontname','Arial','Linewidth',1.5);
set(gcf,'color','white','paperpositionmode','auto');


%% Figure 4h
load('Figure_4h.mat');
ML_U_MEAN_anomaly = ML_U_MEAN;
ML_V_MEAN_anomaly = ML_V_MEAN;

ML_U_MEAN_anomaly(:,:,1:2) = ML_U_MEAN(:,:,1:2) - ML_U_MEAN_Clim(:,:,5);
ML_U_MEAN_anomaly(:,:,3:end) = ML_U_MEAN(:,:,3:end) - ML_U_MEAN_Clim(:,:,6);


ML_V_MEAN_anomaly(:,:,1:2)  = ML_V_MEAN(:,:,1:2)  - ML_V_MEAN_Clim(:,:,5);
ML_V_MEAN_anomaly(:,:,3:end) = ML_V_MEAN(:,:,3:end) - ML_V_MEAN_Clim(:,:,6);

Spatial_Data = ML_Horizontal_advection_term_volume_weight_map;

UU_Data=mean(ML_U_MEAN_anomaly(2:end,2:end,2:end),3,'omitnan');
VV_Data=mean(ML_V_MEAN_anomaly(2:end,2:end,2:end),3,'omitnan'); % only rotate data in the plot command

Figure_Name = 'GBA_ML_Heat_budget_H_advection_Decline_anomaly_Pick_time_2' ;

if Spatial_p_Advection <0.05
    Figure_Title = sprintf('Horizontal advection term (R=%.2f)',Spatial_corr_Advection);
else 
    Figure_Title = sprintf('Horizontal advection term');
end
Colorbar_Title = '°C/day';
Colormap_Choice = slanCM('coolwarm');
Colorbar_Min_Max = [-0.4 0.4];
Colorbar_interval = -0.4:0.02:0.4;
Colorbar_Tick_interval = -0.4:0.2:0.4;

scale_factor=1;
Plot_type='pcolor';

figure;
[X,Y]=meshgrid(BRAN_T_lon_GBA,BRAN_T_lat_GBA);
m_proj('equ','long',[111.6 115.8],'lat',[21.4 23.6]);

if (strcmp(Plot_type,'pcolor'))
m_pcolor(X,Y,flipud(rot90(Spatial_Data.*scale_factor)));
shading flat

elseif (strcmp(Plot_type,'contourf'))
m_contourf(X,Y,flipud(rot90(Spatial_Data.*scale_factor)),Colorbar_interval,'edgecolor','none');
end    
    
colormap(Colormap_Choice)
 
ax=m_contfbar([0.15 .85],0.65,Colorbar_Min_Max,Colorbar_interval,'edgecolor','none','endpiece','yes','axfrac',0.04);
ax.XLabel.String = Colorbar_Title;
ax.LineWidth = 1;

set(ax,'tickdir','out','TickLength',[0.01 10],'box','on','Fontsize',20,'XTick',Colorbar_Tick_interval,'FontName','Arial','fontweight', 'normal');% 
hold on;
m_etopo2('contour',[-50;-20],'edgecolor','w','ShowText','on','color','w');% '\color[rgb]{0.4,0.4,0.4}'

m_gshhs_f('patch',[1 1 1]*.95);
m_grid('tickdir','in','xtick', 112 :1: 115.5 ,'xticklable',112 :1: 115.5,...
    'ytick',21.5:0.5:23 ,'yticklable',21.5:0.5:23,'Linewidth',2,'Fontsize',20,'backgroundcolor',[.95 .95 .95],'FontName','Calibri');

vector_scale=1;
Color_Choice = [0 0 0];
m_quiver(X(1:1:end,1:1:end),Y(1:1:end,1:1:end),UU_Data(1:1:end,1:1:end)'.*vector_scale,VV_Data(1:1:end,1:1:end)'.*vector_scale,0,'Color',Color_Choice(1,:),'linewidth',1);

h=m_quiver(111.8,22.5,0.2*vector_scale,0,0);
set(h,'linewidth',1.5,'Color',Color_Choice(1,:));
h.ShowArrowHead='on';
h.MaxHeadSize=1;
m_text(111.8,22.7,'ML current anomaly' ,'fontsize',20,'fontweight', 'normal','FontName','Calibri'); 
m_text(112.2,22.5,'0.2 m/s' ,'fontsize',20,'fontweight', 'normal','FontName','Calibri'); 
title(Figure_Title,'Fontsize',18,'FontName','Calibri',"HorizontalAlignment","center","FontWeight","normal");
set(gcf,'position',[0 0 100*6  100*3.5]);
set (gca,'position',[0.12,0.06,0.82,0.86] )
set(gca,'Fontname','Arial','Linewidth',1.5);
set(gcf,'color','white','paperpositionmode','auto');

%% Figure 4i
load('Figure_4i.mat');
ML_U_MEAN_anomaly = ML_U_MEAN;
ML_V_MEAN_anomaly = ML_V_MEAN;

ML_U_MEAN_anomaly(:,:,1:29) = ML_U_MEAN(:,:,1:29) - ML_U_MEAN_Clim(:,:,4);
ML_U_MEAN_anomaly(:,:,30:end) = ML_U_MEAN(:,:,30:end) - ML_U_MEAN_Clim(:,:,5);


ML_V_MEAN_anomaly(:,:,1:29)  = ML_V_MEAN(:,:,1:29)  - ML_V_MEAN_Clim(:,:,4);
ML_V_MEAN_anomaly(:,:,30:end) = ML_V_MEAN(:,:,30:end) - ML_V_MEAN_Clim(:,:,5);

Spatial_Data = ML_Horizontal_advection_term_volume_weight_map;

UU_Data=mean(ML_U_MEAN_anomaly(2:end,2:end,2:end),3,'omitnan');
VV_Data=mean(ML_V_MEAN_anomaly(2:end,2:end,2:end),3,'omitnan'); % only rotate data in the plot command

Figure_Name = 'GBA_ML_Heat_budget_H_advection_Decline_anomaly_Pick_time_3' ;

if Spatial_p_Advection <0.05
    Figure_Title = sprintf('Horizontal advection term (R=%.2f)',Spatial_corr_Advection);
else 
    Figure_Title = sprintf('Horizontal advection term');
end
Colorbar_Title = '°C/day';
Colormap_Choice = slanCM('coolwarm');
Colorbar_Min_Max = [-0.4 0.4];
Colorbar_interval = -0.4:0.02:0.4;
Colorbar_Tick_interval = -0.4:0.2:0.4;

scale_factor=1;
Plot_type='pcolor';

figure;
[X,Y]=meshgrid(BRAN_T_lon_GBA,BRAN_T_lat_GBA);
m_proj('equ','long',[111.6 115.8],'lat',[21.4 23.6]);

if (strcmp(Plot_type,'pcolor'))
m_pcolor(X,Y,flipud(rot90(Spatial_Data.*scale_factor)));
shading flat

elseif (strcmp(Plot_type,'contourf'))
m_contourf(X,Y,flipud(rot90(Spatial_Data.*scale_factor)),Colorbar_interval,'edgecolor','none');
end    
    
colormap(Colormap_Choice)
 
ax=m_contfbar([0.15 .85],0.65,Colorbar_Min_Max,Colorbar_interval,'edgecolor','none','endpiece','yes','axfrac',0.04);
ax.XLabel.String = Colorbar_Title;
ax.LineWidth = 1;

set(ax,'tickdir','out','TickLength',[0.01 10],'box','on','Fontsize',20,'XTick',Colorbar_Tick_interval,'FontName','Arial','fontweight', 'normal');% 
hold on;
m_etopo2('contour',[-50;-20],'edgecolor','w','ShowText','on','color','w');% '\color[rgb]{0.4,0.4,0.4}'

m_gshhs_f('patch',[1 1 1]*.95);
m_grid('tickdir','in','xtick', 112 :1: 115.5 ,'xticklable',112 :1: 115.5,...
    'ytick',21.5:0.5:23 ,'yticklable',21.5:0.5:23,'Linewidth',2,'Fontsize',20,'backgroundcolor',[.95 .95 .95],'FontName','Calibri');

vector_scale=1;
Color_Choice = [0 0 0];
m_quiver(X(1:1:end,1:1:end),Y(1:1:end,1:1:end),UU_Data(1:1:end,1:1:end)'.*vector_scale,VV_Data(1:1:end,1:1:end)'.*vector_scale,0,'Color',Color_Choice(1,:),'linewidth',1);

h=m_quiver(111.8,22.5,0.2*vector_scale,0,0);
set(h,'linewidth',1.5,'Color',Color_Choice(1,:));
h.ShowArrowHead='on';
h.MaxHeadSize=1;
m_text(111.8,22.7,'ML current anomaly' ,'fontsize',20,'fontweight', 'normal','FontName','Calibri'); 
m_text(112.2,22.5,'0.2 m/s' ,'fontsize',20,'fontweight', 'normal','FontName','Calibri'); 
title(Figure_Title,'Fontsize',18,'FontName','Calibri',"HorizontalAlignment","center","FontWeight","normal");
set(gcf,'position',[0 0 100*6  100*3.5]);
set (gca,'position',[0.12,0.06,0.82,0.86] )
set(gca,'Fontname','Arial','Linewidth',1.5);
set(gcf,'color','white','paperpositionmode','auto');

%% Figure 4j
load('Figure_4j.mat');
Avea_weight = dX.*dY;

Depth_W_MEAN_timeseries = zeros(1,30);
STD_Depth_W_MEAN_timeseries = zeros(1,30);

MLD_timeseries = zeros(1,30);
STD_MLD_timeseries = zeros(1,30);

for day_order=1:30
W_temp = squeeze(Depth_W_MEAN(:,:,day_order));

MLD_temp= squeeze(ML_depth(2:end,2:end,day_order+1));



Depth_W_MEAN_timeseries(day_order) = squeeze(sum(W_temp.*Avea_weight,'all','omitnan')./...
        sum(Avea_weight(~isnan(W_temp)),'omitnan'));
STD_Depth_W_MEAN_timeseries(day_order) = std(W_temp(~isnan(W_temp)),'omitnan');

MLD_timeseries(day_order) = squeeze(sum(MLD_temp.*Avea_weight,'all','omitnan')./...
        sum(Avea_weight(~isnan(MLD_temp)),'omitnan'));

STD_MLD_timeseries (day_order) = std(MLD_temp(~isnan(MLD_temp)),'omitnan');

end

figure;

X_data2= (1:1:30)-0.5;
Y_data2= Depth_W_MEAN_timeseries; 
high_line2 = Depth_W_MEAN_timeseries + STD_Depth_W_MEAN_timeseries; 
low_line2 = Depth_W_MEAN_timeseries - STD_Depth_W_MEAN_timeseries; 

X_data1= (1:1:30)-0.5;
Y_data1 =MLD_timeseries; 

high_line1 = MLD_timeseries + STD_MLD_timeseries;
low_line1 = MLD_timeseries - STD_MLD_timeseries;



X_point = []; % location of vertical line
Y_point = []; % location of horizontal line
Color_map = slanCM(188,20); % colormap
Color_choice1 = Color_map(3,:); % Color of the Y1 confident interval
Color_choice2 =  [1 1 1].*0.3 ;  % Color of the grid line 
Color_choice4 =Color_map(1,:); % Color of the Y1 values
Color_choice5 =Color_map(5,:); % Color of the Y2 values
Color_choice6 =Color_map(7,:); % Color of the Y2 confident interval



X_tick = 5:5:25;
X_ticklabel = {'Day 5'; 'Day 10';'Day 15';'Day 20';'Day 25'};
X_lim = [0 30];
Y_tick_2 = -5e-5:2e-5:5e-5; 

Y_tick_1 = (0:10:50)*2; 


Y_lim_2 = [-5e-5 5e-5];
Y_lim_1 = [0 50]*2;

Y_label_2 = 'Vertical velocity (m/s)';
Y_label_1 = 'Mixed-layer depth (m)';

Figure_name = 'GBA_W_MLD_Decline_Pick_time_1_timeseries_Xpixels_600'; 
Font_size = 20;
Line_number1 = [];
Line_number2 = [];
Figure_size = [0 0 100* 7 100*4];
Plot_location = [15 10 70 78]*0.01;
Figure_Title = [];

[mdl_R,mdl_P] = corrcoef(Y_data2(1:end-1),Y_data1(2:end));
 Fit_data=sprintf('R = %.2f (MLD lags by 1 day)',mdl_R(2));
 disp(mdl_P(2));

yyaxis left
patch([X_data1  X_data1(end:-1:1)], [high_line1 low_line1(end:-1:1)], Color_choice1, 'edgecolor', 'none','FaceAlpha',0.3);
    hold on;
a1=plot(X_data1, Y_data1, 'color', Color_choice4, 'marker', '.','MarkerSize',13,'Linewidth',1.5);
ylabel(Y_label_1,'Fontsize',Font_size);
yticks(Y_tick_1);

ylim(Y_lim_1);

yyaxis right
patch([X_data1  X_data1(end:-1:1)], [high_line2 low_line2(end:-1:1)], Color_choice6, 'edgecolor', 'none','FaceAlpha',0.3);
    hold on;
a2=plot(X_data2, Y_data2, 'color', Color_choice5, 'marker', '.','MarkerSize',13,'Linewidth',1.5);

ylabel(Y_label_2,'Fontsize',Font_size);
yticks(Y_tick_2);

ylim(Y_lim_2);
xticks(X_tick)
xticklabels(X_ticklabel);

ax=gca;
set(ax,'Fontsize',Font_size);

set(gca,'layer','top');
title( Fit_data,'Fontsize',Font_size,'FontName','Calibri','Color',[1 1 1]*0.5,"HorizontalAlignment","center","FontWeight","normal");


set(gcf,'position',Figure_size);
set (gca,'position',Plot_location);
set(gca,'Fontname','Calibri','Linewidth',1.5);
box on
hold off
set(gcf,'color','white','paperpositionmode','auto');

%% Figure 4k
load('Figure_4k.mat');
Avea_weight = dX.*dY;

Depth_W_MEAN_timeseries = zeros(1,30);
STD_Depth_W_MEAN_timeseries = zeros(1,30);

MLD_timeseries = zeros(1,30);
STD_MLD_timeseries = zeros(1,30);

for day_order=1:30
W_temp = squeeze(Depth_W_MEAN(:,:,day_order));

MLD_temp= squeeze(ML_depth(2:end,2:end,day_order+1));



Depth_W_MEAN_timeseries(day_order) = squeeze(sum(W_temp.*Avea_weight,'all','omitnan')./...
        sum(Avea_weight(~isnan(W_temp)),'omitnan'));
STD_Depth_W_MEAN_timeseries(day_order) = std(W_temp(~isnan(W_temp)),'omitnan');

MLD_timeseries(day_order) = squeeze(sum(MLD_temp.*Avea_weight,'all','omitnan')./...
        sum(Avea_weight(~isnan(MLD_temp)),'omitnan'));

STD_MLD_timeseries (day_order) = std(MLD_temp(~isnan(MLD_temp)),'omitnan');

end

figure;

X_data2= (1:1:30)-0.5;
Y_data2= Depth_W_MEAN_timeseries; 
high_line2 = Depth_W_MEAN_timeseries + STD_Depth_W_MEAN_timeseries; 
low_line2 = Depth_W_MEAN_timeseries - STD_Depth_W_MEAN_timeseries; 

X_data1= (1:1:30)-0.5;
Y_data1 =MLD_timeseries; 

high_line1 = MLD_timeseries + STD_MLD_timeseries;
low_line1 = MLD_timeseries - STD_MLD_timeseries;



X_point = []; % location of vertical line
Y_point = []; % location of horizontal line
Color_map = slanCM(188,20); % colormap
Color_choice1 = Color_map(3,:); % Color of the Y1 confident interval
Color_choice2 =  [1 1 1].*0.3 ;  % Color of the grid line 
Color_choice4 =Color_map(1,:); % Color of the Y1 values
Color_choice5 =Color_map(5,:); % Color of the Y2 values
Color_choice6 =Color_map(7,:); % Color of the Y2 confident interval



X_tick = 5:5:25;
X_ticklabel = {'Day 5'; 'Day 10';'Day 15';'Day 20';'Day 25'};
X_lim = [0 30];
Y_tick_2 = -5e-5:2e-5:5e-5; 

Y_tick_1 = (0:10:50).*2; 


Y_lim_2 = [-5e-5 5e-5];
Y_lim_1 = [0 100];
Y_label_2 = 'Vertical velocity (m/s)';
Y_label_1 = 'Mixed-layer depth (m)';

Figure_name = 'GBA_W_MLD_Decline_Pick_time_2_timeseries_Xpixels_600'; 
Font_size = 20;
Line_number1 = [];
Line_number2 = [];
Figure_size = [0 0 100* 7 100*4];
Plot_location = [15 10 70 78]*0.01;
Figure_Title = [];

[mdl_R,mdl_P] = corrcoef(Y_data2(1:end-1),Y_data1(2:end));
 Fit_data=sprintf('R = %.2f (MLD lags by 1 day,p<0.01)',mdl_R(2));
 disp(mdl_P(2));

yyaxis left
patch([X_data1  X_data1(end:-1:1)], [high_line1 low_line1(end:-1:1)], Color_choice1, 'edgecolor', 'none','FaceAlpha',0.3);
    hold on;
a1=plot(X_data1, Y_data1, 'color', Color_choice4, 'marker', '.','MarkerSize',13,'Linewidth',1.5);
ylabel(Y_label_1,'Fontsize',Font_size);
yticks(Y_tick_1);
ylim(Y_lim_1);

yyaxis right
patch([X_data1  X_data1(end:-1:1)], [high_line2 low_line2(end:-1:1)], Color_choice6, 'edgecolor', 'none','FaceAlpha',0.3);
    hold on;
a2=plot(X_data2, Y_data2, 'color', Color_choice5, 'marker', '.','MarkerSize',13,'Linewidth',1.5);

ylabel(Y_label_2,'Fontsize',Font_size);
yticks(Y_tick_2);
ylim(Y_lim_2);
xticks(X_tick)
xticklabels(X_ticklabel);

ax=gca;
set(ax,'Fontsize',Font_size);

set(gca,'layer','top');
title( Fit_data,'Fontsize',Font_size,'FontName','Calibri',"HorizontalAlignment","center","FontWeight","normal");

set(gcf,'position',Figure_size);
set (gca,'position',Plot_location);
set(gca,'Fontname','Calibri','Linewidth',1.5);
box on
hold off
set(gcf,'color','white','paperpositionmode','auto');

%% Figure 4l
load('Figure_4l.mat');
Avea_weight = dX.*dY;

Depth_W_MEAN_timeseries = zeros(1,30);
STD_Depth_W_MEAN_timeseries = zeros(1,30);

MLD_timeseries = zeros(1,30);
STD_MLD_timeseries = zeros(1,30);

for day_order=1:30
W_temp = squeeze(Depth_W_MEAN(:,:,day_order));

MLD_temp= squeeze(ML_depth(2:end,2:end,day_order+1));



Depth_W_MEAN_timeseries(day_order) = squeeze(sum(W_temp.*Avea_weight,'all','omitnan')./...
        sum(Avea_weight(~isnan(W_temp)),'omitnan'));
STD_Depth_W_MEAN_timeseries(day_order) = std(W_temp(~isnan(W_temp)),'omitnan');

MLD_timeseries(day_order) = squeeze(sum(MLD_temp.*Avea_weight,'all','omitnan')./...
        sum(Avea_weight(~isnan(MLD_temp)),'omitnan'));

STD_MLD_timeseries (day_order) = std(MLD_temp(~isnan(MLD_temp)),'omitnan');

end

figure;

X_data2= (1:1:30)-0.5;
Y_data2= Depth_W_MEAN_timeseries; 
high_line2 = Depth_W_MEAN_timeseries + STD_Depth_W_MEAN_timeseries; 
low_line2 = Depth_W_MEAN_timeseries - STD_Depth_W_MEAN_timeseries; 

X_data1= (1:1:30)-0.5;
Y_data1 =MLD_timeseries; 

high_line1 = MLD_timeseries + STD_MLD_timeseries;
low_line1 = MLD_timeseries - STD_MLD_timeseries;



X_point = []; % location of vertical line
Y_point = []; % location of horizontal line
Color_map = slanCM(188,20); % colormap
Color_choice1 = Color_map(3,:); % Color of the Y1 confident interval
Color_choice2 =  [1 1 1].*0.3 ;  % Color of the grid line 
Color_choice4 =Color_map(1,:); % Color of the Y1 values
Color_choice5 =Color_map(5,:); % Color of the Y2 values
Color_choice6 =Color_map(7,:); % Color of the Y2 confident interval



X_tick = 5:5:25;
X_ticklabel = {'Day 5'; 'Day 10';'Day 15';'Day 20';'Day 25'};
X_lim = [0 30];
Y_tick_2 = -5e-5:2e-5:5e-5; 

Y_tick_1 = (0:10:50).*2; 


Y_lim_2 = [-5e-5 5e-5];
Y_lim_1 = [0 100];
Y_label_2 = 'Vertical velocity (m/s)';
Y_label_1 = 'Mixed-layer depth (m)';

Figure_name = 'GBA_W_MLD_Decline_Pick_time_3_timeseries_Xpixels_600'; 
Font_size = 20;
Line_number1 = [];
Line_number2 = [];
Figure_size = [0 0 100* 7 100*4];
Plot_location = [15 10 70 78]*0.01;
Figure_Title = [];

[mdl_R,mdl_P] = corrcoef(Y_data2(1:end-1),Y_data1(2:end));
 Fit_data=sprintf('R = %.2f (MLD lags by 1 day,p<0.01)',mdl_R(2));
 disp(mdl_P(2));

yyaxis left
patch([X_data1  X_data1(end:-1:1)], [high_line1 low_line1(end:-1:1)], Color_choice1, 'edgecolor', 'none','FaceAlpha',0.3);
    hold on;
a1=plot(X_data1, Y_data1, 'color', Color_choice4, 'marker', '.','MarkerSize',13,'Linewidth',1.5);
ylabel(Y_label_1,'Fontsize',Font_size);
yticks(Y_tick_1);

ylim(Y_lim_1);

yyaxis right
patch([X_data1  X_data1(end:-1:1)], [high_line2 low_line2(end:-1:1)], Color_choice6, 'edgecolor', 'none','FaceAlpha',0.3);
    hold on;
a2=plot(X_data2, Y_data2, 'color', Color_choice5, 'marker', '.','MarkerSize',13,'Linewidth',1.5);

ylabel(Y_label_2,'Fontsize',Font_size);
yticks(Y_tick_2);
ylim(Y_lim_2);
xticks(X_tick)
xticklabels(X_ticklabel);

ax=gca;
set(ax,'Fontsize',Font_size);

set(gca,'layer','top');
title( Fit_data,'Fontsize',Font_size,'FontName','Calibri',"HorizontalAlignment","center","FontWeight","normal");

set(gcf,'position',Figure_size);
set (gca,'position',Plot_location);
set(gca,'Fontname','Calibri','Linewidth',1.5);
box on
hold off
set(gcf,'color','white','paperpositionmode','auto');
