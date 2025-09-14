load('slanCM_Data.mat');
%% Figure 2a-b
% time period of Onset_Pick_time_1 2017-08-30 to 2017-09-29

load('Figure_2a_b.mat');
% shallow region
Z_Depth_T=-Z_middle_T(1:17);
daypart=0.5:1:29.5;
[X,Y]=meshgrid(daypart,Z_Depth_T);
figure;
MHW_intensity_profile_timeseries_shallow(MHW_intensity_profile_timeseries_shallow==0)=NaN;
contourf(X,Y,MHW_intensity_profile_timeseries_shallow(1:17,:),0:0.1:3,'edgecolor','none');

hold on
c=colorbar('h');
a = slanCM('magma',45);
colormap(a(16:end,:));

clim([0 3]);

scale_factor=1e5;

[C1,h1] = contour(X,Y,W_profile_timeseries_shallow(1:17,:).*scale_factor,[0 0],'k','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C1,h1] = contour(X,Y,W_profile_timeseries_shallow(1:17,:).*scale_factor,1:1:4,'Color','#00B2EE','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C2,h2] = contour(X,Y,W_profile_timeseries_shallow(1:17,:).*scale_factor,-4:1:-1,'Color','#EE2C2C','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C2,h2,'FontSize',12,'Color','k','Fontweight','bold')

name1=sprintf('MHW intensity (bathys ≤ 50m,°C)\nVertical velocity (contour,10^-^5 m/s)');
set(get(c,'ylabel'),'string',char(name1),'Fontsize',20);
set(c,'Fontsize',20,'Ticks',0:0.5:3);
set(gca,'Fontsize',20);

yticks(-120:20:-20);
yticklabels({'120'; '100';'80';'60';'40';'20'});
xticks(5:5:25);
xticklabels({'Day 5'; 'Day 10';'Day 15';'Day 20';'Day 25'});
xtickangle(gca,0);


ylabel('Water depth (m)','Fontsize',20);
set(gca,'layer','top');
hold on;

set(gcf,'position',[0 0 100*6 100*6.3]);
set (gca,'position',[0.15,0.3,0.80,0.69] );
set(gca,'Fontname','Calibri','Linewidth',1.5);
hold off
set(gcf,'color','white','paperpositionmode','auto');

% deep region

Z_Depth_T=-Z_middle_T(1:17);
daypart=0.5:1:29.5;
[X,Y]=meshgrid(daypart,Z_Depth_T);
figure;
MHW_intensity_profile_timeseries_deep(MHW_intensity_profile_timeseries_deep==0)=NaN;
contourf(X,Y,MHW_intensity_profile_timeseries_deep(1:17,:),0:0.1:3,'edgecolor','none');

hold on
c=colorbar('h');
a = slanCM('magma',45);
colormap(a(16:end,:));

clim([0 3]);

scale_factor=1e5;

[C1,h1] = contour(X,Y,W_profile_timeseries_deep(1:17,:).*scale_factor,[0 0],'k','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C1,h1] = contour(X,Y,W_profile_timeseries_deep(1:17,:).*scale_factor,1:1:4,'Color','#00B2EE','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C2,h2] = contour(X,Y,W_profile_timeseries_deep(1:17,:).*scale_factor,-4:1:-1,'Color','#EE2C2C','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C2,h2,'FontSize',12,'Color','k','Fontweight','bold')

name1=sprintf('MHW intensity (bathys > 50m,°C)\nVertical velocity (contour,10^-^5 m/s)');
set(get(c,'ylabel'),'string',char(name1),'Fontsize',20);
set(c,'Fontsize',20,'Ticks',0:0.5:3);
set(gca,'Fontsize',20);


yticks(-120:20:-20);
yticklabels({'120'; '100';'80';'60';'40';'20'});
xticks(5:5:25);
xticklabels({'Day 5'; 'Day 10';'Day 15';'Day 20';'Day 25'});
xtickangle(gca,0);


ylabel('Water depth (m)','Fontsize',20);
set(gca,'layer','top');
hold on;

set(gcf,'position',[0 0 100*6 100*6.3]);
set (gca,'position',[0.15,0.3,0.80,0.69] );
set(gca,'Fontname','Calibri','Linewidth',1.5);
hold off
set(gcf,'color','white','paperpositionmode','auto');




%% Figure 2c-d

% time period of Decline_Pick_time_1 2017-09-29 to 2017-10-29
load('Figure_2c_d.mat');
% shallow region
Z_Depth_T=-Z_middle_T(1:17);
daypart=0.5:1:29.5;
[X,Y]=meshgrid(daypart,Z_Depth_T);
figure;
MHW_intensity_profile_timeseries_shallow(MHW_intensity_profile_timeseries_shallow==0)=NaN;
contourf(X,Y,MHW_intensity_profile_timeseries_shallow(1:17,:),0:0.1:3,'edgecolor','none');

hold on
c=colorbar('h');
a = slanCM('magma',45);
colormap(a(16:end,:));

clim([0 3]);

scale_factor=1e5;

[C1,h1] = contour(X,Y,W_profile_timeseries_shallow(1:17,:).*scale_factor,[0 0],'k','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C1,h1] = contour(X,Y,W_profile_timeseries_shallow(1:17,:).*scale_factor,1:1:4,'Color','#00B2EE','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C2,h2] = contour(X,Y,W_profile_timeseries_shallow(1:17,:).*scale_factor,-4:1:-1,'Color','#EE2C2C','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C2,h2,'FontSize',12,'Color','k','Fontweight','bold')

name1=sprintf('MHW intensity (bathys ≤ 50m,°C)\nVertical velocity (contour,10^-^5 m/s)');
set(get(c,'ylabel'),'string',char(name1),'Fontsize',20);
set(c,'Fontsize',20,'Ticks',0:0.5:3);
set(gca,'Fontsize',20);

yticks(-120:20:-20);
yticklabels({'120'; '100';'80';'60';'40';'20'});
xticks(5:5:25);
xticklabels({'Day 5'; 'Day 10';'Day 15';'Day 20';'Day 25'});
xtickangle(gca,0);


ylabel('Water depth (m)','Fontsize',20);
set(gca,'layer','top');
hold on;

set(gcf,'position',[0 0 100*6 100*6.3]);
set (gca,'position',[0.15,0.3,0.80,0.69] );
set(gca,'Fontname','Calibri','Linewidth',1.5);
hold off
set(gcf,'color','white','paperpositionmode','auto');



% deep region
Z_Depth_T=-Z_middle_T(1:17);
daypart=0.5:1:29.5;
[X,Y]=meshgrid(daypart,Z_Depth_T);
figure;
MHW_intensity_profile_timeseries_deep(MHW_intensity_profile_timeseries_deep==0)=NaN;
contourf(X,Y,MHW_intensity_profile_timeseries_deep(1:17,:),0:0.1:3,'edgecolor','none');

hold on
c=colorbar('h');
a = slanCM('magma',45);
colormap(a(16:end,:));


scale_factor=1e5;

[C1,h1] = contour(X,Y,W_profile_timeseries_deep(1:17,:).*scale_factor,[0 0],'k','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C1,h1] = contour(X,Y,W_profile_timeseries_deep(1:17,:).*scale_factor,1:1:4,'Color','#00B2EE','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C2,h2] = contour(X,Y,W_profile_timeseries_deep(1:17,:).*scale_factor,-4:1:-1,'Color','#EE2C2C','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C2,h2,'FontSize',12,'Color','k','Fontweight','bold')

name1=sprintf('MHW intensity (bathys > 50m,°C)\nVertical velocity (contour,10^-^5 m/s)');
set(get(c,'ylabel'),'string',char(name1),'Fontsize',20);
set(c,'Fontsize',20,'Ticks',0:0.5:3);
set(gca,'Fontsize',20);


yticks(-120:20:-20);
yticklabels({'120'; '100';'80';'60';'40';'20'});
xticks(5:5:25);
xticklabels({'Day 5'; 'Day 10';'Day 15';'Day 20';'Day 25'});
xtickangle(gca,0);


ylabel('Water depth (m)','Fontsize',20);
set(gca,'layer','top');
hold on;

set(gcf,'position',[0 0 100*6 100*6.3]);
set (gca,'position',[0.15,0.3,0.80,0.69] );
set(gca,'Fontname','Calibri','Linewidth',1.5);
hold off
set(gcf,'color','white','paperpositionmode','auto');


%% Figure 2e-f

% time period of Onset_Pick_time_2 2018-04-30 to 2018-05-30
load('Figure_2e_f.mat');

% sallow region

Z_Depth_T=-Z_middle_T(1:17);
daypart=0.5:1:29.5;
[X,Y]=meshgrid(daypart,Z_Depth_T);
figure;
MHW_intensity_profile_timeseries_shallow(MHW_intensity_profile_timeseries_shallow==0)=NaN;
contourf(X,Y,MHW_intensity_profile_timeseries_shallow(1:17,:),0:0.1:3,'edgecolor','none');

hold on
c=colorbar('h');
a = slanCM('magma',45);
colormap(a(16:end,:));

clim([0 3]);

scale_factor=1e5;

[C1,h1] = contour(X,Y,W_profile_timeseries_shallow(1:17,:).*scale_factor,[0 0],'k','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C1,h1] = contour(X,Y,W_profile_timeseries_shallow(1:17,:).*scale_factor,1:1:4,'Color','#00B2EE','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C2,h2] = contour(X,Y,W_profile_timeseries_shallow(1:17,:).*scale_factor,-4:1:-1,'Color','#EE2C2C','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C2,h2,'FontSize',12,'Color','k','Fontweight','bold')

name1=sprintf('MHW intensity (bathys ≤ 50m,°C)\nVertical velocity (contour,10^-^5 m/s)');
set(get(c,'ylabel'),'string',char(name1),'Fontsize',20);
set(c,'Fontsize',20,'Ticks',0:0.5:3);
set(gca,'Fontsize',20);

yticks(-120:20:-20);
yticklabels({'120'; '100';'80';'60';'40';'20'});
xticks(5:5:25);
xticklabels({'Day 5'; 'Day 10';'Day 15';'Day 20';'Day 25'});
xtickangle(gca,0);


ylabel('Water depth (m)','Fontsize',20);
set(gca,'layer','top');
hold on;

set(gcf,'position',[0 0 100*6 100*6.3]);
set (gca,'position',[0.15,0.3,0.80,0.69] );
set(gca,'Fontname','Calibri','Linewidth',1.5);
hold off
set(gcf,'color','white','paperpositionmode','auto');

% deep region
Z_Depth_T=-Z_middle_T(1:17);
daypart=0.5:1:29.5;
[X,Y]=meshgrid(daypart,Z_Depth_T);
figure;
MHW_intensity_profile_timeseries_deep(MHW_intensity_profile_timeseries_deep==0)=NaN;
contourf(X,Y,MHW_intensity_profile_timeseries_deep(1:17,:),0:0.1:3,'edgecolor','none');

hold on
c=colorbar('h');
a = slanCM('magma',45);
colormap(a(16:end,:));

clim([0 3]);

scale_factor=1e5;

[C1,h1] = contour(X,Y,W_profile_timeseries_deep(1:17,:).*scale_factor,[0 0],'k','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C1,h1] = contour(X,Y,W_profile_timeseries_deep(1:17,:).*scale_factor,1:1:4,'Color','#00B2EE','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C2,h2] = contour(X,Y,W_profile_timeseries_deep(1:17,:).*scale_factor,-4:1:-1,'Color','#EE2C2C','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C2,h2,'FontSize',12,'Color','k','Fontweight','bold')

name1=sprintf('MHW intensity (bathys > 50m,°C)\nVertical velocity (contour,10^-^5 m/s)');
set(get(c,'ylabel'),'string',char(name1),'Fontsize',20);
set(c,'Fontsize',20,'Ticks',0:0.5:3);
set(gca,'Fontsize',20);

yticks(-120:20:-20);
yticklabels({'120'; '100';'80';'60';'40';'20'});
xticks(5:5:25);
xticklabels({'Day 5'; 'Day 10';'Day 15';'Day 20';'Day 25'});
xtickangle(gca,0);


ylabel('Water depth (m)','Fontsize',20);
set(gca,'layer','top');
hold on;

set(gcf,'position',[0 0 100*6 100*6.3]);
set (gca,'position',[0.15,0.3,0.80,0.69] );
set(gca,'Fontname','Calibri','Linewidth',1.5);
hold off
set(gcf,'color','white','paperpositionmode','auto');


%% Figure 2g-h

% time period of Decline_Pick_time_2 2018-05-30 to 2018-6-29
load('Figure_2g_h.mat');
  
% shallow region
Z_Depth_T=-Z_middle_T(1:17);
daypart=0.5:1:29.5;
[X,Y]=meshgrid(daypart,Z_Depth_T);
figure;
MHW_intensity_profile_timeseries_shallow(MHW_intensity_profile_timeseries_shallow==0)=NaN;
contourf(X,Y,MHW_intensity_profile_timeseries_shallow(1:17,:),0:0.1:3,'edgecolor','none');

hold on
c=colorbar('h');
a = slanCM('magma',45);
colormap(a(16:end,:));
 
clim([0 3]);
 
scale_factor=1e5;

[C1,h1] = contour(X,Y,W_profile_timeseries_shallow(1:17,:).*scale_factor,[0 0],'k','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C1,h1] = contour(X,Y,W_profile_timeseries_shallow(1:17,:).*scale_factor,1:1:4,'Color','#00B2EE','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C2,h2] = contour(X,Y,W_profile_timeseries_shallow(1:17,:).*scale_factor,-4:1:-1,'Color','#EE2C2C','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C2,h2,'FontSize',12,'Color','k','Fontweight','bold')
 
name1=sprintf('MHW intensity (bathys ≤ 50m,°C)\nVertical velocity (contour,10^-^5 m/s)');
set(get(c,'ylabel'),'string',char(name1),'Fontsize',20);
set(c,'Fontsize',20,'Ticks',0:0.5:3);
set(gca,'Fontsize',20);
 
yticks(-120:20:-20);
yticklabels({'120'; '100';'80';'60';'40';'20'});
xticks(5:5:25);
xticklabels({'Day 5'; 'Day 10';'Day 15';'Day 20';'Day 25'});
xtickangle(gca,0);


ylabel('Water depth (m)','Fontsize',20);
set(gca,'layer','top');
hold on;

set(gcf,'position',[0 0 100*6 100*6.3]);
set (gca,'position',[0.15,0.3,0.80,0.69] );
set(gca,'Fontname','Calibri','Linewidth',1.5);
hold off
set(gcf,'color','white','paperpositionmode','auto');
 
% deep region
Z_Depth_T=-Z_middle_T(1:17);
daypart=0.5:1:29.5;
[X,Y]=meshgrid(daypart,Z_Depth_T);
figure;
MHW_intensity_profile_timeseries_deep(MHW_intensity_profile_timeseries_deep==0)=NaN;
contourf(X,Y,MHW_intensity_profile_timeseries_deep(1:17,:),0:0.1:3,'edgecolor','none');

hold on
c=colorbar('h');
a = slanCM('magma',45);
colormap(a(16:end,:));
 
clim([0 3]);
 
scale_factor=1e5;

[C1,h1] = contour(X,Y,W_profile_timeseries_deep(1:17,:).*scale_factor,[0 0],'k','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C1,h1] = contour(X,Y,W_profile_timeseries_deep(1:17,:).*scale_factor,1:1:4,'Color','#00B2EE','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C2,h2] = contour(X,Y,W_profile_timeseries_deep(1:17,:).*scale_factor,-4:1:-1,'Color','#EE2C2C','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C2,h2,'FontSize',12,'Color','k','Fontweight','bold')
 
name1=sprintf('MHW intensity (bathys > 50m,°C)\nVertical velocity (contour,10^-^5 m/s)');
set(get(c,'ylabel'),'string',char(name1),'Fontsize',20);
set(c,'Fontsize',20,'Ticks',0:0.5:3);
set(gca,'Fontsize',20);


yticks(-120:20:-20);
yticklabels({'120'; '100';'80';'60';'40';'20'});
xticks(5:5:25);
xticklabels({'Day 5'; 'Day 10';'Day 15';'Day 20';'Day 25'});
xtickangle(gca,0);


ylabel('Water depth (m)','Fontsize',20);
set(gca,'layer','top');
hold on;

set(gcf,'position',[0 0 100*6 100*6.3]);
set (gca,'position',[0.15,0.3,0.80,0.69] );
set(gca,'Fontname','Calibri','Linewidth',1.5);
hold off
set(gcf,'color','white','paperpositionmode','auto');

%% Figure 2i-j
% time period of Onset_Pick_time_3 2021-03-03 to 2021-04-02
load('Figure_2i_j.mat');

% shallow region
Z_Depth_T=-Z_middle_T(1:17);
daypart=0.5:1:29.5;
[X,Y]=meshgrid(daypart,Z_Depth_T);
figure;
MHW_intensity_profile_timeseries_shallow(MHW_intensity_profile_timeseries_shallow==0)=NaN;
contourf(X,Y,MHW_intensity_profile_timeseries_shallow(1:17,:),0:0.1:3.5,'edgecolor','none');

hold on
c=colorbar('h');
a = slanCM('magma',50);
colormap(a(16:end,:));

clim([0 3.5]);

scale_factor=1e5;

[C1,h1] = contour(X,Y,W_profile_timeseries_shallow(1:17,:).*scale_factor,[0 0],'k','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C1,h1] = contour(X,Y,W_profile_timeseries_shallow(1:17,:).*scale_factor,1:1:4,'Color','#00B2EE','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C2,h2] = contour(X,Y,W_profile_timeseries_shallow(1:17,:).*scale_factor,-4:1:-1,'Color','#EE2C2C','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C2,h2,'FontSize',12,'Color','k','Fontweight','bold')

name1=sprintf('MHW intensity (bathys ≤ 50m,°C)\nVertical velocity (contour,10^-^5 m/s)');
set(get(c,'ylabel'),'string',char(name1),'Fontsize',20);
set(c,'Fontsize',20,'Ticks',0:0.5:3.5);
set(gca,'Fontsize',20);
yticks(-120:20:-20);
yticklabels({'120'; '100';'80';'60';'40';'20'});
xticks(5:5:25);
xticklabels({'Day 5'; 'Day 10';'Day 15';'Day 20';'Day 25'});
xtickangle(gca,0);


ylabel('Water depth (m)','Fontsize',20);
set(gca,'layer','top');
hold on;

set(gcf,'position',[0 0 100*6 100*6.3]);
set (gca,'position',[0.15,0.3,0.80,0.69] );
set(gca,'Fontname','Calibri','Linewidth',1.5);
hold off
set(gcf,'color','white','paperpositionmode','auto');

% deep region
Z_Depth_T=-Z_middle_T(1:17);
daypart=0.5:1:29.5;
[X,Y]=meshgrid(daypart,Z_Depth_T);
figure;
MHW_intensity_profile_timeseries_deep(MHW_intensity_profile_timeseries_deep==0)=NaN;
contourf(X,Y,MHW_intensity_profile_timeseries_deep(1:17,:),0:0.1:3.5,'edgecolor','none');

hold on
c=colorbar('h');
a = slanCM('magma',50);
colormap(a(16:end,:));

clim([0 3.5]);

scale_factor=1e5;

[C1,h1] = contour(X,Y,W_profile_timeseries_deep(1:17,:).*scale_factor,[0 0],'k','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C1,h1] = contour(X,Y,W_profile_timeseries_deep(1:17,:).*scale_factor,1:1:4,'Color','#00B2EE','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C2,h2] = contour(X,Y,W_profile_timeseries_deep(1:17,:).*scale_factor,-4:1:-1,'Color','#EE2C2C','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C2,h2,'FontSize',12,'Color','k','Fontweight','bold')

name1=sprintf('MHW intensity (bathys > 50m,°C)\nVertical velocity (contour,10^-^5 m/s)');
set(get(c,'ylabel'),'string',char(name1),'Fontsize',20);
set(c,'Fontsize',20,'Ticks',0:0.5:3.5);
set(gca,'Fontsize',20);

yticks(-120:20:-20);
yticklabels({'120'; '100';'80';'60';'40';'20'});
xticks(5:5:25);
xticklabels({'Day 5'; 'Day 10';'Day 15';'Day 20';'Day 25'});
xtickangle(gca,0);


ylabel('Water depth (m)','Fontsize',20);
set(gca,'layer','top');
hold on;

set(gcf,'position',[0 0 100*6 100*6.3]);
set (gca,'position',[0.15,0.3,0.80,0.69] );
set(gca,'Fontname','Calibri','Linewidth',1.5);
hold off
set(gcf,'color','white','paperpositionmode','auto');


%% Figure 2k-l
% time period of Decline_Pick_time_3 2021-04-02 to 2021-05-02

load('Figure_2k_l.mat');

% shallow region
Z_Depth_T=-Z_middle_T(1:17);
daypart=0.5:1:29.5;
[X,Y]=meshgrid(daypart,Z_Depth_T);
figure;
MHW_intensity_profile_timeseries_shallow(MHW_intensity_profile_timeseries_shallow==0)=NaN;
contourf(X,Y,MHW_intensity_profile_timeseries_shallow(1:17,:),0:0.1:3.5,'edgecolor','none');

hold on
c=colorbar('h');
a = slanCM('magma',50);
colormap(a(16:end,:));

clim([0 3.5]);

scale_factor=1e5;

[C1,h1] = contour(X,Y,W_profile_timeseries_shallow(1:17,:).*scale_factor,[0 0],'k','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C1,h1] = contour(X,Y,W_profile_timeseries_shallow(1:17,:).*scale_factor,1:1:4,'Color','#00B2EE','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C2,h2] = contour(X,Y,W_profile_timeseries_shallow(1:17,:).*scale_factor,-4:1:-1,'Color','#EE2C2C','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C2,h2,'FontSize',12,'Color','k','Fontweight','bold')

name1=sprintf('MHW intensity (bathys ≤ 50m,°C)\nVertical velocity (contour,10^-^5 m/s)');
set(get(c,'ylabel'),'string',char(name1),'Fontsize',20);
set(c,'Fontsize',20,'Ticks',0:0.5:3.5);
set(gca,'Fontsize',20);

yticks(-120:20:-20);
yticklabels({'120'; '100';'80';'60';'40';'20'});
xticks(5:5:25);
xticklabels({'Day 5'; 'Day 10';'Day 15';'Day 20';'Day 25'});
xtickangle(gca,0);


ylabel('Water depth (m)','Fontsize',20);
set(gca,'layer','top');
hold on;

set(gcf,'position',[0 0 100*6 100*6.3]);
set (gca,'position',[0.15,0.3,0.80,0.69] );
set(gca,'Fontname','Calibri','Linewidth',1.5);
hold off
set(gcf,'color','white','paperpositionmode','auto');


% deep region
Z_Depth_T=-Z_middle_T(1:17);
daypart=0.5:1:29.5;
[X,Y]=meshgrid(daypart,Z_Depth_T);
figure;
MHW_intensity_profile_timeseries_deep(MHW_intensity_profile_timeseries_deep==0)=NaN;
contourf(X,Y,MHW_intensity_profile_timeseries_deep(1:17,:),0:0.1:3.5,'edgecolor','none');

hold on
c=colorbar('h');
a = slanCM('magma',50);
colormap(a(16:end,:));

clim([0 3.5]);

scale_factor=1e5;

[C1,h1] = contour(X,Y,W_profile_timeseries_deep(1:17,:).*scale_factor,[0 0],'k','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C1,h1] = contour(X,Y,W_profile_timeseries_deep(1:17,:).*scale_factor,1:1:4,'Color','#00B2EE','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C1,h1,'FontSize',12,'Color','k','Fontweight','bold')
[C2,h2] = contour(X,Y,W_profile_timeseries_deep(1:17,:).*scale_factor,-4:1:-1,'Color','#EE2C2C','LineStyle','-','ShowText','on','LineWidth',1.2);
clabel(C2,h2,'FontSize',12,'Color','k','Fontweight','bold')

name1=sprintf('MHW intensity (bathys > 50m,°C)\nVertical velocity (contour,10^-^5 m/s)');
set(get(c,'ylabel'),'string',char(name1),'Fontsize',20);
set(c,'Fontsize',20,'Ticks',0:0.5:3.5);
set(gca,'Fontsize',20);

yticks(-120:20:-20);
yticklabels({'120'; '100';'80';'60';'40';'20'});
xticks(5:5:25);
xticklabels({'Day 5'; 'Day 10';'Day 15';'Day 20';'Day 25'});
xtickangle(gca,0);


ylabel('Water depth (m)','Fontsize',20);
set(gca,'layer','top');
hold on;

set(gcf,'position',[0 0 100*6 100*6.3]);
set (gca,'position',[0.15,0.3,0.80,0.69] );
set(gca,'Fontname','Calibri','Linewidth',1.5);
hold off
set(gcf,'color','white','paperpositionmode','auto');
