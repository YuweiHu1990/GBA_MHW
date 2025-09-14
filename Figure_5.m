%% Figure 5a
% time period of Onset_Pick_time_1 2017-08-30 to 2017-09-29
load('Figure_5a.mat');
[X, Y]=meshgrid(single(CMEMS_Wind_lon),single(CMEMS_Wind_lat));
[X2, Y2]=meshgrid(single(BRAN_T_lon_GBA),single(BRAN_T_lat_GBA));
CMEMS_Wind_Stress_Curl_interp=NaN(size(Depth_W_MEAN));
for dayorder=1:30
CMEMS_Wind_Stress_Curl_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_Curl_daily(:,:,dayorder+1))),X2,Y2,'linear')));
end
CMEMS_Wind_Stress_Curl_interp(isnan(Depth_W_MEAN))=NaN;
scale_factor_1 = 1;
scale_factor_2 = 1;


Input_X = CMEMS_Wind_Stress_Curl_interp(~isnan(Depth_W_MEAN));
Input_Y = Depth_W_MEAN(~isnan(Depth_W_MEAN));


X_bin_range = -5e-6:10e-8:5e-6;
Y_bin_range = -2e-4:4e-6:2e-4;

X_bin = 10e-8;
Y_bin = 4e-6;

Sctter_Type = 'Fitting';
Scatter_size = 10;
Colormap_Choice = flipud(slanCM(100));
X_label = 'Wind stress curl (N/m^3)';
Y_label = 'Vertical velocity (m/s)';

X_lim = [-5e-6 5e-6];
Y_lim = [-2e-4 2e-4];

X_tick = -5e-6:2e-6:5e-6;
Y_tick = -2e-4:10e-5:2e-4;


Figure_Name = 'GBA_MHW_Wind_Stress_Curl_VS_Vertical_velocity_Density_Scatter_T1';
Font_size = 20;

Scatter_X=Input_X(~isnan(Input_X)).*scale_factor_1;
Scatter_Y=Input_Y(~isnan(Input_X)).*scale_factor_2;

k=1;
for i=X_bin_range % Scatter X
    X_bin_value=find(Scatter_X>=i & Scatter_X<i+X_bin);
   
    for j=Y_bin_range  % Scatter Y
        Y_bin_value=find(Scatter_Y>=j & Scatter_Y<j+Y_bin);
        X_value_VS_Y_value=intersect(X_bin_value,Y_bin_value);
        cd=length(X_value_VS_Y_value);
        
        if ~isempty(cd)
            sactter_value=[i,j,cd];
            scatter_valuesum(k,:)=sactter_value;
        end
        k=k+1;
    end
end
if (strcmp(Sctter_Type,'Fitting')) % plot fitting line
    
mdl = fitlm(Scatter_X,Scatter_Y,'linear');

end
figure;
set(gcf,'position',[0 0 100*5 100*6]);
axes('position', [0.18 0.12 0.76 0.78]);
scatter_valuesum_1=scatter_valuesum(scatter_valuesum(:,3)>0,:);
scatter(scatter_valuesum_1(:,1),scatter_valuesum_1(:,2),Scatter_size,(scatter_valuesum_1(:,3)),'o',"filled");
Colorbar_range_min=0;
Colorbar_range_max=round(max((scatter_valuesum_1(:,3))),0);
clim([Colorbar_range_min Colorbar_range_max]);
colormap(Colormap_Choice);
c=colorbar('h'); 
c.Label.String = 'Density'; 
set(c,'Fontsize',Font_size,'Ticks',Colorbar_range_min:round(Colorbar_range_max/40)*10:Colorbar_range_max);
set(gca,'Ylim',Y_lim,'Xlim',X_lim,'YTick',Y_tick,'XTick',X_tick,'FontSize',Font_size);
ylabel(Y_label,'FontSize',Font_size);
xlabel(X_label,'FontSize',Font_size);
hold on;

if (strcmp(Sctter_Type,'Fitting')) % plot fitting line
    
[Fitline,Fitconfi]= predict(mdl,X_tick');
plot(X_tick,Fitline,'Linestyle','-','Color','#CD5C5C','LineWidth',1.5);
plot(X_tick,Fitconfi(:,1),'Linestyle',':','Color','#CD5C5C','LineWidth',1);
plot(X_tick,Fitconfi(:,2),'Linestyle',':','Color','#CD5C5C','LineWidth',1);
h1=refline(1,0); 


set(h1,'color','black','linewidth',1.5);

Fit_data=sprintf('R = %.2f (p<0.01)',sqrt(mdl.Rsquared.Ordinary));
disp(mdl.Coefficients.pValue(2));
title(Fit_data,'Fontsize',20,'Fontname','Calibri',"HorizontalAlignment","center","FontWeight","normal");
end

box on
grid on
ax=gca;
ax.GridLineStyle = '-';
ax.GridAlpha=0.2;
grid minor
ax.MinorGridLineStyle='-.';
ax.MinorGridAlpha=0.15;

set(gca,'Fontname','Calibri','Linewidth',1.5);
clear scatter_valuesum; 

%% Figure 5b
% time period of Onset_Pick_time_2 2018-04-30 to 2018-05-30
load('Figure_5b.mat');
[X, Y]=meshgrid(single(CMEMS_Wind_lon),single(CMEMS_Wind_lat));
[X2, Y2]=meshgrid(single(BRAN_T_lon_GBA),single(BRAN_T_lat_GBA));
CMEMS_Wind_Stress_Curl_interp=NaN(size(Depth_W_MEAN));
for dayorder=1:30
CMEMS_Wind_Stress_Curl_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_Curl_daily(:,:,dayorder+1))),X2,Y2,'linear')));
end
CMEMS_Wind_Stress_Curl_interp(isnan(Depth_W_MEAN))=NaN;
scale_factor_1 = 1;
scale_factor_2 = 1;


Input_X = CMEMS_Wind_Stress_Curl_interp(~isnan(Depth_W_MEAN));
Input_Y = Depth_W_MEAN(~isnan(Depth_W_MEAN));


X_bin_range = -5e-6:10e-8:5e-6;
Y_bin_range = -2e-4:4e-6:2e-4;

X_bin = 10e-8;
Y_bin = 4e-6;

Sctter_Type = 'Fitting';
Scatter_size = 10;
Colormap_Choice = flipud(slanCM(100));
X_label = 'Wind stress curl (N/m^3)';
Y_label = 'Vertical velocity (m/s)';

X_lim = [-5e-6 5e-6];
Y_lim = [-2e-4 2e-4];

X_tick = -5e-6:2e-6:5e-6;
Y_tick = -2e-4:10e-5:2e-4;

Save_dir=[];
Figure_Name = 'GBA_MHW_Wind_Stress_Curl_VS_Vertical_velocity_Density_Scatter_T2';
Font_size = 20;



Scatter_X=Input_X(~isnan(Input_X)).*scale_factor_1;
Scatter_Y=Input_Y(~isnan(Input_X)).*scale_factor_2;

k=1;
for i=X_bin_range % Scatter X
    X_bin_value=find(Scatter_X>=i & Scatter_X<i+X_bin);
   
    for j=Y_bin_range  % Scatter Y
        Y_bin_value=find(Scatter_Y>=j & Scatter_Y<j+Y_bin);
        X_value_VS_Y_value=intersect(X_bin_value,Y_bin_value);
        cd=length(X_value_VS_Y_value);
        
        if ~isempty(cd)
            sactter_value=[i,j,cd];
            scatter_valuesum(k,:)=sactter_value;
        end
        k=k+1;
    end
end
if (strcmp(Sctter_Type,'Fitting')) % plot fitting line
    
mdl = fitlm(Scatter_X,Scatter_Y,'linear');


end
figure;
set(gcf,'position',[0 0 100*5 100*6]);
axes('position', [0.18 0.12 0.76 0.78]);
scatter_valuesum_1=scatter_valuesum(scatter_valuesum(:,3)>0,:);
scatter(scatter_valuesum_1(:,1),scatter_valuesum_1(:,2),Scatter_size,(scatter_valuesum_1(:,3)),'o',"filled");
Colorbar_range_min=0;
Colorbar_range_max=round(max((scatter_valuesum_1(:,3))),0);
clim([Colorbar_range_min Colorbar_range_max]);
colormap(Colormap_Choice);
c=colorbar('h'); 
c.Label.String = 'Density'; 
set(c,'Fontsize',Font_size,'Ticks',Colorbar_range_min:round(Colorbar_range_max/40)*10:Colorbar_range_max);
set(gca,'Ylim',Y_lim,'Xlim',X_lim,'YTick',Y_tick,'XTick',X_tick,'FontSize',Font_size);
ylabel(Y_label,'FontSize',Font_size);
xlabel(X_label,'FontSize',Font_size);
hold on;

if (strcmp(Sctter_Type,'Fitting')) % plot fitting line
    
[Fitline,Fitconfi]= predict(mdl,X_tick');
plot(X_tick,Fitline,'Linestyle','-','Color','#CD5C5C','LineWidth',1.5);
plot(X_tick,Fitconfi(:,1),'Linestyle',':','Color','#CD5C5C','LineWidth',1);
plot(X_tick,Fitconfi(:,2),'Linestyle',':','Color','#CD5C5C','LineWidth',1);

Fit_data=sprintf('R = %.2f (p<0.01)',sqrt(mdl.Rsquared.Ordinary));
disp(mdl.Coefficients.pValue(2));
title(Fit_data,'Fontsize',20,'Fontname','Calibri',"HorizontalAlignment","center","FontWeight","normal");
end

box on
grid on
ax=gca;
ax.GridLineStyle = '-';
ax.GridAlpha=0.2;
grid minor
ax.MinorGridLineStyle='-.';
ax.MinorGridAlpha=0.15;

set(gca,'Fontname','Calibri','Linewidth',1.5);
clear scatter_valuesum; 
%% Figure 5c
% time period of Onset_Pick_time_3 2021-03-03 to 2021-04-02
load('Figure_5c.mat');
[X, Y]=meshgrid(single(CMEMS_Wind_lon),single(CMEMS_Wind_lat));
[X2, Y2]=meshgrid(single(BRAN_T_lon_GBA),single(BRAN_T_lat_GBA));
CMEMS_Wind_Stress_Curl_interp=NaN(size(Depth_W_MEAN));
for dayorder=1:30
CMEMS_Wind_Stress_Curl_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_Curl_daily(:,:,dayorder+1))),X2,Y2,'linear')));
end
CMEMS_Wind_Stress_Curl_interp(isnan(Depth_W_MEAN))=NaN;
scale_factor_1 = 1;
scale_factor_2 = 1;


Input_X = CMEMS_Wind_Stress_Curl_interp(~isnan(Depth_W_MEAN));
Input_Y = Depth_W_MEAN(~isnan(Depth_W_MEAN));


X_bin_range = -5e-6:10e-8:5e-6;
Y_bin_range = -2e-4:4e-6:2e-4;

X_bin = 10e-8;
Y_bin = 4e-6;

Sctter_Type = 'Fitting';
Scatter_size = 10;
Colormap_Choice = flipud(slanCM(100));
X_label = 'Wind stress curl (N/m^3)';
Y_label = 'Vertical velocity (m/s)';

X_lim = [-5e-6 5e-6];
Y_lim = [-2e-4 2e-4];

X_tick = -5e-6:2e-6:5e-6;
Y_tick = -2e-4:10e-5:2e-4;


Figure_Name = 'GBA_MHW_Wind_Stress_Curl_VS_Vertical_velocity_Density_Scatter_T3';
Font_size = 20;


Scatter_X=Input_X(~isnan(Input_X)).*scale_factor_1;
Scatter_Y=Input_Y(~isnan(Input_X)).*scale_factor_2;

k=1;
for i=X_bin_range % Scatter X
    X_bin_value=find(Scatter_X>=i & Scatter_X<i+X_bin);
   
    for j=Y_bin_range  % Scatter Y
        Y_bin_value=find(Scatter_Y>=j & Scatter_Y<j+Y_bin);
        X_value_VS_Y_value=intersect(X_bin_value,Y_bin_value);
        cd=length(X_value_VS_Y_value);
        
        if ~isempty(cd)
            sactter_value=[i,j,cd];
            scatter_valuesum(k,:)=sactter_value;
        end
        k=k+1;
    end
end
if (strcmp(Sctter_Type,'Fitting')) % plot fitting line
    
mdl = fitlm(Scatter_X,Scatter_Y,'linear');

 
end
figure;
set(gcf,'position',[0 0 100*5 100*6]);
axes('position', [0.18 0.12 0.76 0.78]);
scatter_valuesum_1=scatter_valuesum(scatter_valuesum(:,3)>0,:);
scatter(scatter_valuesum_1(:,1),scatter_valuesum_1(:,2),Scatter_size,(scatter_valuesum_1(:,3)),'o',"filled");
Colorbar_range_min=0;
Colorbar_range_max=round(max((scatter_valuesum_1(:,3))),0);
clim([Colorbar_range_min Colorbar_range_max]);
colormap(Colormap_Choice);
c=colorbar('h'); 
c.Label.String = 'Density'; 
set(c,'Fontsize',Font_size,'Ticks',Colorbar_range_min:round(Colorbar_range_max/40)*10:Colorbar_range_max);
set(gca,'Ylim',Y_lim,'Xlim',X_lim,'YTick',Y_tick,'XTick',X_tick,'FontSize',Font_size);
ylabel(Y_label,'FontSize',Font_size);
xlabel(X_label,'FontSize',Font_size);
hold on;

if (strcmp(Sctter_Type,'Fitting')) % plot fitting line
    
[Fitline,Fitconfi]= predict(mdl,X_tick');
plot(X_tick,Fitline,'Linestyle','-','Color','#CD5C5C','LineWidth',1.5);
plot(X_tick,Fitconfi(:,1),'Linestyle',':','Color','#CD5C5C','LineWidth',1);
plot(X_tick,Fitconfi(:,2),'Linestyle',':','Color','#CD5C5C','LineWidth',1);

Fit_data=sprintf('R = %.2f (p<0.01)',sqrt(mdl.Rsquared.Ordinary));
disp(mdl.Coefficients.pValue(2));
title(Fit_data,'Fontsize',20,'Fontname','Calibri',"HorizontalAlignment","center","FontWeight","normal");
end

box on
grid on
ax=gca;
ax.GridLineStyle = '-';
ax.GridAlpha=0.2;
grid minor
ax.MinorGridLineStyle='-.';
ax.MinorGridAlpha=0.15;

set(gca,'Fontname','Calibri','Linewidth',1.5);
clear scatter_valuesum; 

%% Figure 5d
% time period of Onset_Pick_time_1 2017-08-30 to 2017-09-29
load('Figure_5d.mat');

[X, Y]=meshgrid(single(CMEMS_Wind_lon),single(CMEMS_Wind_lat));
[X2, Y2]=meshgrid(single(BRAN_T_lon_GBA),single(BRAN_T_lat_GBA));
CMEMS_Wind_stress_N_daily_interp=NaN(size(Depth_W_MEAN));
CMEMS_Wind_stress_E_daily_interp=NaN(size(Depth_W_MEAN));
CMEMS_Wind_stress_daily=sqrt(CMEMS_Wind_stress_E_daily.^2+CMEMS_Wind_stress_N_daily.^2);
CMEMS_Wind_stress_daily_interp=NaN(size(Depth_W_MEAN));
for dayorder=1:30
    CMEMS_Wind_stress_daily_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_daily(:,:,dayorder+1))),X2,Y2,'linear')));
    CMEMS_Wind_stress_N_daily_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_N_daily(:,:,dayorder+1))),X2,Y2,'linear')));
    CMEMS_Wind_stress_E_daily_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_E_daily(:,:,dayorder+1))),X2,Y2,'linear')));
end
CMEMS_Wind_stress_daily_interp(isnan(Depth_W_MEAN))=NaN;
CMEMS_Wind_stress_N_daily_interp(isnan(Depth_W_MEAN))=NaN;
CMEMS_Wind_stress_E_daily_interp(isnan(Depth_W_MEAN))=NaN;




wind_dir=atan2(-CMEMS_Wind_stress_N_daily_interp,CMEMS_Wind_stress_E_daily_interp);
wind_dir_valid=wind_dir;
Valid_index=find(wind_dir<0);
wind_dir_valid(Valid_index)=2*pi+wind_dir(Valid_index);
wind_dir_valid=wind_dir_valid+pi/2;
Winddir_input=wind_dir_valid(~isnan(Depth_W_MEAN));
Input_X=CMEMS_Wind_stress_daily_interp(~isnan(Depth_W_MEAN));
Input_Y=Depth_W_MEAN(~isnan(Depth_W_MEAN));

X_bin_range = 0.5*pi:pi/9:2.5*pi;

X_bin = pi/9;

scale_factor_1 = 1;
scale_factor_2 = 1;


Figure_Name = 'GBA_MHW_Wind_Stress_direction_VS_Vertical_Velocity_Density_Scatter_T1';
Font_size = 20;

Fit_data=sprintf('Histogram of wind stress direction');

Winddir_input_valid=Winddir_input(~isnan(Input_X));
Scatter_X=Input_X(~isnan(Input_X)).*scale_factor_1;
Scatter_Y=Input_Y(~isnan(Input_X)).*scale_factor_2;

clear scatter_valuesum scatter_valuesum_1;
k=1;
for i=X_bin_range % Scatter X
    if i==2.5*pi
        continue;
    else
    X_bin_value=find(Winddir_input_valid>=i & Winddir_input_valid<i+X_bin);
    cd=length(X_bin_value);
    
        mdl = fitlm(Scatter_X(X_bin_value),Scatter_Y(X_bin_value),'linear');
        P_mdl=mdl.Coefficients.pValue(2);
        R_mdl=sqrt(mdl.Rsquared.Ordinary);
        if P_mdl<0.05 && cd>50
            sactter_value=[(i+i+X_bin)/2,R_mdl];
            scatter_valuesum(k,:)=sactter_value;
        
        else
            sactter_value=[(i+i+X_bin)/2,NaN];
            scatter_valuesum(k,:)=sactter_value;
        
        end
        k=k+1;
    end
end
scatter_valuesum_1=scatter_valuesum;

figure;
set(gcf,'position',[0 0 100*5 100*6]);
set (gca,'position',[0.05,0.1,0.9,0.75] );
ph = polarhistogram(Winddir_input_valid,0.5*pi:pi/9:2.4*pi,"FaceAlpha",0.5,'EdgeColor',[1 1 1].*0.5,'FaceColor',[1 1 1].*0.7,'Linewidth',1.5);
pax = gca;
pax.ThetaDir = 'clockwise';
pax.ThetaZeroLocation = "top";
pax.FontSize = Font_size;
pax.RColor = [1 1 1].*0.3;
thetaticks(0:45:315)
rticks(500:500:1000)

scatter_x=ph.BinEdges(1:18)+ph.BinWidth/2;
scatter_y=repmat(max(ph.Values),size(scatter_x))/2;
%scatter_y=ph.Values;
hold on;
ps=polarscatter(scatter_x,scatter_y,scatter_valuesum_1(:,2)'*300,scatter_valuesum_1(:,2)','o',"filled");
clim([0 1]);
colormap(flipud(slanCM(100,10)));
c=colorbar('h'); 
c.Label.String = sprintf('R (Wind stress - Vertical velocity)'); 
set(c,'Fontsize',Font_size,'Ticks',0:0.2:1);

pax.GridLineStyle = '--';
pax.GridAlpha=0.2;
set(gca,'Fontname','Calibri','Linewidth',1.5);
title(Fit_data,'Fontsize',20,'Fontname','Calibri',"HorizontalAlignment","center","FontWeight","normal");
clear scatter_valuesum scatter_valuesum_1; 


%% Figure 5e
% time period of Onset_Pick_time_2 2018-04-30 to 2018-05-30
load('Figure_5e.mat');
[X, Y]=meshgrid(single(CMEMS_Wind_lon),single(CMEMS_Wind_lat));
[X2, Y2]=meshgrid(single(BRAN_T_lon_GBA),single(BRAN_T_lat_GBA));
CMEMS_Wind_stress_N_daily_interp=NaN(size(Depth_W_MEAN));
CMEMS_Wind_stress_E_daily_interp=NaN(size(Depth_W_MEAN));
CMEMS_Wind_stress_daily=sqrt(CMEMS_Wind_stress_E_daily.^2+CMEMS_Wind_stress_N_daily.^2);
CMEMS_Wind_stress_daily_interp=NaN(size(Depth_W_MEAN));
for dayorder=1:30
    CMEMS_Wind_stress_daily_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_daily(:,:,dayorder+1))),X2,Y2,'linear')));
    CMEMS_Wind_stress_N_daily_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_N_daily(:,:,dayorder+1))),X2,Y2,'linear')));
    CMEMS_Wind_stress_E_daily_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_E_daily(:,:,dayorder+1))),X2,Y2,'linear')));
end
CMEMS_Wind_stress_daily_interp(isnan(Depth_W_MEAN))=NaN;
CMEMS_Wind_stress_N_daily_interp(isnan(Depth_W_MEAN))=NaN;
CMEMS_Wind_stress_E_daily_interp(isnan(Depth_W_MEAN))=NaN;


wind_dir=atan2(-CMEMS_Wind_stress_N_daily_interp,CMEMS_Wind_stress_E_daily_interp);
wind_dir_valid=wind_dir;
Valid_index=find(wind_dir<0);
wind_dir_valid(Valid_index)=2*pi+wind_dir(Valid_index);
wind_dir_valid=wind_dir_valid+pi/2;
Winddir_input=wind_dir_valid(~isnan(Depth_W_MEAN));
Input_X=CMEMS_Wind_stress_daily_interp(~isnan(Depth_W_MEAN));
Input_Y=Depth_W_MEAN(~isnan(Depth_W_MEAN));

X_bin_range = 0.5*pi:pi/9:2.5*pi;

X_bin = pi/9;

scale_factor_1 = 1;
scale_factor_2 = 1;


Figure_Name = 'GBA_MHW_Wind_Stress_direction_VS_Vertical_Velocity_Density_Scatter_T2';
Font_size = 20;

Fit_data=sprintf('Histogram of wind stress direction');

Winddir_input_valid=Winddir_input(~isnan(Input_X));
Scatter_X=Input_X(~isnan(Input_X)).*scale_factor_1;
Scatter_Y=Input_Y(~isnan(Input_X)).*scale_factor_2;

clear scatter_valuesum scatter_valuesum_1;
k=1;
for i=X_bin_range % Scatter X
    if i==2.5*pi
        continue;
    else
    X_bin_value=find(Winddir_input_valid>=i & Winddir_input_valid<i+X_bin);
    cd=length(X_bin_value);
    
        mdl = fitlm(Scatter_X(X_bin_value),Scatter_Y(X_bin_value),'linear');
        P_mdl=mdl.Coefficients.pValue(2);
        R_mdl=sqrt(mdl.Rsquared.Ordinary);
        if P_mdl<0.05 && cd>50
            sactter_value=[(i+i+X_bin)/2,R_mdl];
            scatter_valuesum(k,:)=sactter_value;
        
        else
            sactter_value=[(i+i+X_bin)/2,NaN];
            scatter_valuesum(k,:)=sactter_value;
        
        end
        k=k+1;
    end
end
scatter_valuesum_1=scatter_valuesum;

figure;
set(gcf,'position',[0 0 100*5 100*6]);
set (gca,'position',[0.05,0.1,0.9,0.75] );
ph = polarhistogram(Winddir_input_valid,0.5*pi:pi/9:2.4*pi,"FaceAlpha",0.5,'EdgeColor',[1 1 1].*0.5,'FaceColor',[1 1 1].*0.7,'Linewidth',1.5);
pax = gca;
pax.ThetaDir = 'clockwise';
pax.ThetaZeroLocation = "top";
pax.FontSize = Font_size;
pax.RColor = [1 1 1].*0.3;
thetaticks(0:45:315)
rticks(500:500:1000)

scatter_x=ph.BinEdges(1:18)+ph.BinWidth/2;
scatter_y=repmat(max(ph.Values),size(scatter_x))/2;
hold on;
ps=polarscatter(scatter_x,scatter_y,scatter_valuesum_1(:,2)'*300,scatter_valuesum_1(:,2)','o',"filled");
clim([0 1]);
colormap(flipud(slanCM(100,10)));
c=colorbar('h'); 
c.Label.String = sprintf('R (Wind stress - Vertical velocity)'); 
set(c,'Fontsize',Font_size,'Ticks',0:0.2:1);

pax.GridLineStyle = '--';
pax.GridAlpha=0.2;
set(gca,'Fontname','Calibri','Linewidth',1.5);
title(Fit_data,'Fontsize',20,'Fontname','Calibri',"HorizontalAlignment","center","FontWeight","normal");
clear scatter_valuesum scatter_valuesum_1;

%% Figure 5f
%  time period of Onset_Pick_time_3 2021-03-03 to 2021-04-02
load('Figure_5f.mat');
[X, Y]=meshgrid(single(CMEMS_Wind_lon),single(CMEMS_Wind_lat));
[X2, Y2]=meshgrid(single(BRAN_T_lon_GBA),single(BRAN_T_lat_GBA));
CMEMS_Wind_stress_N_daily_interp=NaN(size(Depth_W_MEAN));
CMEMS_Wind_stress_E_daily_interp=NaN(size(Depth_W_MEAN));
CMEMS_Wind_stress_daily=sqrt(CMEMS_Wind_stress_E_daily.^2+CMEMS_Wind_stress_N_daily.^2);
CMEMS_Wind_stress_daily_interp=NaN(size(Depth_W_MEAN));
for dayorder=1:30
    CMEMS_Wind_stress_daily_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_daily(:,:,dayorder+1))),X2,Y2,'linear')));
    CMEMS_Wind_stress_N_daily_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_N_daily(:,:,dayorder+1))),X2,Y2,'linear')));
    CMEMS_Wind_stress_E_daily_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_E_daily(:,:,dayorder+1))),X2,Y2,'linear')));
end
CMEMS_Wind_stress_daily_interp(isnan(Depth_W_MEAN))=NaN;
CMEMS_Wind_stress_N_daily_interp(isnan(Depth_W_MEAN))=NaN;
CMEMS_Wind_stress_E_daily_interp(isnan(Depth_W_MEAN))=NaN;

wind_dir=atan2(-CMEMS_Wind_stress_N_daily_interp,CMEMS_Wind_stress_E_daily_interp);
wind_dir_valid=wind_dir;
Valid_index=find(wind_dir<0);
wind_dir_valid(Valid_index)=2*pi+wind_dir(Valid_index);
wind_dir_valid=wind_dir_valid+pi/2;
Winddir_input=wind_dir_valid(~isnan(Depth_W_MEAN));
Input_X=CMEMS_Wind_stress_daily_interp(~isnan(Depth_W_MEAN));
Input_Y=Depth_W_MEAN(~isnan(Depth_W_MEAN));

X_bin_range = 0.5*pi:pi/9:2.5*pi;

X_bin = pi/9;

scale_factor_1 = 1;
scale_factor_2 = 1;


Figure_Name = 'GBA_MHW_Wind_Stress_direction_VS_Vertical_Velocity_Density_Scatter_T3';
Font_size = 20;

Fit_data=sprintf('Histogram of wind stress direction');

Winddir_input_valid=Winddir_input(~isnan(Input_X));
Scatter_X=Input_X(~isnan(Input_X)).*scale_factor_1;
Scatter_Y=Input_Y(~isnan(Input_X)).*scale_factor_2;

clear scatter_valuesum scatter_valuesum_1;
k=1;
for i=X_bin_range % Scatter X
    if i==2.5*pi
        continue;
    else
    X_bin_value=find(Winddir_input_valid>=i & Winddir_input_valid<i+X_bin);
    cd=length(X_bin_value);
    
        mdl = fitlm(Scatter_X(X_bin_value),Scatter_Y(X_bin_value),'linear');
        P_mdl=mdl.Coefficients.pValue(2);
        R_mdl=sqrt(mdl.Rsquared.Ordinary);
        if P_mdl<0.05 && cd>50
            sactter_value=[(i+i+X_bin)/2,R_mdl];
            scatter_valuesum(k,:)=sactter_value;
        
        else
            sactter_value=[(i+i+X_bin)/2,NaN];
            scatter_valuesum(k,:)=sactter_value;
        
        end
        k=k+1;
    end
end
scatter_valuesum_1=scatter_valuesum;

figure;
set(gcf,'position',[0 0 100*5 100*6]);
set (gca,'position',[0.05,0.1,0.9,0.75] );
ph = polarhistogram(Winddir_input_valid,0.5*pi:pi/9:2.4*pi,"FaceAlpha",0.5,'EdgeColor',[1 1 1].*0.5,'FaceColor',[1 1 1].*0.7,'Linewidth',1.5);
pax = gca;
pax.ThetaDir = 'clockwise';
pax.ThetaZeroLocation = "top";
pax.FontSize = Font_size;
pax.RColor = [1 1 1].*0.3;
thetaticks(0:45:315)
rticks(1000:1000:2000)

scatter_x=ph.BinEdges(1:18)+ph.BinWidth/2;
scatter_y=repmat(max(ph.Values),size(scatter_x))/2;
hold on;
ps=polarscatter(scatter_x,scatter_y,scatter_valuesum_1(:,2)'*300,scatter_valuesum_1(:,2)','o',"filled");
clim([0 1]);
colormap(flipud(slanCM(100,10)));
c=colorbar('h'); 
c.Label.String = sprintf('R (Wind stress - Vertical velocity)'); 
set(c,'Fontsize',Font_size,'Ticks',0:0.2:1);

pax.GridLineStyle = '--';
pax.GridAlpha=0.2;
set(gca,'Fontname','Calibri','Linewidth',1.5);
title(Fit_data,'Fontsize',20,'Fontname','Calibri',"HorizontalAlignment","center","FontWeight","normal");
clear scatter_valuesum scatter_valuesum_1;


%% Figure 5g
% time period of Decline_Pick_time_1 2017-09-29 to 2017-10-29
load('Figure_5g.mat');
[X, Y]=meshgrid(single(CMEMS_Wind_lon),single(CMEMS_Wind_lat));
[X2, Y2]=meshgrid(single(BRAN_T_lon_GBA),single(BRAN_T_lat_GBA));
CMEMS_Wind_Stress_Curl_interp=NaN(size(Depth_W_MEAN));
for dayorder=1:30
CMEMS_Wind_Stress_Curl_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_Curl_daily(:,:,dayorder+1))),X2,Y2,'linear')));
end
CMEMS_Wind_Stress_Curl_interp(isnan(Depth_W_MEAN))=NaN;
scale_factor_1 = 1;
scale_factor_2 = 1;


Input_X = CMEMS_Wind_Stress_Curl_interp(~isnan(Depth_W_MEAN));
Input_Y = Depth_W_MEAN(~isnan(Depth_W_MEAN));


X_bin_range = -5e-6:10e-8:5e-6;
Y_bin_range = -2e-4:4e-6:2e-4;

X_bin = 10e-8;
Y_bin = 4e-6;

Sctter_Type = 'Fitting';
Scatter_size = 10;
Colormap_Choice = flipud(slanCM(100));
X_label = 'Wind stress curl (N/m^3)';
Y_label = 'Vertical velocity (m/s)';

X_lim = [-5e-6 5e-6];
Y_lim = [-2e-4 2e-4];

X_tick = -5e-6:2e-6:5e-6;
Y_tick = -2e-4:10e-5:2e-4;


Figure_Name = 'GBA_MHW_Wind_Stress_Curl_VS_Vertical_velocity_Density_Scatter_Decline_T1';
Font_size = 20;


Scatter_X=Input_X(~isnan(Input_X)).*scale_factor_1;
Scatter_Y=Input_Y(~isnan(Input_X)).*scale_factor_2;

k=1;
for i=X_bin_range % Scatter X
    X_bin_value=find(Scatter_X>=i & Scatter_X<i+X_bin);
   
    for j=Y_bin_range  % Scatter Y
        Y_bin_value=find(Scatter_Y>=j & Scatter_Y<j+Y_bin);
        X_value_VS_Y_value=intersect(X_bin_value,Y_bin_value);
        cd=length(X_value_VS_Y_value);
        
        if ~isempty(cd)
            sactter_value=[i,j,cd];
            scatter_valuesum(k,:)=sactter_value;
        end
        k=k+1;
    end
end
if (strcmp(Sctter_Type,'Fitting')) % plot fitting line
    
mdl = fitlm(Scatter_X,Scatter_Y,'linear');

  
end
figure;
set(gcf,'position',[0 0 100*5 100*6]);
axes('position', [0.18 0.12 0.76 0.78]);
scatter_valuesum_1=scatter_valuesum(scatter_valuesum(:,3)>0,:);
scatter(scatter_valuesum_1(:,1),scatter_valuesum_1(:,2),Scatter_size,(scatter_valuesum_1(:,3)),'o',"filled");
Colorbar_range_min=0;
Colorbar_range_max=round(max((scatter_valuesum_1(:,3))),0);
clim([Colorbar_range_min Colorbar_range_max]);
colormap(Colormap_Choice);
c=colorbar('h'); 
c.Label.String = 'Density'; 
set(c,'Fontsize',Font_size,'Ticks',Colorbar_range_min:round(Colorbar_range_max/40)*10:Colorbar_range_max);
set(gca,'Ylim',Y_lim,'Xlim',X_lim,'YTick',Y_tick,'XTick',X_tick,'FontSize',Font_size);
ylabel(Y_label,'FontSize',Font_size);
xlabel(X_label,'FontSize',Font_size);
hold on;

if (strcmp(Sctter_Type,'Fitting')) % plot fitting line
    
[Fitline,Fitconfi]= predict(mdl,X_tick');
plot(X_tick,Fitline,'Linestyle','-','Color','#CD5C5C','LineWidth',1.5);
plot(X_tick,Fitconfi(:,1),'Linestyle',':','Color','#CD5C5C','LineWidth',1);
plot(X_tick,Fitconfi(:,2),'Linestyle',':','Color','#CD5C5C','LineWidth',1);

Fit_data=sprintf('R = %.2f (p<0.01)',sqrt(mdl.Rsquared.Ordinary));
disp(mdl.Coefficients.pValue(2));
title(Fit_data,'Fontsize',20,'Fontname','Calibri',"HorizontalAlignment","center","FontWeight","normal");
end

box on
grid on
ax=gca;
ax.GridLineStyle = '-';
ax.GridAlpha=0.2;
grid minor
ax.MinorGridLineStyle='-.';
ax.MinorGridAlpha=0.15;

set(gca,'Fontname','Calibri','Linewidth',1.5);
clear scatter_valuesum; 

%% Figure 5h
% time period of Decline_Pick_time_2 2018-05-30 to 2018-6-29
load('Figure_5h.mat');
[X, Y]=meshgrid(single(CMEMS_Wind_lon),single(CMEMS_Wind_lat));
[X2, Y2]=meshgrid(single(BRAN_T_lon_GBA),single(BRAN_T_lat_GBA));
CMEMS_Wind_Stress_Curl_interp=NaN(size(Depth_W_MEAN));
for dayorder=1:30
CMEMS_Wind_Stress_Curl_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_Curl_daily(:,:,dayorder+1))),X2,Y2,'linear')));
end
CMEMS_Wind_Stress_Curl_interp(isnan(Depth_W_MEAN))=NaN;
scale_factor_1 = 1;
scale_factor_2 = 1;


Input_X = CMEMS_Wind_Stress_Curl_interp(~isnan(Depth_W_MEAN));
Input_Y = Depth_W_MEAN(~isnan(Depth_W_MEAN));


X_bin_range = -5e-6:10e-8:5e-6;
Y_bin_range = -2e-4:4e-6:2e-4;

X_bin = 10e-8;
Y_bin = 4e-6;

Sctter_Type = 'Fitting';
Scatter_size = 10;
Colormap_Choice = flipud(slanCM(100));
X_label = 'Wind stress curl (N/m^3)';
Y_label = 'Vertical velocity (m/s)';

X_lim = [-5e-6 5e-6];
Y_lim = [-2e-4 2e-4];

X_tick = -5e-6:2e-6:5e-6;
Y_tick = -2e-4:10e-5:2e-4;




Figure_Name = 'GBA_MHW_Wind_Stress_Curl_VS_Vertical_velocity_Density_Scatter_Decline_T2';
Font_size = 20;


Scatter_X=Input_X(~isnan(Input_X)).*scale_factor_1;
Scatter_Y=Input_Y(~isnan(Input_X)).*scale_factor_2;

k=1;
for i=X_bin_range % Scatter X
    X_bin_value=find(Scatter_X>=i & Scatter_X<i+X_bin);
   
    for j=Y_bin_range  % Scatter Y
        Y_bin_value=find(Scatter_Y>=j & Scatter_Y<j+Y_bin);
        X_value_VS_Y_value=intersect(X_bin_value,Y_bin_value);
        cd=length(X_value_VS_Y_value);
        
        if ~isempty(cd)
            sactter_value=[i,j,cd];
            scatter_valuesum(k,:)=sactter_value;
        end
        k=k+1;
    end
end
if (strcmp(Sctter_Type,'Fitting')) % plot fitting line
    
mdl = fitlm(Scatter_X,Scatter_Y,'linear');


  
end
figure;
set(gcf,'position',[0 0 100*5 100*6]);
axes('position', [0.18 0.12 0.76 0.78]);
scatter_valuesum_1=scatter_valuesum(scatter_valuesum(:,3)>0,:);
scatter(scatter_valuesum_1(:,1),scatter_valuesum_1(:,2),Scatter_size,(scatter_valuesum_1(:,3)),'o',"filled");
Colorbar_range_min=0;
Colorbar_range_max=round(max((scatter_valuesum_1(:,3))),0);
clim([Colorbar_range_min Colorbar_range_max]);
colormap(Colormap_Choice);
c=colorbar('h'); 
c.Label.String = 'Density'; 
set(c,'Fontsize',Font_size,'Ticks',Colorbar_range_min:round(Colorbar_range_max/40)*10:Colorbar_range_max);
set(gca,'Ylim',Y_lim,'Xlim',X_lim,'YTick',Y_tick,'XTick',X_tick,'FontSize',Font_size);
ylabel(Y_label,'FontSize',Font_size);
xlabel(X_label,'FontSize',Font_size);
hold on;

if (strcmp(Sctter_Type,'Fitting')) % plot fitting line
    
[Fitline,Fitconfi]= predict(mdl,X_tick');
plot(X_tick,Fitline,'Linestyle','-','Color','#CD5C5C','LineWidth',1.5);
plot(X_tick,Fitconfi(:,1),'Linestyle',':','Color','#CD5C5C','LineWidth',1);
plot(X_tick,Fitconfi(:,2),'Linestyle',':','Color','#CD5C5C','LineWidth',1);

Fit_data=sprintf('R = %.2f (p<0.01)',sqrt(mdl.Rsquared.Ordinary));
disp(mdl.Coefficients.pValue(2));
title(Fit_data,'Fontsize',20,'Fontname','Calibri',"HorizontalAlignment","center","FontWeight","normal");
end

box on
grid on
ax=gca;
ax.GridLineStyle = '-';
ax.GridAlpha=0.2;
grid minor
ax.MinorGridLineStyle='-.';
ax.MinorGridAlpha=0.15;

set(gca,'Fontname','Calibri','Linewidth',1.5);
clear scatter_valuesum; 
%% Figure 5i
% time period of Decline_Pick_time_3 2021-04-02 to 2021-05-02
load('Figure_5i.mat');
[X, Y]=meshgrid(single(CMEMS_Wind_lon),single(CMEMS_Wind_lat));
[X2, Y2]=meshgrid(single(BRAN_T_lon_GBA),single(BRAN_T_lat_GBA));
CMEMS_Wind_Stress_Curl_interp=NaN(size(Depth_W_MEAN));
for dayorder=1:30
CMEMS_Wind_Stress_Curl_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_Curl_daily(:,:,dayorder+1))),X2,Y2,'linear')));
end
CMEMS_Wind_Stress_Curl_interp(isnan(Depth_W_MEAN))=NaN;
scale_factor_1 = 1;
scale_factor_2 = 1;


Input_X = CMEMS_Wind_Stress_Curl_interp(~isnan(Depth_W_MEAN));
Input_Y = Depth_W_MEAN(~isnan(Depth_W_MEAN));


X_bin_range = -5e-6:10e-8:5e-6;
Y_bin_range = -2e-4:4e-6:2e-4;

X_bin = 10e-8;
Y_bin = 4e-6;

Sctter_Type = 'Fitting';
Scatter_size = 10;
Colormap_Choice = flipud(slanCM(100));
X_label = 'Wind stress curl (N/m^3)';
Y_label = 'Vertical velocity (m/s)';

X_lim = [-5e-6 5e-6];
Y_lim = [-2e-4 2e-4];

X_tick = -5e-6:2e-6:5e-6;
Y_tick = -2e-4:10e-5:2e-4;



Figure_Name = 'GBA_MHW_Wind_Stress_Curl_VS_Vertical_velocity_Density_Scatter_Decline_T3';
Font_size = 20;

Scatter_X=Input_X(~isnan(Input_X)).*scale_factor_1;
Scatter_Y=Input_Y(~isnan(Input_X)).*scale_factor_2;

k=1;
for i=X_bin_range % Scatter X
    X_bin_value=find(Scatter_X>=i & Scatter_X<i+X_bin);
   
    for j=Y_bin_range  % Scatter Y
        Y_bin_value=find(Scatter_Y>=j & Scatter_Y<j+Y_bin);
        X_value_VS_Y_value=intersect(X_bin_value,Y_bin_value);
        cd=length(X_value_VS_Y_value);
        
        if ~isempty(cd)
            sactter_value=[i,j,cd];
            scatter_valuesum(k,:)=sactter_value;
        end
        k=k+1;
    end
end
if (strcmp(Sctter_Type,'Fitting')) % plot fitting line
    
mdl = fitlm(Scatter_X,Scatter_Y,'linear');

end
figure;
set(gcf,'position',[0 0 100*5 100*6]);
axes('position', [0.18 0.12 0.76 0.78]);
scatter_valuesum_1=scatter_valuesum(scatter_valuesum(:,3)>0,:);
scatter(scatter_valuesum_1(:,1),scatter_valuesum_1(:,2),Scatter_size,(scatter_valuesum_1(:,3)),'o',"filled");
Colorbar_range_min=0;
Colorbar_range_max=round(max((scatter_valuesum_1(:,3))),0);
clim([Colorbar_range_min Colorbar_range_max]);
colormap(Colormap_Choice);
c=colorbar('h'); 
c.Label.String = 'Density'; 
set(c,'Fontsize',Font_size,'Ticks',Colorbar_range_min:round(Colorbar_range_max/40)*10:Colorbar_range_max);
set(gca,'Ylim',Y_lim,'Xlim',X_lim,'YTick',Y_tick,'XTick',X_tick,'FontSize',Font_size);
ylabel(Y_label,'FontSize',Font_size);
xlabel(X_label,'FontSize',Font_size);
hold on;

if (strcmp(Sctter_Type,'Fitting')) % plot fitting line
    
[Fitline,Fitconfi]= predict(mdl,X_tick');
plot(X_tick,Fitline,'Linestyle','-','Color','#CD5C5C','LineWidth',1.5);
plot(X_tick,Fitconfi(:,1),'Linestyle',':','Color','#CD5C5C','LineWidth',1);
plot(X_tick,Fitconfi(:,2),'Linestyle',':','Color','#CD5C5C','LineWidth',1);

Fit_data=sprintf('R = %.2f (p<0.01)',sqrt(mdl.Rsquared.Ordinary));
disp(mdl.Coefficients.pValue(2));
title(Fit_data,'Fontsize',20,'Fontname','Calibri',"HorizontalAlignment","center","FontWeight","normal");
end

box on
grid on
ax=gca;
ax.GridLineStyle = '-';
ax.GridAlpha=0.2;
grid minor
ax.MinorGridLineStyle='-.';
ax.MinorGridAlpha=0.15;

set(gca,'Fontname','Calibri','Linewidth',1.5);
clear scatter_valuesum; 

%% Figure 5j
%time period of Decline_Pick_time_1 2017-09-29 to 2017-10-29
load('Figure_5j.mat');
[X, Y]=meshgrid(single(CMEMS_Wind_lon),single(CMEMS_Wind_lat));
[X2, Y2]=meshgrid(single(BRAN_T_lon_GBA),single(BRAN_T_lat_GBA));
CMEMS_Wind_stress_N_daily_interp=NaN(size(Depth_W_MEAN));
CMEMS_Wind_stress_E_daily_interp=NaN(size(Depth_W_MEAN));
CMEMS_Wind_stress_daily=sqrt(CMEMS_Wind_stress_E_daily.^2+CMEMS_Wind_stress_N_daily.^2);
CMEMS_Wind_stress_daily_interp=NaN(size(Depth_W_MEAN));
for dayorder=1:30
    CMEMS_Wind_stress_daily_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_daily(:,:,dayorder+1))),X2,Y2,'linear')));
    CMEMS_Wind_stress_N_daily_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_N_daily(:,:,dayorder+1))),X2,Y2,'linear')));
    CMEMS_Wind_stress_E_daily_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_E_daily(:,:,dayorder+1))),X2,Y2,'linear')));
end
CMEMS_Wind_stress_daily_interp(isnan(Depth_W_MEAN))=NaN;
CMEMS_Wind_stress_N_daily_interp(isnan(Depth_W_MEAN))=NaN;
CMEMS_Wind_stress_E_daily_interp(isnan(Depth_W_MEAN))=NaN;

wind_dir=atan2(-CMEMS_Wind_stress_N_daily_interp,CMEMS_Wind_stress_E_daily_interp);
wind_dir_valid=wind_dir;
Valid_index=find(wind_dir<0);
wind_dir_valid(Valid_index)=2*pi+wind_dir(Valid_index);
wind_dir_valid=wind_dir_valid+pi/2;
Winddir_input=wind_dir_valid(~isnan(Depth_W_MEAN));
Input_X=CMEMS_Wind_stress_daily_interp(~isnan(Depth_W_MEAN));
Input_Y=Depth_W_MEAN(~isnan(Depth_W_MEAN));

X_bin_range = 0.5*pi:pi/9:2.5*pi;

X_bin = pi/9;

scale_factor_1 = 1;
scale_factor_2 = 1;


Figure_Name = 'GBA_MHW_Wind_Stress_direction_VS_Vertical_Velocity_Density_Scatter_Decline_T1';
Font_size = 20;

Fit_data=sprintf('Histogram of wind stress direction');

Winddir_input_valid=Winddir_input(~isnan(Input_X));
Scatter_X=Input_X(~isnan(Input_X)).*scale_factor_1;
Scatter_Y=Input_Y(~isnan(Input_X)).*scale_factor_2;

clear scatter_valuesum scatter_valuesum_1;
k=1;
for i=X_bin_range % Scatter X
    if i==2.5*pi
        continue;
    else
    X_bin_value=find(Winddir_input_valid>=i & Winddir_input_valid<i+X_bin);
    cd=length(X_bin_value);
    
        mdl = fitlm(Scatter_X(X_bin_value),Scatter_Y(X_bin_value),'linear');
        P_mdl=mdl.Coefficients.pValue(2);
        R_mdl=sqrt(mdl.Rsquared.Ordinary);
        if P_mdl<0.05 && cd>50
            sactter_value=[(i+i+X_bin)/2,R_mdl];
            scatter_valuesum(k,:)=sactter_value;
        
        else
            sactter_value=[(i+i+X_bin)/2,NaN];
            scatter_valuesum(k,:)=sactter_value;
        
        end
        k=k+1;
    end
end
scatter_valuesum_1=scatter_valuesum;

figure;
set(gcf,'position',[0 0 100*5 100*6]);
set (gca,'position',[0.05,0.1,0.9,0.75] );
ph = polarhistogram(Winddir_input_valid,0.5*pi:pi/9:2.4*pi,"FaceAlpha",0.5,'EdgeColor',[1 1 1].*0.5,'FaceColor',[1 1 1].*0.7,'Linewidth',1.5);
pax = gca;
pax.ThetaDir = 'clockwise';
pax.ThetaZeroLocation = "top";
pax.FontSize = Font_size;
pax.RColor = [1 1 1].*0.3;
thetaticks(0:45:315)
rticks(1000:1000:3000)

scatter_x=ph.BinEdges(1:18)+ph.BinWidth/2;
scatter_y=repmat(max(ph.Values),size(scatter_x))/2;
hold on;
ps=polarscatter(scatter_x,scatter_y,scatter_valuesum_1(:,2)'*300,scatter_valuesum_1(:,2)','o',"filled");
clim([0 1]);
colormap(flipud(slanCM(100,10)));
c=colorbar('h'); 
c.Label.String = sprintf('R (Wind stress - Vertical velocity)'); 
set(c,'Fontsize',Font_size,'Ticks',0:0.2:1);

pax.GridLineStyle = '--';
pax.GridAlpha=0.2;
set(gca,'Fontname','Calibri','Linewidth',1.5);
title(Fit_data,'Fontsize',20,'Fontname','Calibri',"HorizontalAlignment","center","FontWeight","normal");
 clear scatter_valuesum scatter_valuesum_1; 

%% Figure 5k
% time period of Decline_Pick_time_2 2018-05-30 to 2018-6-29
load('Figure_5k.mat');
[X, Y]=meshgrid(single(CMEMS_Wind_lon),single(CMEMS_Wind_lat));
[X2, Y2]=meshgrid(single(BRAN_T_lon_GBA),single(BRAN_T_lat_GBA));
CMEMS_Wind_stress_N_daily_interp=NaN(size(Depth_W_MEAN));
CMEMS_Wind_stress_E_daily_interp=NaN(size(Depth_W_MEAN));
CMEMS_Wind_stress_daily=sqrt(CMEMS_Wind_stress_E_daily.^2+CMEMS_Wind_stress_N_daily.^2);
CMEMS_Wind_stress_daily_interp=NaN(size(Depth_W_MEAN));
for dayorder=1:30
    CMEMS_Wind_stress_daily_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_daily(:,:,dayorder+1))),X2,Y2,'linear')));
    CMEMS_Wind_stress_N_daily_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_N_daily(:,:,dayorder+1))),X2,Y2,'linear')));
    CMEMS_Wind_stress_E_daily_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_E_daily(:,:,dayorder+1))),X2,Y2,'linear')));
end
CMEMS_Wind_stress_daily_interp(isnan(Depth_W_MEAN))=NaN;
CMEMS_Wind_stress_N_daily_interp(isnan(Depth_W_MEAN))=NaN;
CMEMS_Wind_stress_E_daily_interp(isnan(Depth_W_MEAN))=NaN;

wind_dir=atan2(-CMEMS_Wind_stress_N_daily_interp,CMEMS_Wind_stress_E_daily_interp);
wind_dir_valid=wind_dir;
Valid_index=find(wind_dir<0);
wind_dir_valid(Valid_index)=2*pi+wind_dir(Valid_index);
wind_dir_valid=wind_dir_valid+pi/2;
Winddir_input=wind_dir_valid(~isnan(Depth_W_MEAN));
Input_X=CMEMS_Wind_stress_daily_interp(~isnan(Depth_W_MEAN));
Input_Y=Depth_W_MEAN(~isnan(Depth_W_MEAN));

X_bin_range = 0.5*pi:pi/9:2.5*pi;

X_bin = pi/9;

scale_factor_1 = 1;
scale_factor_2 = 1;


Figure_Name = 'GBA_MHW_Wind_Stress_direction_VS_Vertical_Velocity_Density_Scatter_Decline_T2';
Font_size = 20;

Fit_data=sprintf('Histogram of wind stress direction');

Winddir_input_valid=Winddir_input(~isnan(Input_X));
Scatter_X=Input_X(~isnan(Input_X)).*scale_factor_1;
Scatter_Y=Input_Y(~isnan(Input_X)).*scale_factor_2;

clear scatter_valuesum scatter_valuesum_1;
k=1;
for i=X_bin_range % Scatter X
    if i==2.5*pi
        continue;
    else
    X_bin_value=find(Winddir_input_valid>=i & Winddir_input_valid<i+X_bin);
    cd=length(X_bin_value);
    
        mdl = fitlm(Scatter_X(X_bin_value),Scatter_Y(X_bin_value),'linear');
        P_mdl=mdl.Coefficients.pValue(2);
        R_mdl=sqrt(mdl.Rsquared.Ordinary);
        if P_mdl<0.05 && cd>50
            sactter_value=[(i+i+X_bin)/2,R_mdl];
            scatter_valuesum(k,:)=sactter_value;
        
        else
            sactter_value=[(i+i+X_bin)/2,NaN];
            scatter_valuesum(k,:)=sactter_value;
        
        end
        k=k+1;
    end
end
scatter_valuesum_1=scatter_valuesum;

figure;
set(gcf,'position',[0 0 100*5 100*6]);
set (gca,'position',[0.05,0.1,0.9,0.75] );
ph = polarhistogram(Winddir_input_valid,0.5*pi:pi/9:2.4*pi,"FaceAlpha",0.5,'EdgeColor',[1 1 1].*0.5,'FaceColor',[1 1 1].*0.7,'Linewidth',1.5);
pax = gca;
pax.ThetaDir = 'clockwise';
pax.ThetaZeroLocation = "top";
pax.FontSize = Font_size;
pax.RColor = [1 1 1].*0.3;
thetaticks(0:45:315)
rticks(500:500:1000)

scatter_x=ph.BinEdges(1:18)+ph.BinWidth/2;
scatter_y=repmat(max(ph.Values),size(scatter_x))/2;
hold on;
ps=polarscatter(scatter_x,scatter_y,scatter_valuesum_1(:,2)'*300,scatter_valuesum_1(:,2)','o',"filled");
clim([0 1]);
colormap(flipud(slanCM(100,10)));
c=colorbar('h'); 
c.Label.String = sprintf('R (Wind stress - Vertical velocity)'); 
set(c,'Fontsize',Font_size,'Ticks',0:0.2:1);

pax.GridLineStyle = '--';
pax.GridAlpha=0.2;
set(gca,'Fontname','Calibri','Linewidth',1.5);
title(Fit_data,'Fontsize',20,'Fontname','Calibri',"HorizontalAlignment","center","FontWeight","normal");
clear scatter_valuesum scatter_valuesum_1;

%% Figure 5l
% time period of Decline_Pick_time_3 2021-04-02 to 2021-05-02
load('Figure_5l.mat');
[X, Y]=meshgrid(single(CMEMS_Wind_lon),single(CMEMS_Wind_lat));
[X2, Y2]=meshgrid(single(BRAN_T_lon_GBA),single(BRAN_T_lat_GBA));
CMEMS_Wind_stress_N_daily_interp=NaN(size(Depth_W_MEAN));
CMEMS_Wind_stress_E_daily_interp=NaN(size(Depth_W_MEAN));
CMEMS_Wind_stress_daily=sqrt(CMEMS_Wind_stress_E_daily.^2+CMEMS_Wind_stress_N_daily.^2);
CMEMS_Wind_stress_daily_interp=NaN(size(Depth_W_MEAN));
for dayorder=1:30
    CMEMS_Wind_stress_daily_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_daily(:,:,dayorder+1))),X2,Y2,'linear')));
    CMEMS_Wind_stress_N_daily_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_N_daily(:,:,dayorder+1))),X2,Y2,'linear')));
    CMEMS_Wind_stress_E_daily_interp(:,:,dayorder)=flipud(rot90(interp2(X,Y,flipud(rot90(CMEMS_Wind_stress_E_daily(:,:,dayorder+1))),X2,Y2,'linear')));
end
CMEMS_Wind_stress_daily_interp(isnan(Depth_W_MEAN))=NaN;
CMEMS_Wind_stress_N_daily_interp(isnan(Depth_W_MEAN))=NaN;
CMEMS_Wind_stress_E_daily_interp(isnan(Depth_W_MEAN))=NaN;


wind_dir=atan2(-CMEMS_Wind_stress_N_daily_interp,CMEMS_Wind_stress_E_daily_interp);
wind_dir_valid=wind_dir;
Valid_index=find(wind_dir<0);
wind_dir_valid(Valid_index)=2*pi+wind_dir(Valid_index);
wind_dir_valid=wind_dir_valid+pi/2;
Winddir_input=wind_dir_valid(~isnan(Depth_W_MEAN));
Input_X=CMEMS_Wind_stress_daily_interp(~isnan(Depth_W_MEAN));
Input_Y=Depth_W_MEAN(~isnan(Depth_W_MEAN));

X_bin_range = 0.5*pi:pi/9:2.5*pi;

X_bin = pi/9;

scale_factor_1 = 1;
scale_factor_2 = 1;


Figure_Name = 'GBA_MHW_Wind_Stress_direction_VS_Vertical_Velocity_Density_Scatter_Decline_T3';
Font_size = 20;

Fit_data=sprintf('Histogram of wind stress direction');

Winddir_input_valid=Winddir_input(~isnan(Input_X));
Scatter_X=Input_X(~isnan(Input_X)).*scale_factor_1;
Scatter_Y=Input_Y(~isnan(Input_X)).*scale_factor_2;

clear scatter_valuesum scatter_valuesum_1;
k=1;
for i=X_bin_range % Scatter X
    if i==2.5*pi
        continue;
    else
    X_bin_value=find(Winddir_input_valid>=i & Winddir_input_valid<i+X_bin);
    cd=length(X_bin_value);
    
        mdl = fitlm(Scatter_X(X_bin_value),Scatter_Y(X_bin_value),'linear');
        P_mdl=mdl.Coefficients.pValue(2);
        R_mdl=sqrt(mdl.Rsquared.Ordinary);
        if P_mdl<0.05 && cd>50
            sactter_value=[(i+i+X_bin)/2,R_mdl];
            scatter_valuesum(k,:)=sactter_value;
        
        else
            sactter_value=[(i+i+X_bin)/2,NaN];
            scatter_valuesum(k,:)=sactter_value;
        
        end
        k=k+1;
    end
end
scatter_valuesum_1=scatter_valuesum;

figure;
set(gcf,'position',[0 0 100*5 100*6]);
set (gca,'position',[0.05,0.1,0.9,0.75] );
ph = polarhistogram(Winddir_input_valid,0.5*pi:pi/9:2.4*pi,"FaceAlpha",0.5,'EdgeColor',[1 1 1].*0.5,'FaceColor',[1 1 1].*0.7,'Linewidth',1.5);
pax = gca;
pax.ThetaDir = 'clockwise';
pax.ThetaZeroLocation = "top";
pax.FontSize = Font_size;
pax.RColor = [1 1 1].*0.3;
thetaticks(0:45:315)
rticks(1000:1000:3000)

scatter_x=ph.BinEdges(1:18)+ph.BinWidth/2;
scatter_y=repmat(max(ph.Values),size(scatter_x))/2;
hold on;
ps=polarscatter(scatter_x,scatter_y,scatter_valuesum_1(:,2)'*300,scatter_valuesum_1(:,2)','o',"filled");
clim([0 1]);
colormap(flipud(slanCM(100,10)));
c=colorbar('h'); 
c.Label.String = sprintf('R (Wind stress - Vertical velocity)'); 
set(c,'Fontsize',Font_size,'Ticks',0:0.2:1);

pax.GridLineStyle = '--';
pax.GridAlpha=0.2;
set(gca,'Fontname','Calibri','Linewidth',1.5);
title(Fit_data,'Fontsize',20,'Fontname','Calibri',"HorizontalAlignment","center","FontWeight","normal");
clear scatter_valuesum scatter_valuesum_1;