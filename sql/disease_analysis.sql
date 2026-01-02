##Total Disease Impact
SELECT 
    SUM(plants_affected) AS total_plants_affected
FROM plant_health_records;

## Disease Impact by Disease Types
SELECT 
    disease_type,
    SUM(plants_affected) AS total_affected
FROM plant_health_records
GROUP BY disease_type
ORDER BY total_affected DESC;

##Disease Impact by growth stages
SELECT 
    stage_name,
    SUM(plants_affected) AS total_affected
FROM plant_health_records
GROUP BY stage_name
ORDER BY total_affected DESC;

##Disease severity analysis
SELECT 
    severity_level,
    COUNT(*) AS number_of_cases,
    SUM(plants_affected) AS total_affected
FROM plant_health_records
GROUP BY severity_level
ORDER BY total_affected DESC;

##Most affected plant variety
SELECT 
    plant_variety,
    SUM(plants_affected) AS total_affected
FROM plant_health_records
GROUP BY plant_variety
ORDER BY total_affected DESC;

##Greenhouse zone risk analysis
SELECT 
    greenhouse_zone,
    SUM(plants_affected) AS total_affected
FROM plant_health_records
GROUP BY greenhouse_zone
ORDER BY total_affected DESC;

##Monthly Disease Trend
SELECT 
    DATE_TRUNC('month', inspection_date) AS month,
    SUM(plants_affected) AS total_affected
FROM plant_health_records
GROUP BY month
ORDER BY month;

##Most Dangerous Diseases at each growth stage
SELECT DISTINCT ON (stage_name)
    stage_name,
    disease_type,
    SUM(plants_affected) AS total_affected
FROM plant_health_records
GROUP BY stage_name, disease_type
ORDER BY stage_name, total_affected DESC;

##High risk record tha need immidiate action
SELECT *
FROM plant_health_records
WHERE severity_level = 'High'
  AND plants_affected > 20
ORDER BY inspection_date DESC;
