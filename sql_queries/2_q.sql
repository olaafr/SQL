-- Q2 2. Which junior sales managers have the highest and lowest call success rates (in terms of lead progressing to the next stage)? 

WITH StageCounts AS (
    SELECT 
        jnr_sm_id,
        lead_id,
        COUNT(DISTINCT lead_stage) AS num_stages
    FROM leads_interaction_details
    GROUP BY jnr_sm_id, lead_id
),
Conversions AS (
    SELECT
        jnr_sm_id,
        lead_id,
        CASE
            WHEN num_stages = 1 THEN 0
            WHEN num_stages = 2 THEN 1
            WHEN num_stages = 3 THEN 2
            WHEN num_stages = 4 THEN 3
            ELSE 0
        END AS conversions
    FROM StageCounts
)
SELECT
    jnr_sm_id,
    SUM(conversions) AS total_conversions
FROM Conversions
GROUP BY jnr_sm_id
ORDER BY total_conversions DESC;




