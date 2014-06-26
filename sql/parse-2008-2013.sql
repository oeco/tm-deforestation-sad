
-- parse 2007 data
insert into alerts (ano,mes,area_ha,Geometry) select ano, mes, round(area * 100,2), CastToMultiPolygon(CastToXY(Geometry)) from temp;
drop table temp;