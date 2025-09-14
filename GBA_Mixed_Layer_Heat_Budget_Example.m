%% load BRAN data Pick time 1 2017-09-29 one month before the peak date    21.4-23.6N    111.6-115.8E
% flux data
atm_flux_info=ncinfo('atm_flux_diag_2017_08.nc');
atm_flux_info_2=ncinfo('atm_flux_diag_2017_09.nc');
BRAN_T_lon=ncread(atm_flux_info.Filename,atm_flux_info.Variables(1).Name);
BRAN_T_lat=ncread(atm_flux_info.Filename,atm_flux_info.Variables(2).Name);

BRAN_T_lon_GBA=BRAN_T_lon(BRAN_T_lon<=115.8 & BRAN_T_lon>=111.6);

BRAN_T_lon_1_GBA=find(BRAN_T_lon==BRAN_T_lon_GBA(1))-1;
BRAN_T_lon_2_GBA=find(BRAN_T_lon==BRAN_T_lon_GBA(end));
BRAN_T_lon_GBA_size=BRAN_T_lon_2_GBA-BRAN_T_lon_1_GBA+1;

BRAN_T_lat_GBA=BRAN_T_lat(BRAN_T_lat<=23.6& BRAN_T_lat>=21.4);

BRAN_T_lat_1_GBA=find(BRAN_T_lat==BRAN_T_lat_GBA(1))-1;
BRAN_T_lat_2_GBA=find(BRAN_T_lat==BRAN_T_lat_GBA(end));
BRAN_T_lat_GBA_size=BRAN_T_lat_2_GBA-BRAN_T_lat_1_GBA+1;

BRAN_T_lon_GBA_full=BRAN_T_lon(BRAN_T_lon_1_GBA:BRAN_T_lon_2_GBA);
BRAN_T_lat_GBA_full=BRAN_T_lat(BRAN_T_lat_1_GBA:BRAN_T_lat_2_GBA);
Day_length=31;

Wind_Speed=zeros(BRAN_T_lon_GBA_size,BRAN_T_lat_GBA_size,Day_length);
Wind_Speed(:,:,1:2)=ncread(atm_flux_info.Filename,atm_flux_info.Variables(7).Name,[BRAN_T_lon_1_GBA BRAN_T_lat_1_GBA 30],...
    [BRAN_T_lon_GBA_size  BRAN_T_lat_GBA_size 2]);
Wind_Speed(:,:,3:end)=ncread(atm_flux_info_2.Filename,atm_flux_info_2.Variables(7).Name,[BRAN_T_lon_1_GBA BRAN_T_lat_1_GBA 1],...
    [BRAN_T_lon_GBA_size  BRAN_T_lat_GBA_size 29]);

Zonal_WindStress=zeros(BRAN_T_lon_GBA_size,BRAN_T_lat_GBA_size,Day_length);
Zonal_WindStress(:,:,1:2)=ncread(atm_flux_info.Filename,atm_flux_info.Variables(9).Name,[BRAN_T_lon_1_GBA BRAN_T_lat_1_GBA 30],...
    [BRAN_T_lon_GBA_size  BRAN_T_lat_GBA_size 2]);
Zonal_WindStress(:,:,3:end)=ncread(atm_flux_info_2.Filename,atm_flux_info_2.Variables(9).Name,[BRAN_T_lon_1_GBA BRAN_T_lat_1_GBA 1],...
    [BRAN_T_lon_GBA_size  BRAN_T_lat_GBA_size 29]);

Zonal_WindSpeed=zeros(BRAN_T_lon_GBA_size,BRAN_T_lat_GBA_size,Day_length);
Zonal_WindSpeed(:,:,1:2)=ncread(atm_flux_info.Filename,atm_flux_info.Variables(12).Name,[BRAN_T_lon_1_GBA BRAN_T_lat_1_GBA 30],...
    [BRAN_T_lon_GBA_size  BRAN_T_lat_GBA_size 2]);
Zonal_WindSpeed(:,:,3:end)=ncread(atm_flux_info_2.Filename,atm_flux_info_2.Variables(12).Name,[BRAN_T_lon_1_GBA BRAN_T_lat_1_GBA 1],...
    [BRAN_T_lon_GBA_size  BRAN_T_lat_GBA_size 29]);

Merid_WindStress=zeros(BRAN_T_lon_GBA_size,BRAN_T_lat_GBA_size,Day_length);
Merid_WindStress(:,:,1:2)=ncread(atm_flux_info.Filename,atm_flux_info.Variables(10).Name,[BRAN_T_lon_1_GBA BRAN_T_lat_1_GBA 30],...
    [BRAN_T_lon_GBA_size  BRAN_T_lat_GBA_size 2]);
Merid_WindStress(:,:,3:end)=ncread(atm_flux_info_2.Filename,atm_flux_info_2.Variables(10).Name,[BRAN_T_lon_1_GBA BRAN_T_lat_1_GBA 1],...
    [BRAN_T_lon_GBA_size  BRAN_T_lat_GBA_size 29]);


Merid_WindSpeed=zeros(BRAN_T_lon_GBA_size,BRAN_T_lat_GBA_size,Day_length);
Merid_WindSpeed(:,:,1:2)=ncread(atm_flux_info.Filename,atm_flux_info.Variables(13).Name,[BRAN_T_lon_1_GBA BRAN_T_lat_1_GBA 30],...
    [BRAN_T_lon_GBA_size  BRAN_T_lat_GBA_size 2]);
Merid_WindSpeed(:,:,3:end)=ncread(atm_flux_info_2.Filename,atm_flux_info_2.Variables(13).Name,[BRAN_T_lon_1_GBA BRAN_T_lat_1_GBA 1],...
    [BRAN_T_lon_GBA_size  BRAN_T_lat_GBA_size 29]);

surface_T=zeros(BRAN_T_lon_GBA_size,BRAN_T_lat_GBA_size,Day_length);
surface_T(:,:,1:2)=ncread(atm_flux_info.Filename,atm_flux_info.Variables(8).Name,[BRAN_T_lon_1_GBA BRAN_T_lat_1_GBA 30],...
    [BRAN_T_lon_GBA_size  BRAN_T_lat_GBA_size 2])-273.15;
surface_T(:,:,3:end)=ncread(atm_flux_info_2.Filename,atm_flux_info_2.Variables(8).Name,[BRAN_T_lon_1_GBA BRAN_T_lat_1_GBA 1],...
    [BRAN_T_lon_GBA_size  BRAN_T_lat_GBA_size 29])-273.15;

surface_T(surface_T<=0)=NaN;
MASK_T=double(~isnan(surface_T(:,:,1)));
MASK_T(MASK_T==0)=NaN;

%% ocean_force
ocean_force_info_1=ncinfo( 'ocean_force_2017_08.nc');
ocean_force_info_2=ncinfo( 'ocean_force_2017_09.nc');
% 'surface heat flux from coupler plus restore (omits mass transfer heating)' ('W/m^2')
BRAN_F_lon=ncread(ocean_force_info_1.Filename,ocean_force_info_1.Variables(1).Name);
BRAN_F_lat=ncread(ocean_force_info_1.Filename,ocean_force_info_1.Variables(2).Name);

BRAN_F_lon_GBA=BRAN_F_lon(BRAN_F_lon<=115.8 & BRAN_F_lon>=111.6);

BRAN_F_lon_1_GBA=find(BRAN_F_lon==BRAN_F_lon_GBA(1))-1;
BRAN_F_lon_2_GBA=find(BRAN_F_lon==BRAN_F_lon_GBA(end));
BRAN_F_lon_GBA_size=BRAN_F_lon_2_GBA-BRAN_F_lon_1_GBA+1;

BRAN_F_lat_GBA=BRAN_F_lat(BRAN_F_lat<=23.6& BRAN_F_lat>=21.4);

BRAN_F_lat_1_GBA=find(BRAN_F_lat==BRAN_F_lat_GBA(1))-1;
BRAN_F_lat_2_GBA=find(BRAN_F_lat==BRAN_F_lat_GBA(end));
BRAN_F_lat_GBA_size=BRAN_F_lat_2_GBA-BRAN_F_lat_1_GBA+1;

BRAN_F_lon_GBA_full=BRAN_F_lon(BRAN_F_lon_1_GBA:BRAN_F_lon_2_GBA);
BRAN_F_lat_GBA_full=BRAN_F_lat(BRAN_F_lat_1_GBA:BRAN_F_lat_2_GBA);

Q_net=zeros(BRAN_F_lon_GBA_size,BRAN_F_lat_GBA_size,Day_length);
Q_net(:,:,1:2)=ncread(ocean_force_info_1.Filename,ocean_force_info_1.Variables(7).Name,[BRAN_F_lon_1_GBA BRAN_F_lat_1_GBA 30],...
    [BRAN_F_lon_GBA_size  BRAN_F_lat_GBA_size 2]);
Q_net(:,:,3:end)=ncread(ocean_force_info_2.Filename,ocean_force_info_2.Variables(7).Name,[BRAN_F_lon_1_GBA BRAN_F_lat_1_GBA 1],...
    [BRAN_F_lon_GBA_size  BRAN_F_lat_GBA_size 29]);
Q_net=Q_net.*MASK_T;


% 'surface_net_downward_shortwave_flux (>0 heats ocean)' ('W/m^2')

Q_swf=zeros(BRAN_F_lon_GBA_size,BRAN_F_lat_GBA_size,Day_length);
Q_swf(:,:,1:2)=ncread(ocean_force_info_1.Filename,ocean_force_info_1.Variables(15).Name,[BRAN_F_lon_1_GBA BRAN_F_lat_1_GBA 30],...
    [BRAN_F_lon_GBA_size  BRAN_F_lat_GBA_size 2]);
Q_swf(:,:,3:end)=ncread(ocean_force_info_2.Filename,ocean_force_info_2.Variables(15).Name,[BRAN_F_lon_1_GBA BRAN_F_lat_1_GBA 1],...
    [BRAN_F_lon_GBA_size  BRAN_F_lat_GBA_size 29]);
Q_swf=Q_swf.*MASK_T;



% 'surface_net_downward_longwave_flux (<0 cools ocean)' ('W/m^2')

Q_lwf=zeros(BRAN_F_lon_GBA_size,BRAN_F_lat_GBA_size,Day_length);
Q_lwf(:,:,1:2)=ncread(ocean_force_info_1.Filename,ocean_force_info_1.Variables(18).Name,[BRAN_F_lon_1_GBA BRAN_F_lat_1_GBA 30],...
    [BRAN_F_lon_GBA_size  BRAN_F_lat_GBA_size 2]);
Q_lwf(:,:,3:end)=ncread(ocean_force_info_2.Filename,ocean_force_info_2.Variables(18).Name,[BRAN_F_lon_1_GBA BRAN_F_lat_1_GBA 1],...
    [BRAN_F_lon_GBA_size  BRAN_F_lat_GBA_size 29]);
Q_lwf=Q_lwf.*MASK_T;


% 'surface_downward_latent_heat_flux (<0 cools ocean)' ('W/m^2')

Q_lhf=zeros(BRAN_F_lon_GBA_size,BRAN_F_lat_GBA_size,Day_length);
Q_lhf(:,:,1:2)=ncread(ocean_force_info_1.Filename,ocean_force_info_1.Variables(16).Name,[BRAN_F_lon_1_GBA BRAN_F_lat_1_GBA 30],...
    [BRAN_F_lon_GBA_size  BRAN_F_lat_GBA_size 2]);
Q_lhf(:,:,3:end)=ncread(ocean_force_info_2.Filename,ocean_force_info_2.Variables(16).Name,[BRAN_F_lon_1_GBA BRAN_F_lat_1_GBA 1],...
    [BRAN_F_lon_GBA_size  BRAN_F_lat_GBA_size 29]);
Q_lhf=Q_lhf.*MASK_T;


% 'surface_downward_sensible_heat_flux(<0 cools ocean)' ('W/m^2')

Q_shf=zeros(BRAN_F_lon_GBA_size,BRAN_F_lat_GBA_size,Day_length);
Q_shf(:,:,1:2)=ncread(ocean_force_info_1.Filename,ocean_force_info_1.Variables(17).Name,[BRAN_F_lon_1_GBA BRAN_F_lat_1_GBA 30],...
    [BRAN_F_lon_GBA_size  BRAN_F_lat_GBA_size 2]);
Q_shf(:,:,3:end)=ncread(ocean_force_info_2.Filename,ocean_force_info_2.Variables(17).Name,[BRAN_F_lon_1_GBA BRAN_F_lat_1_GBA 1],...
    [BRAN_F_lon_GBA_size  BRAN_F_lat_GBA_size 29]);
Q_shf=Q_shf.*MASK_T;


%% ocean_mld

ocean_mld_info_1=ncinfo( 'ocean_mld_2017_08.nc');
ocean_mld_info_2=ncinfo( 'ocean_mld_2017_09.nc');

BRAN_ML_lon=ncread(ocean_mld_info_1.Filename,ocean_mld_info_1.Variables(1).Name);
BRAN_ML_lat=ncread(ocean_mld_info_1.Filename,ocean_mld_info_1.Variables(2).Name);

BRAN_ML_lon_GBA=BRAN_ML_lon(BRAN_ML_lon<=115.8 & BRAN_ML_lon>=111.6);

BRAN_ML_lon_1_GBA=find(BRAN_ML_lon==BRAN_ML_lon_GBA(1))-1;
BRAN_ML_lon_2_GBA=find(BRAN_ML_lon==BRAN_ML_lon_GBA(end));
BRAN_ML_lon_GBA_size=BRAN_ML_lon_2_GBA-BRAN_ML_lon_1_GBA+1;

BRAN_ML_lat_GBA=BRAN_ML_lat(BRAN_ML_lat<=23.6 & BRAN_ML_lat>=21.4);

BRAN_ML_lat_1_GBA=find(BRAN_ML_lat==BRAN_ML_lat_GBA(1))-1;
BRAN_ML_lat_2_GBA=find(BRAN_ML_lat==BRAN_ML_lat_GBA(end));
BRAN_ML_lat_GBA_size=BRAN_ML_lat_2_GBA-BRAN_ML_lat_1_GBA+1;

BRAN_ML_lon_GBA_full=BRAN_ML_lon(BRAN_ML_lon_1_GBA:BRAN_ML_lon_2_GBA);
BRAN_ML_lat_GBA_full=BRAN_ML_lat(BRAN_ML_lat_1_GBA:BRAN_ML_lat_2_GBA);

% 'ocean_mixed_layer_thickness_defined_by_sigma_t' ('m') or 'mixed layer depth determined by density criteria'
ML_depth=zeros(BRAN_ML_lon_GBA_size,BRAN_ML_lat_GBA_size,Day_length);
ML_depth(:,:,1:2)=ncread(ocean_mld_info_1.Filename,ocean_mld_info_1.Variables(9).Name,[BRAN_ML_lon_1_GBA BRAN_ML_lat_1_GBA 30],...
    [BRAN_ML_lon_GBA_size  BRAN_ML_lat_GBA_size 2]);
ML_depth(:,:,3:end)=ncread(ocean_mld_info_2.Filename,ocean_mld_info_2.Variables(9).Name,[BRAN_ML_lon_1_GBA BRAN_ML_lat_1_GBA 1],...
    [BRAN_ML_lon_GBA_size  BRAN_ML_lat_GBA_size 29]);
ML_depth=ML_depth.*MASK_T;

%% penetration heat flux

CHL_info=ncinfo(strcat('cmems_obs-oc_glo_bgc-plankton_my_l4-gapfree-multi-4km_P1D_GBA_201708_201710.nc');
CHL_lon=ncread(CHL_info.Filename,CHL_info.Variables(5).Name);
CHL_lat=ncread(CHL_info.Filename,CHL_info.Variables(4).Name);
CHL_a_original=ncread(CHL_info.Filename,CHL_info.Variables(1).Name);

[XX,YY]=meshgrid(BRAN_ML_lon_GBA_full,BRAN_ML_lat_GBA_full);
[xx,yy]=meshgrid(CHL_lon,CHL_lat);
CHL_a_10km=zeros(BRAN_ML_lon_GBA_size,BRAN_ML_lat_GBA_size,size(CHL_a_original,3));

for time=1:size(CHL_a_original,3)
CHL_a_10km(:,:,time)=flipud(rot90(interp2(xx,yy,flipud(rot90(squeeze(CHL_a_original(:,:,time)))),XX,YY,'nearest')));
end
Day_1=30;
Day_31=Day_1+30;
CHL_a=CHL_a_10km(:,:,Day_1:Day_31);
Mask_bias=isnan(CHL_a(:,:,1))-isnan(MASK_T);
[x1, y1]=find(Mask_bias==1);


CHL_a=CHL_a.*MASK_T;

Attenuation_Coefficient=0.028+0.058.*CHL_a;
Pen_fraction=0.33;
Q_pen=-Q_swf.*Pen_fraction.*exp(-ML_depth.*Attenuation_Coefficient);% each term includes the assoicated sign in the heat budget equation


%% ocean_temperature

ocean_temp_info_1=ncinfo( 'ocean_temp_2017_08.nc');
ocean_temp_info_2=ncinfo( 'ocean_temp_2017_09.nc');

BRAN_DT_lon=ncread(ocean_temp_info_1.Filename,ocean_temp_info_1.Variables(1).Name);
BRAN_DT_lat=ncread(ocean_temp_info_1.Filename,ocean_temp_info_1.Variables(2).Name);

BRAN_DT_lon_GBA=BRAN_DT_lon(BRAN_DT_lon<=115.8 & BRAN_DT_lon>=111.6);

BRAN_DT_lon_1_GBA=find(BRAN_DT_lon==BRAN_DT_lon_GBA(1))-1;
BRAN_DT_lon_2_GBA=find(BRAN_DT_lon==BRAN_DT_lon_GBA(end));
BRAN_DT_lon_GBA_size=BRAN_DT_lon_2_GBA-BRAN_DT_lon_1_GBA+1;

BRAN_DT_lat_GBA=BRAN_DT_lat(BRAN_DT_lat<=23.6& BRAN_DT_lat>=21.4);

BRAN_DT_lat_1_GBA=find(BRAN_DT_lat==BRAN_DT_lat_GBA(1))-1;
BRAN_DT_lat_2_GBA=find(BRAN_DT_lat==BRAN_DT_lat_GBA(end));
BRAN_DT_lat_GBA_size=BRAN_DT_lat_2_GBA-BRAN_DT_lat_1_GBA+1;

BRAN_DT_lon_GBA_full=BRAN_DT_lon(BRAN_DT_lon_1_GBA:BRAN_DT_lon_2_GBA);
BRAN_DT_lat_GBA_full=BRAN_DT_lat(BRAN_DT_lat_1_GBA:BRAN_DT_lat_2_GBA);

% 'tcell zstar depth edges' (meter) start depth of each vertical layer
Z_edge_T=ncread(ocean_temp_info_1.Filename,ocean_temp_info_1.Variables(6).Name);

% 'tcell depth edges' (meter) middle depth of each vertical layer
Z_middle_T=ncread(ocean_temp_info_1.Filename,ocean_temp_info_1.Variables(3).Name);

% 'sea_water_potential_temperature' at each z depth ('degree C')
Depth_T=zeros(BRAN_DT_lon_GBA_size,BRAN_DT_lat_GBA_size,length(Z_middle_T), Day_length);
Depth_T(:,:,:,1:2)=ncread(ocean_temp_info_1.Filename,ocean_temp_info_1.Variables(11).Name,[BRAN_DT_lon_1_GBA BRAN_DT_lat_1_GBA 1 30],...
    [BRAN_DT_lon_GBA_size  BRAN_DT_lat_GBA_size inf 2]);
Depth_T(:,:,:,3:end)=ncread(ocean_temp_info_2.Filename,ocean_temp_info_2.Variables(11).Name,[BRAN_DT_lon_1_GBA BRAN_DT_lat_1_GBA  1 1],...
    [BRAN_DT_lon_GBA_size  BRAN_DT_lat_GBA_size inf 29]);
Depth_T=Depth_T.*MASK_T;

%% ocean_u at the western boundary of each temperature pixel

ocean_u_info_1=ncinfo('ocean_u_2017_08.nc');
ocean_u_info_2=ncinfo('ocean_u_2017_09.nc');
BRAN_U_lon=ncread(ocean_u_info_1.Filename,ocean_u_info_1.Variables(1).Name);
BRAN_U_lat=ncread(ocean_u_info_1.Filename,ocean_u_info_1.Variables(2).Name);

BRAN_U_lon_GBA=BRAN_U_lon(BRAN_U_lon<115.8 & BRAN_U_lon>111.5);

BRAN_U_lon_1_GBA=find(BRAN_U_lon==BRAN_U_lon_GBA(1))-1;
BRAN_U_lon_2_GBA=find(BRAN_U_lon==BRAN_U_lon_GBA(end));
BRAN_U_lon_GBA_size=BRAN_U_lon_2_GBA-BRAN_U_lon_1_GBA+1;

BRAN_U_lat_GBA=BRAN_U_lat(BRAN_U_lat<23.6 & BRAN_U_lat>21.3);

BRAN_U_lat_1_GBA=find(BRAN_U_lat==BRAN_U_lat_GBA(1))-1;
BRAN_U_lat_2_GBA=find(BRAN_U_lat==BRAN_U_lat_GBA(end));
BRAN_U_lat_GBA_size=BRAN_U_lat_2_GBA-BRAN_U_lat_1_GBA+1;

BRAN_U_lon_GBA_full=BRAN_U_lon(BRAN_U_lon_1_GBA:BRAN_U_lon_2_GBA);
BRAN_U_lat_GBA_full=BRAN_U_lat(BRAN_U_lat_1_GBA:BRAN_U_lat_2_GBA);


% 'tcell zstar depth edges' (meter) start depth of each vertical layer
Z_edge_U=ncread(ocean_u_info_1.Filename,ocean_u_info_1.Variables(6).Name);

% 'tcell depth edges' (meter) middle depth of each vertical layer
Z_middle_U=ncread(ocean_u_info_1.Filename,ocean_u_info_1.Variables(3).Name);

% 'sea_water_x_velocity' ('m/sec')
Depth_U=zeros(BRAN_U_lon_GBA_size,BRAN_U_lat_GBA_size,length(Z_middle_U), Day_length);
Depth_U(:,:,:,1:2)=ncread(ocean_u_info_1.Filename,ocean_u_info_1.Variables(11).Name,[BRAN_U_lon_1_GBA BRAN_U_lat_1_GBA 1 30],...
    [BRAN_U_lon_GBA_size  BRAN_U_lat_GBA_size inf 2]);
Depth_U(:,:,:,3:end)=ncread(ocean_u_info_2.Filename,ocean_u_info_2.Variables(11).Name,[BRAN_U_lon_1_GBA BRAN_U_lat_1_GBA  1 1],...
    [BRAN_U_lon_GBA_size  BRAN_U_lat_GBA_size inf 29]);

MASK_U=double(squeeze(~isnan(Depth_U(:,:,1,1))));
MASK_U(MASK_U==0)=NaN;
Depth_U=Depth_U.*MASK_U;



%% ocean_v 

ocean_v_info_1=ncinfo('ocean_v_2017_08.nc');
ocean_v_info_2=ncinfo('ocean_v_2017_09.nc');
BRAN_V_lon=ncread(ocean_v_info_1.Filename,ocean_v_info_1.Variables(1).Name);
BRAN_V_lat=ncread(ocean_v_info_1.Filename,ocean_v_info_1.Variables(2).Name);

BRAN_V_lon_GBA=BRAN_V_lon(BRAN_V_lon<115.8 & BRAN_V_lon>111.5);

BRAN_V_lon_1_GBA=find(BRAN_V_lon==BRAN_V_lon_GBA(1))-1;
BRAN_V_lon_2_GBA=find(BRAN_V_lon==BRAN_V_lon_GBA(end));
BRAN_V_lon_GBA_size=BRAN_V_lon_2_GBA-BRAN_V_lon_1_GBA+1;

BRAN_V_lat_GBA=BRAN_V_lat(BRAN_V_lat<23.6& BRAN_V_lat>21.3);

BRAN_V_lat_1_GBA=find(BRAN_V_lat==BRAN_V_lat_GBA(1))-1;
BRAN_V_lat_2_GBA=find(BRAN_V_lat==BRAN_V_lat_GBA(end));
BRAN_V_lat_GBA_size=BRAN_V_lat_2_GBA-BRAN_V_lat_1_GBA+1;

BRAN_V_lon_GBA_full=BRAN_V_lon(BRAN_V_lon_1_GBA:BRAN_V_lon_2_GBA);
BRAN_V_lat_GBA_full=BRAN_V_lat(BRAN_V_lat_1_GBA:BRAN_V_lat_2_GBA);

% 'tcell zstar depth edges' (meter) start depth of each vertical layer
Z_edge_V=ncread(ocean_v_info_1.Filename,ocean_v_info_1.Variables(6).Name);

% 'tcell depth edges' (meter) middle depth of each vertical layer
Z_middle_V=ncread(ocean_v_info_1.Filename,ocean_v_info_2.Variables(3).Name);

% 'sea_water_y_velocity' ('m/sec')
Depth_V=zeros(BRAN_V_lon_GBA_size,BRAN_V_lat_GBA_size,length(Z_middle_V), Day_length);
Depth_V(:,:,:,1:2)=ncread(ocean_v_info_1.Filename,ocean_v_info_1.Variables(11).Name,[BRAN_V_lon_1_GBA BRAN_V_lat_1_GBA 1 30],...
    [BRAN_V_lon_GBA_size  BRAN_V_lat_GBA_size inf 2]);
Depth_V(:,:,:,3:end)=ncread(ocean_v_info_2.Filename,ocean_v_info_2.Variables(11).Name,[BRAN_V_lon_1_GBA BRAN_V_lat_1_GBA  1 1],...
    [BRAN_V_lon_GBA_size  BRAN_V_lat_GBA_size inf 29]);
Depth_V=Depth_V.*MASK_U;


%% 

ocean_w_info_1=ncinfo('ocean_w_2017_08.nc');
ocean_w_info_2=ncinfo('ocean_w_2017_09.nc');

BRAN_W_lon=ncread(ocean_w_info_1.Filename,ocean_w_info_1.Variables(1).Name);
BRAN_W_lat=ncread(ocean_w_info_1.Filename,ocean_w_info_1.Variables(2).Name);

BRAN_W_lon_GBA=BRAN_W_lon(BRAN_W_lon<=115.8 & BRAN_W_lon>=111.6);

BRAN_W_lon_1_GBA=find(BRAN_W_lon==BRAN_W_lon_GBA(1))-1;
BRAN_W_lon_2_GBA=find(BRAN_W_lon==BRAN_W_lon_GBA(end));
BRAN_W_lon_GBA_size=BRAN_W_lon_2_GBA-BRAN_W_lon_1_GBA+1;

BRAN_W_lat_GBA=BRAN_W_lat(BRAN_W_lat<=23.6& BRAN_W_lat>=21.4);

BRAN_W_lat_1_GBA=find(BRAN_W_lat==BRAN_W_lat_GBA(1))-1;
BRAN_W_lat_2_GBA=find(BRAN_W_lat==BRAN_W_lat_GBA(end));
BRAN_W_lat_GBA_size=BRAN_W_lat_2_GBA-BRAN_W_lat_1_GBA+1;

BRAN_W_lon_GBA_full=BRAN_W_lon(BRAN_W_lon_1_GBA:BRAN_W_lon_2_GBA);
BRAN_W_lat_GBA_full=BRAN_W_lat(BRAN_W_lat_1_GBA:BRAN_W_lat_2_GBA);

% 'tcell zstar depth edges' (meter) start depth of each vertical layer
Z_edge_W=ncread(ocean_w_info_1.Filename,ocean_w_info_1.Variables(6).Name);

% 'tcell depth edges' (meter) middle depth of each vertical layer
Z_middle_W=ncread(ocean_w_info_1.Filename,ocean_w_info_1.Variables(3).Name);

% 'dia-surface velocity T-points'  ('m/sec')
Depth_W=zeros(BRAN_W_lon_GBA_size,BRAN_W_lat_GBA_size,length(Z_middle_W), Day_length);
Depth_W(:,:,:,1:2)=ncread(ocean_w_info_1.Filename,ocean_w_info_1.Variables(11).Name,[BRAN_W_lon_1_GBA BRAN_W_lat_1_GBA 1 30],...
    [BRAN_W_lon_GBA_size  BRAN_W_lat_GBA_size inf 2]);
Depth_W(:,:,:,3:end)=ncread(ocean_w_info_2.Filename,ocean_w_info_2.Variables(11).Name,[BRAN_W_lon_1_GBA BRAN_W_lat_1_GBA  1 1],...
    [BRAN_W_lon_GBA_size  BRAN_W_lat_GBA_size inf 29]);
Depth_W=Depth_W.*MASK_T;

%% ML Heat budget analysis for the entire Shark Bay withpenetrate shortwave flux at the bottom of the ML
% mean vertical ML temperature are weighted by the depth of each layer ( Ref: Huang, Z., Feng, M., Dalton, S. J., & Carroll, A. G. (2024)
% Marine heatwaves in the Great Barrier Reef and Coral Sea: their mechanisms and impacts on shallow and mesophotic coral 
% ecosystems. Science of The Total Environment, 908, 168063. https://doi.org/https://doi.org/10.1016/j.scitotenv.2023.168063) 

Mean_density=1025; % kg/m^3 

% avearge value of 1020-1030 kg/m^3 
% (Ref. Brown, W. S. (2016). Physical Properties of Seawater. 
% In M. R. Dhanak & N. I. Xiros (Eds.), Springer Handbook of Ocean Engineering (pp. 101-110). 
% Springer International Publishing. 
% https://doi.org/10.1007/978-3-319-16649-0_5 )

Heat_capacity=3996.2; % J/(kg*K)
% Specific capacity of sea water at 25 °C temperature and 35 ‰ salinity
% Ref. Table 7 from Millero, F. J., Perron, G., & Desnoyers, J. E. (1973). Heat capacity of seawater solutions from 5° to 35°C and 0.5 to 22‰ chlorinity. 
% Journal of Geophysical Research (1896-1977), 78(21), 4499-4507. https://doi.org/https://doi.org/10.1029/JC078i021p04499 

% basic heat budget that include on the ML tendency, heat flux and
% horizontal advection
% Ref. Moisan, J. R., & Niiler, P. P. (1998). The Seasonal Heat Budget of the North Pacific: Net Heat Flux and Heat Storage Rates 
% (1950–1990). Journal of Physical Oceanography, 28(3), 401-421. https://doi.org/https://doi.org/10.1175/1520-0485(1998)028<0401:TSHBOT>2.0.CO;2 


Z_layer_interval_T=Z_edge_T(2:end)-Z_edge_T(1:end-1);
Z_layer_interval_W=Z_edge_W(2:end)-Z_edge_W(1:end-1);

MLD_T_layer=zeros(BRAN_DT_lon_GBA_size, BRAN_DT_lat_GBA_size,Day_length);
MLD_U_layer=zeros(BRAN_DT_lon_GBA_size, BRAN_DT_lat_GBA_size,Day_length);
ML_T_MEAN=zeros(BRAN_DT_lon_GBA_size, BRAN_DT_lat_GBA_size,Day_length);
ML_U_MEAN=zeros(BRAN_U_lon_GBA_size, BRAN_U_lat_GBA_size,Day_length);
ML_V_MEAN=zeros(BRAN_V_lon_GBA_size, BRAN_V_lat_GBA_size,Day_length);
ML_W_MEAN=zeros(BRAN_W_lon_GBA_size, BRAN_W_lat_GBA_size,Day_length);
ML_U_BOTTOM=zeros(BRAN_U_lon_GBA_size, BRAN_U_lat_GBA_size,Day_length);
ML_V_BOTTOM=zeros(BRAN_V_lon_GBA_size, BRAN_V_lat_GBA_size,Day_length);
ML_W_BOTTOM=zeros(BRAN_W_lon_GBA_size, BRAN_W_lat_GBA_size,Day_length);
ML_T_BOTTOM=zeros(BRAN_DT_lon_GBA_size, BRAN_DT_lat_GBA_size,Day_length);
SEA_BOTTOM_Depth=zeros(BRAN_DT_lon_GBA_size, BRAN_DT_lat_GBA_size);

for lon_order=1 :BRAN_T_lon_GBA_size
    
    for lat_order=1 :BRAN_T_lat_GBA_size
        
        if MASK_T(lon_order,lat_order)==1
            
            Depth_T_bottom=squeeze(Depth_T(lon_order,lat_order,:,1));
            ML_depth_T=squeeze(ML_depth(lon_order,lat_order,:));
            SEA_BOTTOM_Depth(lon_order,lat_order)=Z_edge_T(find(isnan(Depth_T_bottom)==1,1));
            
            for day_order=1 :Day_length
                ML_T_temp=squeeze(Depth_T(lon_order,lat_order,:,day_order));
               
                ML_W_temp=squeeze(Depth_W(lon_order,lat_order,:,day_order));
                
                MLD_T_layer_temp=dsearchn(Z_edge_T(2:end),ML_depth_T(day_order));
                
                MLD_T_layer(lon_order,lat_order,day_order)=MLD_T_layer_temp;
                if isnan(ML_T_temp(1:MLD_T_layer_temp))
                    disp('NaN')
                end
                ML_T_MEAN(lon_order,lat_order,day_order)=sum((ML_T_temp(1:MLD_T_layer_temp).*Z_layer_interval_T(1:MLD_T_layer_temp)))./...
                    sum(Z_layer_interval_T(1:MLD_T_layer_temp));
                
                ML_W_MEAN(lon_order,lat_order,day_order)=sum((ML_W_temp(1:MLD_T_layer_temp).*Z_layer_interval_W(1:MLD_T_layer_temp)),'omitnan')./...
                    sum(Z_layer_interval_W(1:MLD_T_layer_temp));
                
                if isnan(ML_T_temp(MLD_T_layer_temp+1))
                    
                    ML_W_BOTTOM(lon_order,lat_order,day_order)=ML_W_temp(MLD_T_layer_temp);
                    ML_T_BOTTOM(lon_order,lat_order,day_order)=ML_T_temp(MLD_T_layer_temp);
                    
                else
                    
                    ML_W_BOTTOM(lon_order,lat_order,day_order)=ML_W_temp(MLD_T_layer_temp+1);
                    ML_T_BOTTOM(lon_order,lat_order,day_order)=ML_T_temp(MLD_T_layer_temp+1);
                    
                end
            end
        else
            MLD_T_layer(lon_order,lat_order,:)=NaN;
            
            ML_T_MEAN(lon_order,lat_order,:)=NaN;
            
            ML_W_MEAN(lon_order,lat_order,:)=NaN;
            
            ML_W_BOTTOM(lon_order,lat_order,:)=NaN;
            
            ML_T_BOTTOM(lon_order,lat_order,:)=NaN;
            
            SEA_BOTTOM_Depth(lon_order,lat_order)=NaN;
            
        end
      
        if MASK_U(lon_order,lat_order)==1


            ML_depth_T=squeeze(ML_depth(lon_order,lat_order,:));


            for day_order=1 : Day_length

                ML_U_temp=squeeze(Depth_U(lon_order,lat_order,:,day_order));

                ML_V_temp=squeeze(Depth_V(lon_order,lat_order,:,day_order));


                MLD_T_layer_temp=dsearchn(Z_middle_U(1:end),ML_depth_T(day_order));

                MLD_U_layer(lon_order,lat_order,day_order)=MLD_T_layer_temp;

                U_temp=ML_U_temp(1:MLD_T_layer_temp);

                V_temp=ML_V_temp(1:MLD_T_layer_temp);

                Z_interval_T_temp=Z_layer_interval_T(1:MLD_T_layer_temp);

                ML_U_MEAN(lon_order,lat_order,day_order)=sum((ML_U_temp(1:MLD_T_layer_temp).*Z_layer_interval_T(1:MLD_T_layer_temp)),'omitnan')./...
                    sum(Z_interval_T_temp(~isnan(U_temp)));

                ML_V_MEAN(lon_order,lat_order,day_order)=sum((ML_V_temp(1:MLD_T_layer_temp).*Z_layer_interval_T(1:MLD_T_layer_temp)),'omitnan')./...
                    sum(Z_interval_T_temp(~isnan(V_temp)));

                if isnan(ML_U_temp(MLD_T_layer_temp+1))

                    ML_U_BOTTOM(lon_order,lat_order,day_order)=ML_U_temp(MLD_T_layer_temp);

                    ML_V_BOTTOM(lon_order,lat_order,day_order)=ML_V_temp(MLD_T_layer_temp);

                else

                    ML_U_BOTTOM(lon_order,lat_order,day_order)=ML_U_temp(MLD_T_layer_temp+1);

                    ML_V_BOTTOM(lon_order,lat_order,day_order)=ML_V_temp(MLD_T_layer_temp+1);

                end
            end

        else

            ML_U_MEAN(lon_order,lat_order,:)=NaN;

            ML_V_MEAN(lon_order,lat_order,:)=NaN;

            ML_U_BOTTOM(lon_order,lat_order,:)=NaN;

            ML_V_BOTTOM(lon_order,lat_order,:)=NaN;
            
            MLD_U_layer(lon_order,lat_order,:)=NaN;
        end
       

    end
end
%% Calculate each parameter in the heat budget equation  
% ML_T_tendency = Q_net./(Mean_density.*MLD.*Heat_capacity) -
% (ML_U_MEAN.*d_ML_T_MEAN_dX+ML_V_MEAN.*d_ML_T_MEAN_dY) + Residual
% Vijith, V., Vinayachandran, P.N., Webber, B.G.M. et al. Closing the sea surface mixed layer temperature budget from in situ observations alone: ...
% Operation Advection during BoBBLE. Sci Rep 10, 7062 (2020). https://doi.org/10.1038/s41598-020-63320-0

ML_T_tendency=zeros(BRAN_T_lon_GBA_size-1,BRAN_T_lat_GBA_size-1,Day_length-1);
for lon_order=2: BRAN_T_lon_GBA_size
    for lat_order=2: BRAN_T_lat_GBA_size
        if MASK_T(lon_order,lat_order)==1
            ML_T_tendency(lon_order-1,lat_order-1,:)=diff(squeeze(ML_T_MEAN(lon_order,lat_order,:))); % T_tendency(t)=T(t)-T(t-1);
        else
            ML_T_tendency(lon_order-1,lat_order-1,:)=NaN;
        end
    end
end

 Second_perday=24*3600;
 % contribution of Q_net on the temparature tendency (degree C/day)
 Q_net_term=(Q_lhf(2:end,2:end,2:end) + Q_shf(2:end,2:end,2:end) + Q_lwf(2:end,2:end,2:end) + Q_swf(2:end,2:end,2:end)+Q_pen(2:end,2:end,2:end))./...
     (Mean_density.*ML_depth(2:end,2:end,2:end).*Heat_capacity).*Second_perday.*MASK_U(2:end,2:end); 
 
 Q_lhf_term=(Q_lhf(2:end,2:end,2:end))./(Mean_density.*ML_depth(2:end,2:end,2:end).*Heat_capacity).*Second_perday.*MASK_U(2:end,2:end);
 Q_shf_term=(Q_shf(2:end,2:end,2:end))./(Mean_density.*ML_depth(2:end,2:end,2:end).*Heat_capacity).*Second_perday.*MASK_U(2:end,2:end);
 Q_lwf_term=(Q_lwf (2:end,2:end,2:end))./(Mean_density.*ML_depth(2:end,2:end,2:end).*Heat_capacity).*Second_perday.*MASK_U(2:end,2:end);
 Q_swf_term=(Q_swf(2:end,2:end,2:end))./(Mean_density.*ML_depth(2:end,2:end,2:end).*Heat_capacity).*Second_perday.*MASK_U(2:end,2:end);
 Q_pen_term=(Q_pen(2:end,2:end,2:end))./(Mean_density.*ML_depth(2:end,2:end,2:end).*Heat_capacity).*Second_perday.*MASK_U(2:end,2:end);

%% Differential dX and dY
 dX=zeros(BRAN_T_lon_GBA_size-1,BRAN_T_lat_GBA_size-1);
 dY=zeros(BRAN_T_lon_GBA_size-1,BRAN_T_lat_GBA_size-1);
 wgs84 = wgs84Ellipsoid("m");
 
 
 for lon_order=2: BRAN_T_lon_GBA_size
      for lat_order=2: BRAN_T_lat_GBA_size
         dY(lon_order-1,lat_order-1)=round(distance([BRAN_T_lat_GBA_full(lat_order-1),BRAN_T_lon_GBA_full(lon_order)],...
             [BRAN_T_lat_GBA_full(lat_order),BRAN_T_lon_GBA_full(lon_order)],wgs84)); % Distance between each latitude bin (meter)
         dX(lon_order-1,lat_order-1)=round(distance([BRAN_T_lat_GBA_full(lat_order),BRAN_T_lon_GBA_full(lon_order-1)],...
             [BRAN_T_lat_GBA_full(lat_order),BRAN_T_lon_GBA_full(lon_order)],wgs84)); % Distance between each longitude bin (meter)
      end
 end
 
 d_ML_T_MEAN_dLat=zeros(BRAN_T_lon_GBA_size-1,BRAN_T_lat_GBA_size-1,Day_length-1);
 d_ML_T_MEAN_dLon=zeros(BRAN_T_lon_GBA_size-1,BRAN_T_lat_GBA_size-1,Day_length-1);
 MASK_T_valid=MASK_T(2:end,2:end);
 %% dTdLon (degree C/m)
 for lat_order=2: BRAN_T_lat_GBA_size
     if MASK_T_valid(end,lat_order-1)==1 % Check this sentence!!! skip full land columns 
         for day_order=2:Day_length
             
             ML_T_MEAN_temp=squeeze(ML_T_MEAN(:,lat_order,day_order));
             
             dLon=squeeze(dX(:,lat_order-1));
             
             ML_T_MEAN_temp_mask=double(~isnan(ML_T_MEAN_temp));
             
             ML_T_MEAN_temp_mask_1=[0; ML_T_MEAN_temp_mask; 0]; % enlarge matirx
             
             Ocean_index=find(diff(ML_T_MEAN_temp_mask_1)==1); % find start date index
             
             ML_T_MEAN_temp_mask_2=[0; ML_T_MEAN_temp_mask_1(1:end-1)]; % find tail pixel
             
             ML_T_MEAN_temp_mask_3=[ML_T_MEAN_temp_mask_1(2:end); 0];  % find head pixel
             
             Ocean_length=find(ML_T_MEAN_temp_mask_2>ML_T_MEAN_temp_mask_1)-find(ML_T_MEAN_temp_mask_3>ML_T_MEAN_temp_mask_1)-1;
             
             % calculate ocean distance
             
             for i=1:length(Ocean_index)
                 d_ML_T_MEAN_dLon(Ocean_index(i): Ocean_index(i)+Ocean_length(i)-2,lat_order-1,day_order-1)=...
                     diff(ML_T_MEAN_temp(Ocean_index(i): Ocean_index(i)+Ocean_length(i)-1))./dLon(Ocean_index(i): Ocean_index(i)+Ocean_length(i)-2);
             end
             
         end
     else
         
         d_ML_T_MEAN_dLon(:,lat_order-1,:)=NaN;
         
     end
 end
 
 d_ML_T_MEAN_dLon=d_ML_T_MEAN_dLon.*MASK_U(2:end,2:end);
 
 %% dTdLat (degree C/m)
 for lon_order=2 : BRAN_T_lon_GBA_size
    
     if MASK_T_valid(lon_order-1,1)==1 % Check this sentence !!! skip full land rows 
         for day_order=2 :Day_length
             
             ML_T_MEAN_temp=squeeze(ML_T_MEAN(lon_order,:,day_order));
             
             dLat=squeeze(dY(lon_order-1,:));
             
             ML_T_MEAN_temp_mask=double(~isnan(ML_T_MEAN_temp));
             
             ML_T_MEAN_temp_mask_1=[0, ML_T_MEAN_temp_mask, 0]; % enlarge matirx
            
             Ocean_index=find(diff(ML_T_MEAN_temp_mask_1)==1); % find start date index
            
             ML_T_MEAN_temp_mask_2=[0, ML_T_MEAN_temp_mask_1(1:end-1)]; % find tail pixel
             
             ML_T_MEAN_temp_mask_3=[ML_T_MEAN_temp_mask_1(2:end), 0];  % find head pixel
             
             Ocean_length=find(ML_T_MEAN_temp_mask_2>ML_T_MEAN_temp_mask_1)-find(ML_T_MEAN_temp_mask_3>ML_T_MEAN_temp_mask_1)-1;
             % calculate ocean distance
            
             for i=1:length(Ocean_index)
                 
                 d_ML_T_MEAN_dLat(lon_order-1,Ocean_index(i): Ocean_index(i)+Ocean_length(i)-2,day_order-1)=...
                     diff(ML_T_MEAN_temp(Ocean_index(i): Ocean_index(i)+Ocean_length(i)-1))./dLat(Ocean_index(i): Ocean_index(i)+Ocean_length(i)-2);
             end
         end
     else 
         d_ML_T_MEAN_dLat(lon_order-1,:,:)=NaN;
     end
 end
 d_ML_T_MEAN_dLat=d_ML_T_MEAN_dLat.*MASK_U(2:end,2:end);
 %% Entarinment Term

 ML_D_tendency=zeros(BRAN_T_lon_GBA_size-1,BRAN_T_lat_GBA_size-1,Day_length-1);
 for lon_order=2: BRAN_T_lon_GBA_size
    for lat_order=2: BRAN_T_lat_GBA_size
        if MASK_T(lon_order,lat_order)==1
            ML_D_tendency(lon_order-1,lat_order-1,:)=diff(squeeze(ML_depth(lon_order,lat_order,:))); % Depth_tendency(t)=D(t)-D(t-1);
        else
            ML_D_tendency(lon_order-1,lat_order-1,:)=NaN;
        end
    end
end
  d_ML_D_dLat=zeros(BRAN_T_lon_GBA_size-1,BRAN_T_lat_GBA_size-1,Day_length-1);
 d_ML_D_dLon=zeros(BRAN_T_lon_GBA_size-1,BRAN_T_lat_GBA_size-1,Day_length-1);
%% dMLDdLon
 for lat_order=2: BRAN_T_lat_GBA_size
     if MASK_T_valid(end,lat_order-1)==1 % Check this sentence !!! skip full land columns
         for day_order=2:Day_length
             
             ML_D_temp=squeeze(ML_depth(:,lat_order,day_order));
             
             dLon=squeeze(dX(:,lat_order-1));
             
             ML_D_temp_mask=double(~isnan(ML_D_temp));
             
             ML_D_temp_mask_1=[0; ML_D_temp_mask; 0]; % enlarge matirx
             
             Ocean_index=find(diff(ML_D_temp_mask_1)==1); % find start date index
             
             ML_D_temp_mask_2=[0; ML_D_temp_mask_1(1:end-1)]; % find tail pixel
             
             ML_D_temp_mask_3=[ML_D_temp_mask_1(2:end); 0];  % find head pixel
             
             Ocean_length=find(ML_D_temp_mask_2>ML_D_temp_mask_1)-find(ML_D_temp_mask_3>ML_D_temp_mask_1)-1;
             
             % calculate ocean distance
             
             for i=1:length(Ocean_index)
                 d_ML_D_dLon(Ocean_index(i): Ocean_index(i)+Ocean_length(i)-2,lat_order-1,day_order-1)=...
                     diff(ML_D_temp(Ocean_index(i): Ocean_index(i)+Ocean_length(i)-1))./dLon(Ocean_index(i): Ocean_index(i)+Ocean_length(i)-2);
             end
             
         end
     else
         
         d_ML_D_dLon(:,lat_order-1,:)=NaN;
         
     end
 end
 
 d_ML_D_dLon=d_ML_D_dLon.*MASK_U(2:end,2:end);
 
 %% dMLDdLat (degree C/m)
 for lon_order=2 : BRAN_T_lon_GBA_size
    
     if MASK_T_valid(lon_order-1,1)==1 % Check this sentence !!! skip full land rows
         for day_order=2 :Day_length
             
             ML_D_temp=squeeze(ML_depth(lon_order,:,day_order));
             
             dLat=squeeze(dY(lon_order-1,:));
             
             ML_D_temp_mask=double(~isnan(ML_D_temp));
             
             ML_D_temp_mask_1=[0, ML_D_temp_mask, 0]; % enlarge matirx
            
             Ocean_index=find(diff(ML_D_temp_mask_1)==1); % find start date index
            
             ML_D_temp_mask_2=[0, ML_D_temp_mask_1(1:end-1)]; % find tail pixel
             
             ML_D_temp_mask_3=[ML_D_temp_mask_1(2:end), 0];  % find head pixel
             
             Ocean_length=find(ML_D_temp_mask_2>ML_D_temp_mask_1)-find(ML_D_temp_mask_3>ML_D_temp_mask_1)-1;
             % calculate ocean distance
            
             for i=1:length(Ocean_index)
                 
                 d_ML_D_dLat(lon_order-1,Ocean_index(i): Ocean_index(i)+Ocean_length(i)-2,day_order-1)=...
                     diff(ML_D_temp(Ocean_index(i): Ocean_index(i)+Ocean_length(i)-1))./dLat(Ocean_index(i): Ocean_index(i)+Ocean_length(i)-2);
             end
         end
     else 
         d_ML_D_dLat(lon_order-1,:,:)=NaN;
     end
 end
 d_ML_D_dLat=d_ML_D_dLat.*MASK_U(2:end,2:end); 
 %% Entraiment term -(Ta-T_-h)./MLD
 
 Delta_T_mean = - (ML_T_MEAN(2:end,2:end,2:end) - ML_T_BOTTOM(2:end,2:end,2:end))./ML_depth(2:end,2:end,2:end);
 ML_D_tendency_term = ML_D_tendency.*Delta_T_mean.*MASK_U(2:end,2:end); % with negative sign in the value
 Lateral_Induction_Lon = (ML_U_BOTTOM(2:end,2:end,2:end).*d_ML_D_dLon).*Delta_T_mean.*Second_perday; % with negative sign in the value
 Lateral_Induction_Lat = (ML_V_BOTTOM(2:end,2:end,2:end).*d_ML_D_dLat).*Delta_T_mean.*Second_perday; % with negative sign in the value 
 
 Lateral_Induction_term = Lateral_Induction_Lon + Lateral_Induction_Lat;
 Vetical_advection_term = ML_W_BOTTOM(2:end,2:end,2:end).*Delta_T_mean.*Second_perday; % with negative sign in the value 
 Entraiment_term = ML_D_tendency_term + Lateral_Induction_term + Vetical_advection_term;
 %% heat budget 


ML_T_tendency_Valid=ML_T_tendency.*MASK_U(2:end,2:end);
ML_Heat_Flux=Q_lhf_term+Q_shf_term+Q_lwf_term+Q_swf_term+Q_pen_term;
ML_Horizontal_advection_Lon=-(ML_U_MEAN(2:end,2:end,2:end).*d_ML_T_MEAN_dLon).*Second_perday;% with negitive sign as a whole term
ML_Horizontal_advection_Lat=-(ML_V_MEAN(2:end,2:end,2:end).*d_ML_T_MEAN_dLat).*Second_perday;
ML_Horizontal_advection_term=ML_Horizontal_advection_Lon+ML_Horizontal_advection_Lat;

Entraiment_term_fill = Entraiment_term;
Entraiment_term_fill(isnan(Entraiment_term_fill)) = 0;


ML_T_tendency_residual=ML_T_tendency_Valid - ML_Heat_Flux - ML_Horizontal_advection_term - Entraiment_term_fill.*MASK_U(2:end,2:end);

Volume_weight=repmat(dX.*dY.*MASK_U(2:end,2:end),1,1,30);

%% Spatial average of each term

ML_T_tendency_Valid_volume_weight_timeseries = squeeze(sum(ML_T_tendency_Valid.*Volume_weight,[1 2],'omitnan')./...
    sum(Volume_weight,[1 2],'omitnan'));

ML_Heat_Flux_volume_weight_timeseries = squeeze(sum(ML_Heat_Flux.*Volume_weight,[1 2],'omitnan')./sum(Volume_weight,[1 2],'omitnan'));

Q_lhf_term_volume_weight_timeseries = squeeze(sum(Q_lhf_term.*Volume_weight,[1 2],'omitnan')./sum(Volume_weight,[1 2],'omitnan'));

Q_shf_term_volume_weight_timeseries = squeeze(sum(Q_shf_term.*Volume_weight,[1 2],'omitnan')./sum(Volume_weight,[1 2],'omitnan'));

Q_lwf_term_volume_weight_timeseries = squeeze(sum(Q_lwf_term.*Volume_weight,[1 2],'omitnan')./sum(Volume_weight,[1 2],'omitnan'));

Q_swf_term_volume_weight_timeseries = squeeze(sum(Q_swf_term.*Volume_weight,[1 2],'omitnan')./sum(Volume_weight,[1 2],'omitnan'));

Q_pen_term_volume_weight_timeseries = squeeze(sum(Q_pen_term.*Volume_weight,[1 2],'omitnan')./sum(Volume_weight,[1 2],'omitnan'));

ML_D_tendency_term_volume_weight_timeseries = squeeze(sum(ML_D_tendency_term.*Volume_weight,[1 2],'omitnan')./sum(Volume_weight,[1 2],'omitnan'));

Lateral_Induction_term_volume_weight_timeseries = squeeze(sum(Lateral_Induction_term.*Volume_weight,[1 2],'omitnan')./sum(Volume_weight,[1 2],'omitnan'));

Lateral_Induction_Lon_volume_weight_timeseries = squeeze(sum(Lateral_Induction_Lon.*Volume_weight,[1 2],'omitnan')./sum(Volume_weight,[1 2],'omitnan'));

Lateral_Induction_Lat_volume_weight_timeseries = squeeze(sum(Lateral_Induction_Lat.*Volume_weight,[1 2],'omitnan')./sum(Volume_weight,[1 2],'omitnan'));

Vetical_advection_term_volume_weight_timeseries = squeeze(sum(Vetical_advection_term.*Volume_weight,[1 2],'omitnan')./sum(Volume_weight,[1 2],'omitnan'));

Entraiment_term_volume_weight_timeseries = squeeze(sum(Entraiment_term.*Volume_weight,[1 2],'omitnan')./sum(Volume_weight,[1 2],'omitnan'));


ML_Horizontal_advection_Lon_volume_weight_timeseries = squeeze(sum(ML_Horizontal_advection_Lon.*Volume_weight,[1 2],'omitnan')./...
    sum(Volume_weight,[1 2],'omitnan'));

ML_Horizontal_advection_Lat_volume_weight_timeseries = squeeze(sum(ML_Horizontal_advection_Lat.*Volume_weight,[1 2],'omitnan')./...
    sum(Volume_weight,[1 2],'omitnan'));

ML_Horizontal_advection_term_volume_weight_timeseries = squeeze(sum(ML_Horizontal_advection_term.*Volume_weight,[1 2],'omitnan')./...
    sum(Volume_weight,[1 2],'omitnan'));

ML_Residual_term_volume_weight_timeseries = ML_T_tendency_Valid_volume_weight_timeseries - ML_Heat_Flux_volume_weight_timeseries - ...
    ML_Horizontal_advection_term_volume_weight_timeseries - Entraiment_term_volume_weight_timeseries;
%% Domian average  of each term
ML_T_tendency_Valid_volume_weight = squeeze(sum(ML_T_tendency_Valid.*Volume_weight,'all','omitnan')./sum(Volume_weight,'all','omitnan'));

ML_Heat_Flux_volume_weight = squeeze(sum(ML_Heat_Flux.*Volume_weight,'all','omitnan')./sum(Volume_weight,'all','omitnan'));

Q_lhf_term_volume_weight = squeeze(sum(Q_lhf_term.*Volume_weight,'all','omitnan')./sum(Volume_weight,'all','omitnan'));

Q_shf_term_volume_weight = squeeze(sum(Q_shf_term.*Volume_weight,'all','omitnan')./sum(Volume_weight,'all','omitnan'));

Q_lwf_term_volume_weight = squeeze(sum(Q_lwf_term.*Volume_weight,'all','omitnan')./sum(Volume_weight,'all','omitnan'));

Q_swf_term_volume_weight = squeeze(sum(Q_swf_term.*Volume_weight,'all','omitnan')./sum(Volume_weight,'all','omitnan'));

Q_pen_term_volume_weight = squeeze(sum(Q_pen_term.*Volume_weight,'all','omitnan')./sum(Volume_weight,'all','omitnan'));

ML_D_tendency_term_volume_weight = squeeze(sum(ML_D_tendency_term.*Volume_weight,'all','omitnan')./sum(Volume_weight,'all','omitnan'));

Lateral_Induction_term_volume_weight= squeeze(sum(Lateral_Induction_term.*Volume_weight,'all','omitnan')./sum(Volume_weight,'all','omitnan'));

Lateral_Induction_Lon_volume_weight= squeeze(sum(Lateral_Induction_Lon.*Volume_weight,'all','omitnan')./sum(Volume_weight,'all','omitnan'));

Lateral_Induction_Lat_volume_weight= squeeze(sum(Lateral_Induction_Lat.*Volume_weight,'all','omitnan')./sum(Volume_weight,'all','omitnan'));

Vetical_advection_term_volume_weight= squeeze(sum(Vetical_advection_term.*Volume_weight,'all','omitnan')./sum(Volume_weight,'all','omitnan'));

Entraiment_term_volume_weight= squeeze(sum(Entraiment_term.*Volume_weight,'all','omitnan')./sum(Volume_weight,'all','omitnan'));


ML_Horizontal_advection_Lon_volume_weight = squeeze(sum(ML_Horizontal_advection_Lon.*Volume_weight,'all','omitnan')./...
    sum(Volume_weight,'all','omitnan'));

ML_Horizontal_advection_Lat_volume_weight = squeeze(sum(ML_Horizontal_advection_Lat.*Volume_weight,'all','omitnan')./...
    sum(Volume_weight,'all','omitnan'));

ML_Horizontal_advection_term_volume_weight = squeeze(sum(ML_Horizontal_advection_term.*Volume_weight,'all','omitnan')./...
    sum(Volume_weight,'all','omitnan'));

ML_Residual_term_volume_weight= ML_T_tendency_Valid_volume_weight - ML_Heat_Flux_volume_weight - ...
    ML_Horizontal_advection_term_volume_weight - Entraiment_term_volume_weight;

%% Spatial average of each term over shallow region <= 50m
MASK_Shallow_50m=SEA_BOTTOM_Depth(2:end,2:end).*MASK_U(2:end,2:end);

MASK_Shallow_50m(MASK_Shallow_50m>50)=NaN;

MASK_Shallow_50m(MASK_Shallow_50m<=50)=1;

MASK_Shallow_50m=repmat(MASK_Shallow_50m,1,1,30);

ML_T_tendency_Valid_volume_weight_timeseries_S = squeeze(sum(ML_T_tendency_Valid.*Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan'));

ML_Heat_Flux_volume_weight_timeseries_S = squeeze(sum(ML_Heat_Flux.*Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan'));

Q_lhf_term_volume_weight_timeseries_S = squeeze(sum(Q_lhf_term.*Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan'));

Q_shf_term_volume_weight_timeseries_S = squeeze(sum(Q_shf_term.*Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan')./...
sum(Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan'));

Q_lwf_term_volume_weight_timeseries_S = squeeze(sum(Q_lwf_term.*Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan'));

Q_swf_term_volume_weight_timeseries_S = squeeze(sum(Q_swf_term.*Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan'));

Q_pen_term_volume_weight_timeseries_S = squeeze(sum(Q_pen_term.*Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan'));

ML_D_tendency_term_volume_weight_timeseries_S = squeeze(sum(ML_D_tendency_term.*Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan'));

Lateral_Induction_term_volume_weight_timeseries_S = squeeze(sum(Lateral_Induction_term.*Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan'));

Lateral_Induction_Lon_volume_weight_timeseries_S = squeeze(sum(Lateral_Induction_Lon.*Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan'));

Lateral_Induction_Lat_volume_weight_timeseries_S = squeeze(sum(Lateral_Induction_Lat.*Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan'));

Vetical_advection_term_volume_weight_timeseries_S = squeeze(sum(Vetical_advection_term.*Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan'));

Entraiment_term_volume_weight_timeseries_S = squeeze(sum(Entraiment_term.*Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan'));


ML_Horizontal_advection_Lon_volume_weight_timeseries_S = squeeze(sum(ML_Horizontal_advection_Lon.*Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan'));

ML_Horizontal_advection_Lat_volume_weight_timeseries_S = squeeze(sum(ML_Horizontal_advection_Lat.*Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan'));

ML_Horizontal_advection_term_volume_weight_timeseries_S = squeeze(sum(ML_Horizontal_advection_term.*Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,[1 2],'omitnan'));

ML_Residual_term_volume_weight_timeseries_S = ML_T_tendency_Valid_volume_weight_timeseries_S - ML_Heat_Flux_volume_weight_timeseries_S - ...
    ML_Horizontal_advection_term_volume_weight_timeseries_S - Entraiment_term_volume_weight_timeseries_S;
%% Spatial average of each term over deep region > 50m

MASK_Deep_50m=SEA_BOTTOM_Depth(2:end,2:end).*MASK_U(2:end,2:end);

MASK_Deep_50m(MASK_Deep_50m<=50)=NaN;

MASK_Deep_50m(MASK_Deep_50m>50)=1;

MASK_Deep_50m=repmat(MASK_Deep_50m,1,1,30);

ML_T_tendency_Valid_volume_weight_timeseries_D = squeeze(sum(ML_T_tendency_Valid.*Volume_weight.*MASK_Deep_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,[1 2],'omitnan'));

ML_Heat_Flux_volume_weight_timeseries_D = squeeze(sum(ML_Heat_Flux.*Volume_weight.*MASK_Deep_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,[1 2],'omitnan'));

Q_lhf_term_volume_weight_timeseries_D = squeeze(sum(Q_lhf_term.*Volume_weight.*MASK_Deep_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,[1 2],'omitnan'));

Q_shf_term_volume_weight_timeseries_D = squeeze(sum(Q_shf_term.*Volume_weight.*MASK_Deep_50m,[1 2],'omitnan')./...
sum(Volume_weight.*MASK_Deep_50m,[1 2],'omitnan'));

Q_lwf_term_volume_weight_timeseries_D = squeeze(sum(Q_lwf_term.*Volume_weight.*MASK_Deep_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,[1 2],'omitnan'));

Q_swf_term_volume_weight_timeseries_D = squeeze(sum(Q_swf_term.*Volume_weight.*MASK_Deep_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,[1 2],'omitnan'));

Q_pen_term_volume_weight_timeseries_D = squeeze(sum(Q_pen_term.*Volume_weight.*MASK_Deep_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,[1 2],'omitnan'));

ML_D_tendency_term_volume_weight_timeseries_D = squeeze(sum(ML_D_tendency_term.*Volume_weight.*MASK_Deep_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,[1 2],'omitnan'));

Lateral_Induction_term_volume_weight_timeseries_D = squeeze(sum(Lateral_Induction_term.*Volume_weight.*MASK_Deep_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,[1 2],'omitnan'));

Lateral_Induction_Lon_volume_weight_timeseries_D = squeeze(sum(Lateral_Induction_Lon.*Volume_weight.*MASK_Deep_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,[1 2],'omitnan'));

Lateral_Induction_Lat_volume_weight_timeseries_D = squeeze(sum(Lateral_Induction_Lat.*Volume_weight.*MASK_Deep_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,[1 2],'omitnan'));

Vetical_advection_term_volume_weight_timeseries_D = squeeze(sum(Vetical_advection_term.*Volume_weight.*MASK_Deep_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,[1 2],'omitnan'));

Entraiment_term_volume_weight_timeseries_D = squeeze(sum(Entraiment_term.*Volume_weight.*MASK_Deep_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,[1 2],'omitnan'));


ML_Horizontal_advection_Lon_volume_weight_timeseries_D = squeeze(sum(ML_Horizontal_advection_Lon.*Volume_weight.*MASK_Deep_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,[1 2],'omitnan'));

ML_Horizontal_advection_Lat_volume_weight_timeseries_D = squeeze(sum(ML_Horizontal_advection_Lat.*Volume_weight.*MASK_Deep_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,[1 2],'omitnan'));

ML_Horizontal_advection_term_volume_weight_timeseries_D = squeeze(sum(ML_Horizontal_advection_term.*Volume_weight.*MASK_Deep_50m,[1 2],'omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,[1 2],'omitnan'));

ML_Residual_term_volume_weight_timeseries_D = ML_T_tendency_Valid_volume_weight_timeseries_D - ML_Heat_Flux_volume_weight_timeseries_D - ...
    ML_Horizontal_advection_term_volume_weight_timeseries_D - Entraiment_term_volume_weight_timeseries_D;

%% Domian average  of each term over shallow region <= 50m
ML_T_tendency_Valid_volume_weight_S = squeeze(sum(ML_T_tendency_Valid.*Volume_weight.*MASK_Shallow_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,'all','omitnan'));

ML_Heat_Flux_volume_weight_S = squeeze(sum(ML_Heat_Flux.*Volume_weight.*MASK_Shallow_50m,'all','omitnan')./...
sum(Volume_weight.*MASK_Shallow_50m,'all','omitnan'));

Q_lhf_term_volume_weight_S = squeeze(sum(Q_lhf_term.*Volume_weight.*MASK_Shallow_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,'all','omitnan'));

Q_shf_term_volume_weight_S = squeeze(sum(Q_shf_term.*Volume_weight.*MASK_Shallow_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,'all','omitnan'));

Q_lwf_term_volume_weight_S = squeeze(sum(Q_lwf_term.*Volume_weight.*MASK_Shallow_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,'all','omitnan'));

Q_swf_term_volume_weight_S = squeeze(sum(Q_swf_term.*Volume_weight.*MASK_Shallow_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,'all','omitnan'));

Q_pen_term_volume_weight_S = squeeze(sum(Q_pen_term.*Volume_weight.*MASK_Shallow_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,'all','omitnan'));

ML_D_tendency_term_volume_weight_S = squeeze(sum(ML_D_tendency_term.*Volume_weight.*MASK_Shallow_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,'all','omitnan'));

Lateral_Induction_term_volume_weight_S = squeeze(sum(Lateral_Induction_term.*Volume_weight.*MASK_Shallow_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,'all','omitnan'));

Lateral_Induction_Lon_volume_weight_S = squeeze(sum(Lateral_Induction_Lon.*Volume_weight.*MASK_Shallow_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,'all','omitnan'));

Lateral_Induction_Lat_volume_weight_S = squeeze(sum(Lateral_Induction_Lat.*Volume_weight.*MASK_Shallow_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,'all','omitnan'));

Vetical_advection_term_volume_weight_S = squeeze(sum(Vetical_advection_term.*Volume_weight.*MASK_Shallow_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,'all','omitnan'));

Entraiment_term_volume_weight_S = squeeze(sum(Entraiment_term.*Volume_weight.*MASK_Shallow_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,'all','omitnan'));


ML_Horizontal_advection_Lon_volume_weight_S = squeeze(sum(ML_Horizontal_advection_Lon.*Volume_weight.*MASK_Shallow_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,'all','omitnan'));

ML_Horizontal_advection_Lat_volume_weight_S = squeeze(sum(ML_Horizontal_advection_Lat.*Volume_weight.*MASK_Shallow_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,'all','omitnan'));

ML_Horizontal_advection_term_volume_weight_S = squeeze(sum(ML_Horizontal_advection_term.*Volume_weight.*MASK_Shallow_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Shallow_50m,'all','omitnan'));

ML_Residual_term_volume_weight_S= ML_T_tendency_Valid_volume_weight_S - ML_Heat_Flux_volume_weight_S - ...
    ML_Horizontal_advection_term_volume_weight_S - Entraiment_term_volume_weight_S;
%% Domian average  of each term over deep region >= 50m
ML_T_tendency_Valid_volume_weight_D = squeeze(sum(ML_T_tendency_Valid.*Volume_weight.*MASK_Deep_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,'all','omitnan'));

ML_Heat_Flux_volume_weight_D = squeeze(sum(ML_Heat_Flux.*Volume_weight.*MASK_Deep_50m,'all','omitnan')./...
sum(Volume_weight.*MASK_Deep_50m,'all','omitnan'));

Q_lhf_term_volume_weight_D = squeeze(sum(Q_lhf_term.*Volume_weight.*MASK_Deep_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,'all','omitnan'));

Q_shf_term_volume_weight_D = squeeze(sum(Q_shf_term.*Volume_weight.*MASK_Deep_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,'all','omitnan'));

Q_lwf_term_volume_weight_D = squeeze(sum(Q_lwf_term.*Volume_weight.*MASK_Deep_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,'all','omitnan'));

Q_swf_term_volume_weight_D = squeeze(sum(Q_swf_term.*Volume_weight.*MASK_Deep_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,'all','omitnan'));

Q_pen_term_volume_weight_D = squeeze(sum(Q_pen_term.*Volume_weight.*MASK_Deep_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,'all','omitnan'));

ML_D_tendency_term_volume_weight_D = squeeze(sum(ML_D_tendency_term.*Volume_weight.*MASK_Deep_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,'all','omitnan'));

Lateral_Induction_term_volume_weight_D = squeeze(sum(Lateral_Induction_term.*Volume_weight.*MASK_Deep_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,'all','omitnan'));

Lateral_Induction_Lon_volume_weight_D = squeeze(sum(Lateral_Induction_Lon.*Volume_weight.*MASK_Deep_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,'all','omitnan'));

Lateral_Induction_Lat_volume_weight_D = squeeze(sum(Lateral_Induction_Lat.*Volume_weight.*MASK_Deep_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,'all','omitnan'));

Vetical_advection_term_volume_weight_D = squeeze(sum(Vetical_advection_term.*Volume_weight.*MASK_Deep_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,'all','omitnan'));

Entraiment_term_volume_weight_D = squeeze(sum(Entraiment_term.*Volume_weight.*MASK_Deep_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,'all','omitnan'));


ML_Horizontal_advection_Lon_volume_weight_D = squeeze(sum(ML_Horizontal_advection_Lon.*Volume_weight.*MASK_Deep_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,'all','omitnan'));

ML_Horizontal_advection_Lat_volume_weight_D = squeeze(sum(ML_Horizontal_advection_Lat.*Volume_weight.*MASK_Deep_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,'all','omitnan'));

ML_Horizontal_advection_term_volume_weight_D = squeeze(sum(ML_Horizontal_advection_term.*Volume_weight.*MASK_Deep_50m,'all','omitnan')./...
    sum(Volume_weight.*MASK_Deep_50m,'all','omitnan'));

ML_Residual_term_volume_weight_D= ML_T_tendency_Valid_volume_weight_D - ML_Heat_Flux_volume_weight_D - ...
    ML_Horizontal_advection_term_volume_weight_D - Entraiment_term_volume_weight_D;
%% map of time mean heat budget 
ML_T_tendency_Valid_volume_weight_map = squeeze(sum(ML_T_tendency_Valid.*Volume_weight,[3],'omitnan')./...
    sum(Volume_weight,[3],'omitnan'));

ML_Heat_Flux_volume_weight_map = squeeze(sum(ML_Heat_Flux.*Volume_weight,[3],'omitnan')./sum(Volume_weight,[3],'omitnan'));

Q_lhf_term_volume_weight_map = squeeze(sum(Q_lhf_term.*Volume_weight,[3],'omitnan')./sum(Volume_weight,[3],'omitnan'));

Q_shf_term_volume_weight_map = squeeze(sum(Q_shf_term.*Volume_weight,[3],'omitnan')./sum(Volume_weight,[3],'omitnan'));

Q_lwf_term_volume_weight_map = squeeze(sum(Q_lwf_term.*Volume_weight,[3],'omitnan')./sum(Volume_weight,[3],'omitnan'));

Q_swf_term_volume_weight_map = squeeze(sum(Q_swf_term.*Volume_weight,[3],'omitnan')./sum(Volume_weight,[3],'omitnan'));

Q_pen_term_volume_weight_map = squeeze(sum(Q_pen_term.*Volume_weight,[3],'omitnan')./sum(Volume_weight,[3],'omitnan'));

ML_D_tendency_term_volume_weight_map = squeeze(sum(ML_D_tendency_term.*Volume_weight,[3],'omitnan')./sum(Volume_weight,[3],'omitnan'));

Lateral_Induction_term_volume_weight_map = squeeze(sum(Lateral_Induction_term.*Volume_weight,[3],'omitnan')./sum(Volume_weight,[3],'omitnan'));

Lateral_Induction_Lon_volume_weight_map = squeeze(sum(Lateral_Induction_Lon.*Volume_weight,[3],'omitnan')./sum(Volume_weight,[3],'omitnan'));

Lateral_Induction_Lat_volume_weight_map = squeeze(sum(Lateral_Induction_Lat.*Volume_weight,[3],'omitnan')./sum(Volume_weight,[3],'omitnan'));

Vetical_advection_term_volume_weight_map = squeeze(sum(Vetical_advection_term.*Volume_weight,[3],'omitnan')./sum(Volume_weight,[3],'omitnan'));

Entraiment_term_volume_weight_map = squeeze(sum(Entraiment_term.*Volume_weight,[3],'omitnan')./sum(Volume_weight,[3],'omitnan'));


ML_Horizontal_advection_Lon_volume_weight_map = squeeze(sum(ML_Horizontal_advection_Lon.*Volume_weight,[3],'omitnan')./...
    sum(Volume_weight,[3],'omitnan'));

ML_Horizontal_advection_Lat_volume_weight_map = squeeze(sum(ML_Horizontal_advection_Lat.*Volume_weight,[3],'omitnan')./...
    sum(Volume_weight,[3],'omitnan'));

ML_Horizontal_advection_term_volume_weight_map = squeeze(sum(ML_Horizontal_advection_term.*Volume_weight,[3],'omitnan')./...
    sum(Volume_weight,[3],'omitnan'));

ML_Residual_term_volume_weight_map = ML_T_tendency_Valid_volume_weight_map - ML_Heat_Flux_volume_weight_map - ...
    ML_Horizontal_advection_term_volume_weight_map - Entraiment_term_volume_weight_map;
%% map correlation coefficient
[Spatial_corr_Heat_Flux, Spatial_p_Heat_Flux]=corr(ML_T_tendency_Valid_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)),...
    ML_Heat_Flux_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)));

[Spatial_corr_Q_lhf,Spatial_p_Q_lhf]=corr(ML_T_tendency_Valid_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)),...
    Q_lhf_term_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)));

[Spatial_corr_Q_shf,Spatial_p_Q_shf]=corr(ML_T_tendency_Valid_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)),...
    Q_shf_term_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)));

[Spatial_corr_Q_lwf,Spatial_p_Q_lwf]=corr(ML_T_tendency_Valid_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)),...
    Q_lwf_term_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)));

[Spatial_corr_Q_swf,Spatial_p_Q_swf]=corr(ML_T_tendency_Valid_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)),...
    Q_swf_term_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)));

[Spatial_corr_Q_pen,Spatial_p_Q_pen]=corr(ML_T_tendency_Valid_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)),...
    Q_pen_term_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)));

[Spatial_corr_ML_D_tendency,Spatial_p_ML_D_tendency]=corr(ML_T_tendency_Valid_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)),...
    ML_D_tendency_term_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)));

[Spatial_corr_Lateral_Induction,Spatial_p_Lateral_Induction]=corr(ML_T_tendency_Valid_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)),...
    Lateral_Induction_term_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)));

[Spatial_corr_Lateral_Induction_Lon,Spatial_p_Lateral_Induction_Lon]=corr(ML_T_tendency_Valid_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)),...
    Lateral_Induction_Lon_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)));

[Spatial_corr_Lateral_Induction_Lat,Spatial_p_Lateral_Induction_Lat]=corr(ML_T_tendency_Valid_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)),...
    Lateral_Induction_Lat_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)));

[Spatial_corr_Vetical_advection,Spatial_p_Vetical_advection]=corr(ML_T_tendency_Valid_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)),...
    Vetical_advection_term_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)));

[Spatial_corr_Entraiment,Spatial_p_Entraiment]=corr(ML_T_tendency_Valid_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)),...
    Entraiment_term_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)));



[Spatial_corr_Advection,Spatial_p_Advection]=corr(ML_T_tendency_Valid_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)),...
    ML_Horizontal_advection_term_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)));

[Spatial_corr_Advection_Lon,Spatial_p_Advection_Lon]=corr(ML_T_tendency_Valid_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)),...
    ML_Horizontal_advection_Lon_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)));

[Spatial_corr_Advection_Lat,Spatial_p_Advection_Lat]=corr(ML_T_tendency_Valid_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)),...
    ML_Horizontal_advection_Lat_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)));

[Spatial_corr_Residual,Spatial_p_Residual]=corr(ML_T_tendency_Valid_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)),...
   ML_Residual_term_volume_weight_map(~isnan(ML_T_tendency_Valid_volume_weight_map)));

%% timeseries correlation coefficient of the whole domain
Timeseries_corr_Heat_Flux=corr(ML_T_tendency_Valid_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)),...
    ML_Heat_Flux_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)));

Timeseries_corr_Q_lhf=corr(ML_T_tendency_Valid_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)),...
    Q_lhf_term_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)));

Timeseries_corr_Q_shf=corr(ML_T_tendency_Valid_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)),...
    Q_shf_term_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)));

Timeseries_corr_Q_lwf=corr(ML_T_tendency_Valid_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)),...
    Q_lwf_term_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)));

Timeseries_corr_Q_swf=corr(ML_T_tendency_Valid_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)),...
    Q_swf_term_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)));

Timeseries_corr_Q_pen=corr(ML_T_tendency_Valid_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)),...
    Q_pen_term_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)));

Timeseries_corr_ML_D_tendency=corr(ML_T_tendency_Valid_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)),...
    ML_D_tendency_term_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)));

Timeseries_corr_Lateral_Induction=corr(ML_T_tendency_Valid_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)),...
    Lateral_Induction_term_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)));

Timeseries_corr_Lateral_Induction_Lon=corr(ML_T_tendency_Valid_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)),...
    Lateral_Induction_Lon_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)));

Timeseries_corr_Lateral_Induction_Lat=corr(ML_T_tendency_Valid_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)),...
    Lateral_Induction_Lat_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)));

Timeseries_corr_Vetical_advection=corr(ML_T_tendency_Valid_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)),...
    Vetical_advection_term_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)));

Timeseries_corr_Entraiment=corr(ML_T_tendency_Valid_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)),...
    Entraiment_term_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)));


Timeseries_corr_Advection=corr(ML_T_tendency_Valid_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)),...
    ML_Horizontal_advection_term_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)));

Timeseries_corr_Advection_Lon=corr(ML_T_tendency_Valid_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)),...
    ML_Horizontal_advection_Lon_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)));

Timeseries_corr_Advection_Lat=corr(ML_T_tendency_Valid_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)),...
    ML_Horizontal_advection_Lat_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)));

Timeseries_corr_Residual=corr(ML_T_tendency_Valid_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)),...
    ML_Residual_term_volume_weight_timeseries(~isnan(ML_T_tendency_Valid_volume_weight_timeseries)));
%% spatial mean temperature profile and time mean MLD
Avea_weight=dX.*dY.*MASK_U(2:end,2:end);
Temperature_profile_timeseries=zeros(23,30);
Mean_MLD_timseries=zeros(1,30);
for depth_order=1:23
for day_order=1:30
    MLT_temp=squeeze(Depth_T(2:end,2:end,depth_order,day_order+1));
    ML_depth_temp=squeeze(ML_depth(2:end,2:end,day_order+1));
    Temperature_profile_timeseries(depth_order,day_order)=squeeze(sum(MLT_temp.*Avea_weight,'all','omitnan')./...
        sum(Avea_weight(~isnan(MLT_temp)),'omitnan'));
    Mean_MLD_timseries(day_order)=squeeze(sum(ML_depth_temp.*Avea_weight,'all','omitnan')./...
        sum(Avea_weight(~isnan(ML_depth_temp)),'omitnan'));
end
end
%% spatial mean temperature profile and time mean MLD for shallow area =<50m
Avea_weight=dX.*dY.*MASK_Shallow_50m(:,:,1);
Temperature_profile_timeseries_shallow=zeros(23,30);
Mean_MLD_timseries_shallow=zeros(1,30);
for depth_order=1:23
    for day_order=1:30
        MLT_temp=squeeze(Depth_T(2:end,2:end,depth_order,day_order+1).*MASK_Shallow_50m(:,:,1));
        ML_depth_temp=squeeze(ML_depth(2:end,2:end,day_order+1).*MASK_Shallow_50m(:,:,1));
        Temperature_profile_timeseries_shallow(depth_order,day_order)=squeeze(sum(MLT_temp.*Avea_weight,'all','omitnan')./...
            sum(Avea_weight(~isnan(MLT_temp)),'omitnan'));
        Mean_MLD_timseries_shallow(day_order)=squeeze(sum(ML_depth_temp.*Avea_weight,'all','omitnan')./...
            sum(Avea_weight(~isnan(ML_depth_temp)),'omitnan'));
    end
end
%% spatial mean temperature profile and time mean MLD for deep area >50m
Avea_weight=dX.*dY.*MASK_Deep_50m(:,:,1);
Temperature_profile_timeseries_deep=zeros(23,30);
Mean_MLD_timseries_deep=zeros(1,30);
for depth_order=1:23
    for day_order=1:30
        MLT_temp=squeeze(Depth_T(2:end,2:end,depth_order,day_order+1).*MASK_Deep_50m(:,:,1));
        ML_depth_temp=squeeze(ML_depth(2:end,2:end,day_order+1).*MASK_Deep_50m(:,:,1));
        Temperature_profile_timeseries_deep(depth_order,day_order)=squeeze(sum(MLT_temp.*Avea_weight,'all','omitnan')./...
            sum(Avea_weight(~isnan(MLT_temp)),'omitnan'));
        Mean_MLD_timseries_deep(day_order)=squeeze(sum(ML_depth_temp.*Avea_weight,'all','omitnan')./...
            sum(Avea_weight(~isnan(ML_depth_temp)),'omitnan'));
    end
end

