## Climate stability analysis by greenhouse block
SELECT block_id,
       AVG(avg_temp_c) AS avg_temperature,
       STDDEV(avg_temp_c) AS temperature_variation
FROM climate_logs
GROUP BY block_id;
