-- Create lead_basic_details table with primary key
CREATE TABLE public.lead_basic_details
(
    lead_id VARCHAR(255) PRIMARY KEY,
    age INT,
    gender VARCHAR(50),
    current_city VARCHAR(255),
    current_education VARCHAR(255),
    parent_occupation VARCHAR(255),
    lead_gen_source VARCHAR(255)
);

-- Create sales_managers_assigned_leads_details table with composite primary key and foreign key
CREATE TABLE public.sales_managers_assigned_leads_details
(
    snr_sm_id VARCHAR(255),
    jnr_sm_id VARCHAR(255),
    assigned_date DATE,
    cycle VARCHAR(50),
    lead_id VARCHAR(255),
    PRIMARY KEY (snr_sm_id, jnr_sm_id, assigned_date, lead_id),
    FOREIGN KEY (lead_id) REFERENCES public.lead_basic_details (lead_id)
        ON DELETE CASCADE
);

-- Create leads_interaction_details table with composite primary key and foreign key
CREATE TABLE public.leads_interaction_details
(
    jnr_sm_id VARCHAR(255),
    lead_id VARCHAR(255),
    lead_stage VARCHAR(50) CHECK (lead_stage IN ('lead', 'awareness', 'consideration', 'conversion')),
    call_done_date DATE,
    call_status VARCHAR(50) CHECK (call_status IN ('successful', 'unsuccessful')),
    call_reason VARCHAR(255),
    FOREIGN KEY (lead_id) REFERENCES public.lead_basic_details (lead_id)
        ON DELETE CASCADE
);

ALTER TABLE public.leads_interaction_details
DROP CONSTRAINT leads_interaction_details_pkey;


-- Create leads_demo_watched_details table with composite primary key and foreign key
CREATE TABLE public.leads_demo_watched_details
(
    lead_id VARCHAR(255),
    demo_watched_date DATE,
    language VARCHAR(50) CHECK (language IN ('English', 'Telugu', 'Hindi')),
    watched_percentage FLOAT CHECK (watched_percentage BETWEEN 0 AND 100),
    PRIMARY KEY (lead_id, demo_watched_date),
    FOREIGN KEY (lead_id) REFERENCES public.lead_basic_details (lead_id)
        ON DELETE CASCADE
);


-- Create leads_reasons_for_no_interest table with primary key and foreign key
CREATE TABLE public.leads_reasons_for_no_interest

(
    lead_id VARCHAR(255),
    reasons_for_not_interested_in_demo VARCHAR(255),
    reasons_for_not_interested_in_consideration VARCHAR(255),
    reasons_for_not_interested_in_conversion VARCHAR(255),
    FOREIGN KEY (lead_id) REFERENCES public.lead_basic_details (lead_id)
        ON DELETE CASCADE
);

-- Create sales_managers table with primary key
CREATE TABLE public.sales_managers
(
    sm_id VARCHAR(255) PRIMARY KEY,
    sm_type VARCHAR(10) CHECK (sm_type IN ('senior', 'junior'))
);

-- Set ownership of the tables to the postgres user
ALTER TABLE public.lead_basic_details OWNER to postgres;
ALTER TABLE public.sales_managers_assigned_leads_details OWNER to postgres;
ALTER TABLE public.leads_interaction_details OWNER to postgres;
ALTER TABLE public.leads_demo_watched_details OWNER to postgres;
ALTER TABLE public.leads_reasons_for_no_interest OWNER to postgres;
ALTER TABLE public.sales_managers OWNER to postgres;

-- Create indexes on foreign key columns for better performance
CREATE INDEX idx_lead_id ON public.sales_managers_assigned_leads_details (lead_id);
CREATE INDEX idx_lead_id_interaction ON public.leads_interaction_details (lead_id);
CREATE INDEX idx_lead_id_demo ON public.leads_demo_watched_details (lead_id);
CREATE INDEX idx_lead_id_reasons ON public.leads_reasons_for_no_interest (lead_id);
