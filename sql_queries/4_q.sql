
--Q4 Which lead stages have the highest dropout rates?


SELECT 
    COUNT(reasons_for_not_interested_in_consideration) stage_consideration,
    COUNT(reasons_for_not_interested_in_conversion) stage_conversion,
    COUNT(reasons_for_not_interested_in_demo) stage_demo
FROM leads_reasons_for_no_interest;