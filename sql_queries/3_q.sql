
-- Q3 What are the most common reasons leads are not interested in progressing at each stage?

UPDATE leads_reasons_for_no_interest
SET reasons_for_not_interested_in_demo = 'Can''t afford'
WHERE reasons_for_not_interested_in_demo IN ('Cannot afford', 'can’t afford', 'cant afford');

SELECT
    'Demo' AS stage,
    reasons_for_not_interested_in_demo AS disqualification_reason,
    COUNT(*) AS disqualification_count
FROM
    leads_reasons_for_no_interest
WHERE
    reasons_for_not_interested_in_demo IS NOT NULL
GROUP BY
    reasons_for_not_interested_in_demo

UNION ALL

SELECT
    'Consideration' AS stage,
    reasons_for_not_interested_in_consideration AS disqualification_reason,
    COUNT(*) AS disqualification_count
FROM
    leads_reasons_for_no_interest
WHERE
    reasons_for_not_interested_in_consideration IS NOT NULL
GROUP BY
    reasons_for_not_interested_in_consideration

UNION ALL

SELECT
    'Conversion' AS stage,
    reasons_for_not_interested_in_conversion AS disqualification_reason,
    COUNT(*) AS disqualification_count
FROM
    leads_reasons_for_no_interest
WHERE
    reasons_for_not_interested_in_conversion IS NOT NULL
GROUP BY
    reasons_for_not_interested_in_conversion
ORDER BY
    stage, disqualification_count DESC;