
copy lead_basic_details FROM '/Users/admin/Documents/DEVELOPER/SQL_Project2_LeadsPerformance_own/csv_files/leads_basic_details.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
copy leads_demo_watched_details FROM '/Users/admin/Documents/DEVELOPER/SQL_Project2_LeadsPerformance_own/csv_files/leads_demo_watched_details.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
\copy leads_interaction_details FROM '/Users/admin/Documents/DEVELOPER/SQL_Project2_LeadsPerformance_own/csv_files/leads_interaction_details.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
copy leads_reasons_for_no_interest FROM '/Users/admin/Documents/DEVELOPER/SQL_Project2_LeadsPerformance_own/csv_files/leads_reasons_for_no_interest.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
copy sales_managers_assigned_leads_details FROM '/Users/admin/Documents/DEVELOPER/SQL_Project2_LeadsPerformance_own/csv_files/sales_managers_assigned_leads_details.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');


\copy company_dim FROM '[Insert File Path]/company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_dim FROM '[Insert File Path]/skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy job_postings_fact FROM '[Insert File Path]/job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_job_dim FROM '[Insert File Path]/skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

SELECT * FROM leads_demo_watched_details;