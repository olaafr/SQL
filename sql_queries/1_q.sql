

--Q1 What is the conversion rate across different lead generation sources?
-- Lead Conversion rate = number of leads converted/ Number of Leads Generated) *100%


--STEP1 Filtering out Leads that were converted (using CTE)





WITH total_leads AS (
    SELECT 
        lead_gen_source,
        COUNT(*) AS sum_leads_generated
    FROM lead_basic_details
    INNER JOIN leads_interaction_details
        ON lead_basic_details.lead_id = leads_interaction_details.lead_id
    GROUP BY lead_gen_source
),
converted_leads AS (
    SELECT 
        lead_gen_source,
        COUNT(lead_basic_details.lead_id) AS conversion_count
    FROM lead_basic_details
    INNER JOIN leads_interaction_details
        ON lead_basic_details.lead_id = leads_interaction_details.lead_id
    WHERE lead_stage = 'conversion'
    GROUP BY lead_gen_source
)
SELECT 
    total_leads.lead_gen_source,
    converted_leads.conversion_count AS converted_leads,
    total_leads.sum_leads_generated AS total_leads_generated,
    CASE 
        WHEN total_leads.sum_leads_generated > 0 THEN 
            ROUND((converted_leads.conversion_count * 100.0 / total_leads.sum_leads_generated),2)
        ELSE 0
    END AS conversion_rate_percentage
FROM total_leads
LEFT JOIN converted_leads
    ON total_leads.lead_gen_source = converted_leads.lead_gen_source
ORDER BY conversion_rate_percentage DESC;



