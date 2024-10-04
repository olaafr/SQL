
--Q5 What is the correlation between demo session engagement and conversion rates?


SELECT CORR(watched_percentage, converted) AS correlation_coefficient
FROM (
    SELECT 
        leads.lead_id, 
        demo.watched_percentage,
        MAX(CASE
            WHEN leads.lead_stage = 'conversion' THEN 1
            ELSE 0
        END) AS converted
    FROM leads_interaction_details leads
    LEFT JOIN leads_demo_watched_details demo 
        ON leads.lead_id = demo.lead_id
    WHERE demo.watched_percentage IS NOT NULL  -- Exclude NULL watched_percentage 
    GROUP BY leads.lead_id, demo.watched_percentage
) AS engagement_data;
