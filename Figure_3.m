load('slanCM_Data.mat');
%% Figure 3a
load('Figure_3a.mat');

low_line = SWR_clim_timeseries_area_mean - SWR_clim_timeseries_area_STD;
high_line = SWR_clim_timeseries_area_mean + SWR_clim_timeseries_area_STD;
low_line_full= [low_line(end);low_line;low_line(1)];
high_line_full = [high_line(end); high_line; high_line(1)];

low_line_2 = SWR_clim_timeseries_area_mean - SWR_clim_timeseries_area_STD*2;
high_line_2 = SWR_clim_timeseries_area_mean + SWR_clim_timeseries_area_STD*2;
low_line_full_2= [low_line_2(end);low_line_2;low_line_2(1)];
high_line_full_2 = [high_line_2(end); high_line_2; high_line_2(1)];

SWR_clim_timeseries_area_mean_full = [SWR_clim_timeseries_area_mean(end); SWR_clim_timeseries_area_mean; SWR_clim_timeseries_area_mean(1)];

low_line_onset_1 = Q_swf_onset_1_mean - Q_swf_onset_1_STD;
high_line_onset_1 = Q_swf_onset_1_mean + Q_swf_onset_1_STD;

low_line_onset_2 = Q_swf_onset_2_mean - Q_swf_onset_2_STD;
high_line_onset_2 = Q_swf_onset_2_mean + Q_swf_onset_2_STD;

low_line_onset_3 = Q_swf_onset_3_mean - Q_swf_onset_3_STD;
high_line_onset_3 = Q_swf_onset_3_mean + Q_swf_onset_3_STD;

low_line_decline_1 = Q_swf_decline_1_mean - Q_swf_decline_1_STD;
high_line_decline_1 = Q_swf_decline_1_mean + Q_swf_decline_1_STD;

low_line_decline_2 = Q_swf_decline_2_mean - Q_swf_decline_2_STD;
high_line_decline_2 = Q_swf_decline_2_mean + Q_swf_decline_2_STD;

low_line_decline_3 = Q_swf_decline_3_mean - Q_swf_decline_3_STD;
high_line_decline_3 = Q_swf_decline_3_mean + Q_swf_decline_3_STD;
%
figure;
color1=slanCM(188,20);
Time_X=0:1:13;
patch1 = patch([Time_X  Time_X(end:-1:1)], [high_line_full' low_line_full(end:-1:1)'], color1(4,:), 'edgecolor', 'none');
name8 = 'Standard deviation';
hold on;
point7 = plot(Time_X,SWR_clim_timeseries_area_mean_full', 'linewidth', 2,'color', color1(1,:), 'marker', '*','MarkerSize',3);

month_name2={'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec',''};
name7 = 'Monthly climatology';
xticks([1 2 3 4 5 6 7 8 9 10 11 12]);
xticklabels(char(month_name2));
xtickangle(gca,0);
ax=gca;

ax.TickLength=[0  0];
     
set(gca,'layer','top');% important: put the axis on top of the plotted data

xticklocation= 1.5:1:12.5;

%Xtick
for i=1:11
p1 = [xticklocation(i),xticklocation(i)];
p2 = [0,13];
line(p1,p2,'Color','k','LineWidth',1.5);
end
ylim_min=0;
ylim_max=300;
ylim([ylim_min ylim_max]);
yticks(ylim_min:100:ylim_max)
xlim([0.5 12.5]);
ylabel('Area-averaged SWR (W/m^2) ','Fontsize',20);
set(gca,'layer','top');
hold on;

% ytick
for i=1:5
p1 = [0.5,0.7];
p3 = [12.5,12.3];
p2 = [i*50,i*50];
line(p1,p2,'Color','k','LineWidth',1.5);
line(p3,p2,'Color','k','LineWidth',1.5);
end

patch([Q_swf_onset_1_X_time  Q_swf_onset_1_X_time(end:-1:1)], [high_line_onset_1' low_line_onset_1(end:-1:1)'], color1(8,:), 'edgecolor', 'none');
hold on;
point1 = plot(Q_swf_onset_1_X_time,Q_swf_onset_1_mean', 'linewidth', 1.5,'color', color1(5,:), 'LineStyle','-');

name1 = 'Onset of 2017 event';


patch([Q_swf_decline_1_X_time  Q_swf_decline_1_X_time(end:-1:1)], [high_line_decline_1' low_line_decline_1(end:-1:1)'], color1(8,:), 'edgecolor', 'none');
hold on;
point2 = plot(Q_swf_decline_1_X_time,Q_swf_decline_1_mean', 'linewidth', 1.5,'color', color1(5,:), 'LineStyle',':');

name2 = 'Decline of 2017 event';

patch([Q_swf_onset_2_X_time  Q_swf_onset_2_X_time(end:-1:1)], [high_line_onset_2' low_line_onset_2(end:-1:1)'], color1(12,:), 'edgecolor', 'none');
hold on;
point3 = plot(Q_swf_onset_2_X_time,Q_swf_onset_2_mean', 'linewidth', 1.5,'color', color1(9,:), 'LineStyle','-');

name3 = 'Onset of 2018 event';


patch([Q_swf_decline_2_X_time  Q_swf_decline_2_X_time(end:-1:1)], [high_line_decline_2' low_line_decline_2(end:-1:1)'], color1(12,:), 'edgecolor', 'none');
hold on;
point4 = plot(Q_swf_decline_2_X_time,Q_swf_decline_2_mean', 'linewidth', 1.5,'color', color1(9,:), 'LineStyle',':');

name4 = 'Decline of 2018 event';

patch([Q_swf_onset_3_X_time  Q_swf_onset_3_X_time(end:-1:1)], [high_line_onset_3' low_line_onset_3(end:-1:1)'], color1(16,:), 'edgecolor', 'none');
hold on;
point5 = plot(Q_swf_onset_3_X_time,Q_swf_onset_3_mean', 'linewidth', 1.5,'color', color1(13,:),'LineStyle','-');

name5 = 'Onset of 2021 event';

patch([Q_swf_decline_3_X_time  Q_swf_decline_3_X_time(end:-1:1)], [high_line_decline_3' low_line_decline_3(end:-1:1)'], color1(16,:), 'edgecolor', 'none');
hold on;
point6 = plot(Q_swf_decline_3_X_time,Q_swf_decline_3_mean', 'linewidth', 1.5,'color', color1(13,:),'LineStyle',':');

name6 = 'Decline of 2021 event';

set(gcf,'position',[0 0 100*9 100*5]);
set (gca,'position',[0.12,0.06,0.85,0.86] );
set(gca,'Fontname','Calibri','Linewidth',1.5,'Fontsize',20);
box on
hold off

set(gcf,'color','white','paperpositionmode','auto');
lg1 = legend([patch1 point7 point1 point2 point3 point4 point5 point6],{char(name8),char(name7),char(name1),char(name2),char(name3),char(name4),char(name5),char(name6)},...
    'Location','southoutside','Orientation','vertical','Fontsize',20,'Fontname','Calibri','Box','off','NumColumns',3,'NumColumnsMode','manual');

%% Figure 3b

load('Figure_3b.mat');
dX=zeros(length(CMEMS_Wind_lon)-1,length(CMEMS_Wind_lat)-1);
dY=zeros(length(CMEMS_Wind_lon)-1,length(CMEMS_Wind_lat)-1);
 wgs84 = wgs84Ellipsoid("m");
 
 for lon_order=2: length(CMEMS_Wind_lon)
      for lat_order=2: length(CMEMS_Wind_lat)
         dY(lon_order-1,lat_order-1)=round(distance([CMEMS_Wind_lat(lat_order-1),CMEMS_Wind_lon(lon_order)],...
             [CMEMS_Wind_lat(lat_order),CMEMS_Wind_lon(lon_order)],wgs84)); % Distance between each latitude bin (meter)
         dX(lon_order-1,lat_order-1)=round(distance([CMEMS_Wind_lat(lat_order),CMEMS_Wind_lon(lon_order-1)],...
             [CMEMS_Wind_lat(lat_order),CMEMS_Wind_lon(lon_order)],wgs84)); % Distance between each longitude bin (meter)
      end
 end
UU_Data = zeros(12,1);
VV_Data = zeros(12,1);
for monthorder = 1:12
    U_temp = squeeze(CMEMS_Wind_E_monthly(2:end,2:end,monthorder));
    V_temp = squeeze(CMEMS_Wind_N_monthly(2:end,2:end,monthorder));

    UU_Data(monthorder) = sum(U_temp.*dX.*dY,'all','omitnan')./sum(dX(~isnan(U_temp)).*dY(~isnan(U_temp)),'all');
    VV_Data(monthorder) = sum(V_temp.*dX.*dY,'all','omitnan')./sum(dX(~isnan(V_temp)).*dY(~isnan(V_temp)),'all');% only rotate data in the plot command
end
% plot figure
figure
month_name={'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};
hold on
f=feather(UU_Data,VV_Data);
Color_Choice = slanCM(139,13);
for i=1:12
f1 = f(i);
f1.Color = Color_Choice(i+1,:);
scatter(i,0,'Marker','o','MarkerEdgeColor',Color_Choice(i+1,:),'MarkerFaceColor',Color_Choice(i+1,:),'SizeData',30)

f1.LineWidth = 2.5;
end
f(13).Color = 'k';
f(13).LineWidth = 1.5;
 a = line([-2.5 0.95],[0 0],'Color','k','LineWidth',1.5);
 b = line([12.05 12.5],[0 0],'Color','k','LineWidth',1.5);
month_name2={'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec',''};

xticks([1 2 3 4 5 6 7 8 9 10 11 12]);
xticklabels([]);
xtickangle(gca,0);
ax=gca;


ax.TickLength=[0  0];
     
set(gca,'layer','top');% important: put the axis on top o the plotted data



ylim_min=-5;
ylim_max=5;
ylim([ylim_min ylim_max]);
yticks([-2.5,2.5])
yticklabels({'South';'North'});
ax=gca;
ytickangle(ax,90);
ax.TickLength=[0  0];
xlim([-2.5 12.5]);
ylabel('Wind direction','Fontsize',18,'FontName','Calibri');
xlabel('Monthly climatology ','Fontsize',18,'FontName','Calibri');
set(gca,'layer','top');
lg1 = legend(month_name2,...
    'Location','north','Orientation','horizontal','Fontsize',20,'Fontname','Calibri','Box','off','NumColumns',6,'NumColumnsMode','manual');
set(gcf,'position',[0 0 100*9 100*3.8]);
set (gca,'position',[0.12,0.12,0.85,0.85] );
set(gca,'Fontname','Calibri','Linewidth',1.5,'Fontsize',20);
set(gcf,'color','white','paperpositionmode','auto');
box on

%% Figure 3c
load('Figure_3c.mat');
% Hovmoller plot of W vs month
W_profile_timeseries = Profiles_W_MEAN_Clim(1:17,:);
Z_Depth_T=-Z_middle_U(1:17);
daypart=0.5:1:11.5;
[X,Y]=meshgrid(daypart,Z_Depth_T);
figure;
scale_factor=1e5;
W_profile_timeseries(W_profile_timeseries==0)=NaN;
contourf(X,Y,W_profile_timeseries(1:17,:).*scale_factor,(-2e-5:5e-7:2e-5).*scale_factor,'edgecolor','none');

hold on
c=colorbar('h');
colormap(slanCM('coolwarm',40))

clim([-2e-5 2e-5]*scale_factor);



[C1,h1] = contour(X,Y,W_profile_timeseries(1:17,:).*scale_factor,[0 0],'k','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',20,'Color','k','Fontweight','bold')
[C1,h1] = contour(X,Y,W_profile_timeseries(1:17,:).*scale_factor,0.5:0.5:2,'Color','#00B2EE','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',20,'Color','k','Fontweight','bold')
[C2,h2] = contour(X,Y,W_profile_timeseries(1:17,:).*scale_factor,-2:0.5:-0.5,'Color','#EE2C2C','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C2,h2,'FontSize',20,'Color','k','Fontweight','bold')

name1=sprintf('Monthly climatology of vertical velocity in depth (10^-^5 m/s)');
set(get(c,'ylabel'),'string',char(name1),'Fontsize',20);
set(c,'Fontsize',20,'Ticks',-2:1:2);
set(gca,'Fontsize',20);

yticks(-120:20:-20);
yticklabels({'120'; '100';'80';'60';'40';'20'});
xticks(1:1:12);

xticklabels({'Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';'Oct';'Nov';'Dec'});
xtickangle(gca,0);
ax = gca;
ax.XAxis.TickLength = [0 0];

for i=1:10
    plot([0.5+i,0.5+i],[-125,-123.5],'k','Linewidth',1.2);
    plot([0.5+i,0.5+i],[-4,-2.5],'k','Linewidth',1.2);
end

ylabel('Water depth (m)','Fontsize',20);
set(gca,'layer','top');
hold on;

set(gcf,'position',[0 0 100*9 100*6]);
set (gca,'position',[0.12,0.28,0.85,0.70] );
set(gca,'Fontname','Calibri','Linewidth',1.5);
hold off
set(gcf,'color','white','paperpositionmode','auto');
