delete from whse_basemapping.fwa_lakes_poly where watershed_group_code = :'wsg';

insert into whse_basemapping.fwa_lakes_poly (
  waterbody_poly_id,
  watershed_group_id,
  waterbody_type,
  waterbody_key,
  area_ha,
  gnis_id_1,
  gnis_name_1,
  gnis_id_2,
  gnis_name_2,
  gnis_id_3,
  gnis_name_3,
  blue_line_key,
  watershed_key,
  fwa_watershed_code,
  local_watershed_code,
  watershed_group_code,
  left_right_tributary,
  waterbody_key_50k,
  watershed_group_code_50k,
  waterbody_key_group_code_50k,
  watershed_code_50k,
  feature_code,
  geom
)
select
  waterbody_poly_id::integer as waterbody_poly_id,
  watershed_group_id::integer as watershed_group_id,
  waterbody_type,
  waterbody_key::integer as waterbody_key,
  area_ha::double precision as area_ha,
  gnis_id_1::integer as gnis_id_1,
  gnis_name_1,
  gnis_id_2::integer as gnis_id_2,
  gnis_name_2,
  gnis_id_3::integer as gnis_id_3,
  gnis_name_3,
  blue_line_key::integer as blue_line_key,
  watershed_key::integer as watershed_key,
  fwa_watershed_code,
  local_watershed_code,
  watershed_group_code,
  left_right_tributary,
  waterbody_key_50k::integer as waterbody_key_50k,
  watershed_group_code_50k,
  waterbody_key_group_code_50k,
  watershed_code_50k,
  feature_code,
  st_multi(geom) as geom
from fwapg.fwa_lakes_poly
where watershed_group_code = :'wsg';

