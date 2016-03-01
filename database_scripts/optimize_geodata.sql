CREATE TABLE soil_moisture_grid_opt AS
       SELECT id, ST_Transform(geom_point, 990001) FROM soil_moisture_grid;

ALTER TABLE soil_moisture_grid_opt ADD PRIMARY KEY (id);

CREATE INDEX soil_moisture_grid_opt_gix ON soil_moisture_grid_opt 
       USING GIST (geom_point);

VACUUM ANALYZE soil_moisture_grid_opt;

CLUSTER soil_moisture_grid_opt USING soil_moisture_grid_opt_gix;

ANALYZE soil_moisture_grid_opt;

ALTER TABLE soil_moisture_data
SET (autovacuum_vacuum_scale_factor = 0.0);

ALTER TABLE soil_moisture_data  
SET (autovacuum_vacuum_threshold = 1000000);

ALTER TABLE soil_moisture_data  
SET (autovacuum_analyze_scale_factor = 0.0);

ALTER TABLE soil_moisture_data  
SET (autovacuum_vacuum_threshold = 1000000);
