##create data schema. sql
##Stores daily climate data per greenhouse block
CREATE TABLE climate_logs (
  log_id INT,
  block_id INT,
  log_date DATE,
  avg_temp_c NUMERIC(4,1),
  humidity_pct NUMERIC(4,1),
  light_hours NUMERIC(4,1)
);
COPY climate_logs FROM 'climate_logs_large.csv' DELIMITER',' CSV HEADER;
## Climate stability analysis by greenhouse block
SELECT block_id,
       AVG(avg_temp_c) AS avg_temperature,
       STDDEV(avg_temp_c) AS temperature_variation
FROM climate_logs
GROUP BY block_id;
