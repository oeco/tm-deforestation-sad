
-- parse 2007 data
insert into alerts (ano,mes,area_ha,Geometry) select ano, mes, round(area_km2_ * 100,2), Geometry from temp;
drop table temp; 