delete from whse_basemapping.fwa_obstructions_sp where watershed_group_code = :'wsg';

insert into whse_basemapping.fwa_obstructions_sp (
  obstruction_id,
  watershed_group_id,
  linear_feature_id,
  gnis_id,
  gnis_name,
  obstruction_type,
  blue_line_key,
  watershed_key,
  fwa_watershed_code,
  local_watershed_code,
  watershed_group_code,
  route_measure,
  feature_source,
  feature_code,
  geom
)
select
  obstruction_id::integer as obstruction_id,
  watershed_group_id::integer as watershed_group_id,
  linear_feature_id::integer as linear_feature_id,
  gnis_id::integer as gnis_id,
  gnis_name,
  obstruction_type,
  blue_line_key::integer as blue_line_key,
  watershed_key::integer as watershed_key,
  fwa_watershed_code,
  local_watershed_code,
  watershed_group_code,
  route_measure::double precision as route_measure,
  feature_source,
  feature_code,
  (st_dump(geom)).geom as geom
from fwapg.fwa_obstructions_sp
where watershed_group_code = :'wsg';
