
-- create table for deforestation alerts
BEGIN;
	CREATE TABLE alerts (
		id INTEGER PRIMARY KEY AUTOINCREMENT,
		ANO 	   integer,
		MES 	   integer,
		area_ha  real
	);
	SELECT AddGeometryColumn('alerts', 'Geometry', 4326, 'MULTIPOLYGON', 'XY');
	SELECT CreateSpatialIndex('alerts', 'Geometry');
	CREATE INDEX ano_alerts_index ON alerts (ano);
	CREATE INDEX mes_alerts_index ON alerts (mes);
	CREATE INDEX area_ha_alerts_index ON alerts (area_ha);
COMMIT;