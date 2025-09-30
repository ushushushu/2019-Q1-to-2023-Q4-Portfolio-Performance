/**********************

A PROJECT BY:
Usha Nicole C. Cobrado

**********************/

CREATE TABLE dim_client (
	client_uuid TEXT PRIMARY KEY,
	company_size TEXT,
	industry TEXT,
	subindustry TEXT,
	company_type TEXT,
	segment TEXT,
	country TEXT,
	province TEXT,
	city TEXT,
	annual_revenue TEXT,
	employee_count TEXT,
	year_established TEXT
);

CREATE TABLE loan_details (
	client_uuid TEXT,
	FOREIGN KEY (client_uuid) REFERENCES dim_client (client_uuid),
	loan_uuid TEXT PRIMARY KEY,
	loan_type TEXT,
	contract_date TEXT,
	initial_loan_amount TEXT,
	loan_end_date TEXT,
	original_loan_end_date TEXT,
	current_principal_outstanding TEXT,
	days_past_due TEXT
);

----------------------------------- DIM_CLIENT DATA CLEANING -----------------------------------

-- 4,200 clients
SELECT *
FROM dim_client;

-- no ditry data
SELECT DISTINCT client_uuid
FROM dim_client
-- WHERE
-- 	client_uuid IS NULL
-- 	OR client_uuid IN ('NULL','N/A')
;

/*
dirty data:
1. NULL, 'NULL', 'N/A' values
2. improper capitalization
3. missing last letters & words
4. double spacing
5. underscores
6. lack of trimming
*/
SELECT DISTINCT company_size
FROM dim_client
-- WHERE
-- 	company_size IS NULL
-- 	OR company_size IN ('NULL', 'N/A')
;

SELECT DISTINCT
	CASE
		WHEN company_size IS NULL OR company_size IN ('NULL', 'N/A') THEN 'Unspecified'
		WHEN company_size LIKE '%(%' AND RIGHT(TRIM(company_size),1) != ')' THEN INITCAP(TRIM(REPLACE(regexp_replace(regexp_replace(company_size, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'), '_', ' '))) || ')'
		WHEN INITCAP(TRIM(company_size)) LIKE 'Micro' THEN INITCAP(TRIM(REPLACE(regexp_replace(regexp_replace(company_size, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'), '_', ' '))) || ' (<10)'
		WHEN INITCAP(TRIM(company_size)) LIKE 'Small' THEN INITCAP(TRIM(REPLACE(regexp_replace(regexp_replace(company_size, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'), '_', ' '))) || ' (10-49)'
		WHEN INITCAP(TRIM(company_size)) LIKE 'Medium' THEN INITCAP(TRIM(REPLACE(regexp_replace(regexp_replace(company_size, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'), '_', ' '))) || ' (50-249)'
		WHEN INITCAP(TRIM(company_size)) LIKE 'Large' THEN INITCAP(TRIM(REPLACE(regexp_replace(regexp_replace(company_size, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'), '_', ' '))) || ' (250+)'
		ELSE INITCAP(TRIM(REPLACE(regexp_replace(regexp_replace(company_size, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'), '_', ' ')))
	END AS cleaned
	-- , company_size
FROM dim_client;

UPDATE dim_client
SET company_size =
	CASE
		WHEN company_size IS NULL OR company_size IN ('NULL', 'N/A') THEN 'Unspecified'
		WHEN company_size LIKE '%(%' AND RIGHT(TRIM(company_size),1) != ')' THEN INITCAP(TRIM(REPLACE(regexp_replace(regexp_replace(company_size, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'), '_', ' '))) || ')'
		WHEN INITCAP(TRIM(company_size)) LIKE 'Micro' THEN INITCAP(TRIM(REPLACE(regexp_replace(regexp_replace(company_size, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'), '_', ' '))) || ' (<10)'
		WHEN INITCAP(TRIM(company_size)) LIKE 'Small' THEN INITCAP(TRIM(REPLACE(regexp_replace(regexp_replace(company_size, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'), '_', ' '))) || ' (10-49)'
		WHEN INITCAP(TRIM(company_size)) LIKE 'Medium' THEN INITCAP(TRIM(REPLACE(regexp_replace(regexp_replace(company_size, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'), '_', ' '))) || ' (50-249)'
		WHEN INITCAP(TRIM(company_size)) LIKE 'Large' THEN INITCAP(TRIM(REPLACE(regexp_replace(regexp_replace(company_size, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'), '_', ' '))) || ' (250+)'
		ELSE INITCAP(TRIM(REPLACE(regexp_replace(regexp_replace(company_size, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'), '_', ' ')))
	END;

/*
dirty data:
1. NULL, 'NULL', 'N/A' values
2. improper capitalization
3. missing last letter
4. double spacing
5. lack of trimming
6. underscores
*/
SELECT DISTINCT industry
FROM dim_client
-- WHERE
-- 	industry IS NULL
-- 	OR industry IN ('NULL', 'N/A')
ORDER BY industry
;

SELECT DISTINCT
	CASE
		WHEN industry IS NULL OR industry IN ('NULL', 'N/A') THEN 'Unspecified'
		WHEN SUBSTRING(LOWER(TRIM(industry)),1,4) IN ('agri','auto','fina','furn','heal','mari','real') AND RIGHT(LOWER(TRIM(industry)),1) != 'e'
			THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 'e'
		WHEN SUBSTRING(LOWER(TRIM(industry)),1,4) IN ('chem','logi','prof','spor','tele','text') AND RIGHT(LOWER(TRIM(industry)),1) != 's'
			THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 's'
		WHEN SUBSTRING(LOWER(TRIM(industry)),1,4) IN ('avia','cons','educ','tran') AND RIGHT(LOWER(TRIM(industry)),1) != 'n'
			THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 'n'			
		WHEN SUBSTRING(LOWER(TRIM(industry)),1,4) IN ('ener','hosp','secu','tech') AND RIGHT(LOWER(TRIM(industry)),1) != 'y'
			THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 'y'
		WHEN SUBSTRING(LOWER(TRIM(industry)),1,4) IN ('manu','mini') AND RIGHT(LOWER(TRIM(industry)),1) != 'g'
			THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 'g'
		WHEN SUBSTRING(LOWER(TRIM(industry)),1,4) IN ('phar','reta') AND RIGHT(LOWER(TRIM(industry)),1) != 'l'
			THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 'l'
		WHEN SUBSTRING(LOWER(TRIM(industry)),1,4) IN ('ente','wast') AND RIGHT(LOWER(TRIM(industry)),1) != 't'
			THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 't'
		WHEN industry ILIKE '%beau%wellnes' THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 's'
		WHEN industry ILIKE 'medi' THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 'a'
		WHEN industry ILIKE 'wate' THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 'r'
		ELSE INITCAP(TRIM(REPLACE(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'), '_', ' ')))
	END AS cleaned
	-- , industry
FROM dim_client
ORDER BY cleaned;

UPDATE dim_client
SET industry =
	CASE
		WHEN industry IS NULL OR industry IN ('NULL', 'N/A') THEN 'Unspecified'
		WHEN SUBSTRING(LOWER(TRIM(industry)),1,4) IN ('agri','auto','fina','furn','heal','mari','real') AND RIGHT(LOWER(TRIM(industry)),1) != 'e'
			THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 'e'
		WHEN SUBSTRING(LOWER(TRIM(industry)),1,4) IN ('chem','logi','prof','spor','tele','text') AND RIGHT(LOWER(TRIM(industry)),1) != 's'
			THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 's'
		WHEN SUBSTRING(LOWER(TRIM(industry)),1,4) IN ('avia','cons','educ','tran') AND RIGHT(LOWER(TRIM(industry)),1) != 'n'
			THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 'n'			
		WHEN SUBSTRING(LOWER(TRIM(industry)),1,4) IN ('ener','hosp','secu','tech') AND RIGHT(LOWER(TRIM(industry)),1) != 'y'
			THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 'y'
		WHEN SUBSTRING(LOWER(TRIM(industry)),1,4) IN ('manu','mini') AND RIGHT(LOWER(TRIM(industry)),1) != 'g'
			THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 'g'
		WHEN SUBSTRING(LOWER(TRIM(industry)),1,4) IN ('phar','reta') AND RIGHT(LOWER(TRIM(industry)),1) != 'l'
			THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 'l'
		WHEN SUBSTRING(LOWER(TRIM(industry)),1,4) IN ('ente','wast') AND RIGHT(LOWER(TRIM(industry)),1) != 't'
			THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 't'
		WHEN industry ILIKE '%beau%wellnes' THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 's'
		WHEN industry ILIKE 'medi' THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 'a'
		WHEN industry ILIKE 'wate' THEN INITCAP(TRIM(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'))) || 'r'
		ELSE INITCAP(TRIM(REPLACE(regexp_replace(regexp_replace(industry, '\s+', ' ', 'g'),'^[ \t]+', '', 'g'), '_', ' ')))
	END;

/*
dirty data:
1. NULL, 'NULL', 'N/A' values
2. double spacing
3. improper capitalization
4. underscores
*/
SELECT DISTINCT subindustry
FROM dim_client
-- WHERE
-- 	subindustry IS NULL
-- 	OR subindustry IN ('NULL', 'N/A')
ORDER BY subindustry
;

SELECT DISTINCT
	CASE
		WHEN subindustry IS NULL OR subindustry IN ('NULL', 'N/A') THEN 'Unspecified'
		WHEN LOWER(TRIM(subindustry)) ILIKE '%tv%' THEN INITCAP(SPLIT_PART(REGEXP_REPLACE(REPLACE(TRIM(subindustry),'_',' '),'\s+',' ','g'),' ',1)) || ' ' || UPPER(SPLIT_PART(REGEXP_REPLACE(REPLACE(TRIM(subindustry),'_',' '),'\s+',' ','g'),' ',2)) || ' ' || INITCAP(SPLIT_PART(REGEXP_REPLACE(REPLACE(TRIM(subindustry),'_',' '),'\s+',' ','g'),' ',3))
		WHEN LOWER(TRIM(subindustry)) ILIKE 'it%c%s%' THEN UPPER(LEFT(TRIM(subindustry),2)) || INITCAP(SUBSTRING(REGEXP_REPLACE(REPLACE(TRIM(subindustry),'_',' '),'\s+',' ','g') FROM 3))
		WHEN LOWER(TRIM(subindustry)) ILIKE 'hr%' THEN UPPER(LEFT(TRIM(subindustry),2)) || INITCAP(SUBSTRING(REGEXP_REPLACE(REPLACE(TRIM(subindustry),'_',' '),'\s+',' ','g') FROM 3))
		WHEN LOWER(TRIM(subindustry)) ILIKE 'cyber%' THEN INITCAP(SPLIT_PART(REGEXP_REPLACE(REPLACE(TRIM(subindustry),'_',' '),'\s+',' ','g'),' ',1)) || LOWER(SPLIT_PART(REGEXP_REPLACE(REPLACE(TRIM(subindustry),'_',' '),'\s+',' ','g'),' ',2))
		ELSE REGEXP_REPLACE(REPLACE(INITCAP(TRIM(subindustry)),'_',' '),'\s+',' ','g')
	END AS cleaned
	-- , subindustry
FROM dim_client
ORDER BY cleaned;

UPDATE dim_client
SET subindustry =
	CASE
		WHEN subindustry IS NULL OR subindustry IN ('NULL', 'N/A') THEN 'Unspecified'
		WHEN LOWER(TRIM(subindustry)) ILIKE '%tv%' THEN INITCAP(SPLIT_PART(REGEXP_REPLACE(REPLACE(TRIM(subindustry),'_',' '),'\s+',' ','g'),' ',1)) || ' ' || UPPER(SPLIT_PART(REGEXP_REPLACE(REPLACE(TRIM(subindustry),'_',' '),'\s+',' ','g'),' ',2)) || ' ' || INITCAP(SPLIT_PART(REGEXP_REPLACE(REPLACE(TRIM(subindustry),'_',' '),'\s+',' ','g'),' ',3))
		WHEN LOWER(TRIM(subindustry)) ILIKE 'it%c%s%' THEN UPPER(LEFT(TRIM(subindustry),2)) || INITCAP(SUBSTRING(REGEXP_REPLACE(REPLACE(TRIM(subindustry),'_',' '),'\s+',' ','g') FROM 3))
		WHEN LOWER(TRIM(subindustry)) ILIKE 'hr%' THEN UPPER(LEFT(TRIM(subindustry),2)) || INITCAP(SUBSTRING(REGEXP_REPLACE(REPLACE(TRIM(subindustry),'_',' '),'\s+',' ','g') FROM 3))
		WHEN LOWER(TRIM(subindustry)) ILIKE 'cyber%' THEN INITCAP(SPLIT_PART(REGEXP_REPLACE(REPLACE(TRIM(subindustry),'_',' '),'\s+',' ','g'),' ',1)) || LOWER(SPLIT_PART(REGEXP_REPLACE(REPLACE(TRIM(subindustry),'_',' '),'\s+',' ','g'),' ',2))
		ELSE REGEXP_REPLACE(REPLACE(INITCAP(TRIM(subindustry)),'_',' '),'\s+',' ','g')
	END;

/*
dirty data:
1. NULL, 'NULL', 'N/A' values
2. improper capitalization
3. double spacing
4. misspelling / missing words
5. underscores
*/
SELECT DISTINCT company_type
FROM dim_client
-- WHERE
-- 	company_type IS NULL
-- 	OR company_type IN ('NULL', 'N/A')
;

SELECT DISTINCT
	CASE
		WHEN company_type IS NULL OR company_type IN ('NULL', 'N/A') THEN 'Unspecified'
		WHEN TRIM(company_type) ILIKE 'coop%' AND RIGHT(LOWER(TRIM(company_type)),1) != 'e' THEN INITCAP(TRIM(company_type)) || 'e'
		WHEN TRIM(company_type) ILIKE 'corpo%' AND RIGHT(LOWER(TRIM(company_type)),1) != 'n' THEN INITCAP(TRIM(company_type)) || 'n'
		WHEN TRIM(company_type) ILIKE 'part%' AND RIGHT(LOWER(TRIM(company_type)),1) != 'p' THEN INITCAP(TRIM(company_type)) || 'p'
		WHEN TRIM(company_type) ILIKE 'sole %' AND RIGHT(LOWER(TRIM(company_type)),1) != 'p' THEN INITCAP(TRIM(company_type)) || 'p'
		WHEN TRIM(company_type) ILIKE 'llc' THEN UPPER(TRIM(company_type))
		ELSE REGEXP_REPLACE(REPLACE(INITCAP(TRIM(company_type)),'_',' '),'\s+',' ','g')
	END AS cleaned
	-- , company_type
FROM dim_client
ORDER BY cleaned;

UPDATE dim_client
SET company_type =
	CASE
		WHEN company_type IS NULL OR company_type IN ('NULL', 'N/A') THEN 'Unspecified'
		WHEN TRIM(company_type) ILIKE 'coop%' AND RIGHT(LOWER(TRIM(company_type)),1) != 'e' THEN INITCAP(TRIM(company_type)) || 'e'
		WHEN TRIM(company_type) ILIKE 'corpo%' AND RIGHT(LOWER(TRIM(company_type)),1) != 'n' THEN INITCAP(TRIM(company_type)) || 'n'
		WHEN TRIM(company_type) ILIKE 'part%' AND RIGHT(LOWER(TRIM(company_type)),1) != 'p' THEN INITCAP(TRIM(company_type)) || 'p'
		WHEN TRIM(company_type) ILIKE 'sole %' AND RIGHT(LOWER(TRIM(company_type)),1) != 'p' THEN INITCAP(TRIM(company_type)) || 'p'
		WHEN TRIM(company_type) ILIKE 'llc' THEN UPPER(TRIM(company_type))
		ELSE REGEXP_REPLACE(REPLACE(INITCAP(TRIM(company_type)),'_',' '),'\s+',' ','g')
	END;

-- no dirty data
SELECT DISTINCT segment
FROM dim_client
-- WHERE
-- 	segment IS NULL
-- 	OR segment IN ('NULL', 'N/A')
;

/*
dirty data:
1. improper capitalization
2. double spacing
*/
SELECT DISTINCT country
FROM dim_client
-- WHERE
-- 	country IS NULL
-- 	OR country IN ('NULL', 'N/A')
;

SELECT DISTINCT INITCAP(TRIM(country))
FROM dim_client;

UPDATE dim_client
SET country = INITCAP(TRIM(country));

/*
dirty data:
1. improper capitalization
2. double spacing
3. underscores
*/
SELECT DISTINCT province
FROM dim_client
-- WHERE
-- 	province IS NULL
-- 	OR province IN ('NULL', 'N/A')
;

SELECT DISTINCT REPLACE(REGEXP_REPLACE(INITCAP(TRIM(province)),'\s+',' ','g'),'_',' ') AS cleaned
FROM dim_client
ORDER BY cleaned;

UPDATE dim_client
SET province = REPLACE(REGEXP_REPLACE(INITCAP(TRIM(province)),'\s+',' ','g'),'_',' ');

/*
dirty data:
1. improper capitalization
2. double spacing
3. underscores
*/
SELECT DISTINCT city
FROM dim_client
-- WHERE
-- 	city IS NULL
-- 	OR city IN ('NULL', 'N/A')
;

SELECT DISTINCT 
	CASE
		WHEN city LIKE '%-%' AND LENGTH(LOWER(SPLIT_PART(REPLACE(REGEXP_REPLACE(TRIM(city),'\s+',' ','g'),'_',' '),'-',2))) <= 2 THEN INITCAP(SPLIT_PART(REPLACE(REGEXP_REPLACE(TRIM(city),'\s+',' ','g'),'_',' '),'-',1)) || '-' || LOWER(SPLIT_PART(REPLACE(REGEXP_REPLACE(TRIM(city),'\s+',' ','g'),'_',' '),'-',2))
		ELSE INITCAP(REPLACE(REGEXP_REPLACE(TRIM(city),'\s+',' ','g'),'_',' '))
	END AS cleaned
	-- , city
FROM dim_client
ORDER BY cleaned;

UPDATE dim_client
SET city =
	CASE
		WHEN city LIKE '%-%' AND LENGTH(LOWER(SPLIT_PART(REPLACE(REGEXP_REPLACE(TRIM(city),'\s+',' ','g'),'_',' '),'-',2))) <= 2 THEN INITCAP(SPLIT_PART(REPLACE(REGEXP_REPLACE(TRIM(city),'\s+',' ','g'),'_',' '),'-',1)) || '-' || LOWER(SPLIT_PART(REPLACE(REGEXP_REPLACE(TRIM(city),'\s+',' ','g'),'_',' '),'-',2))
		ELSE INITCAP(REPLACE(REGEXP_REPLACE(TRIM(city),'\s+',' ','g'),'_',' '))
	END;


-- no dirty data, but wrong data type
SELECT DISTINCT annual_revenue
FROM dim_client
-- WHERE
-- 	annual_revenue IS NULL
-- 	OR annual_revenue IN ('NULL', 'N/A')
-- 	OR annual_revenue ~ '[-]'
-- 	OR annual_revenue ~ '[.]'
-- 	OR annual_revenue !~ '[0-9]'
;

ALTER TABLE dim_client
ALTER COLUMN annual_revenue TYPE NUMERIC 
USING annual_revenue::NUMERIC;

SELECT *
FROM dim_client;

/*
dirty data:
1. employee_count is a discrete value, it shouldn't have decimals
2. wrong data type
*/
SELECT DISTINCT employee_count
FROM dim_client
-- WHERE
	-- employee_count IS NULL
	-- OR employee_count IN ('NULL', 'N/A')
	-- OR employee_count ~ '[-]'
	-- OR employee_count ~ '[.]'
	-- OR employee_count !~ '[0-9]'
;

SELECT DISTINCT
	FLOOR(CAST(employee_count AS NUMERIC))::INTEGER AS cleaned
	, employee_count
FROM dim_client;

ALTER TABLE dim_client
ALTER COLUMN employee_count TYPE INTEGER
USING FLOOR(CAST(employee_count AS NUMERIC));

-- checking if the correct company_size label was given based on employee_count
WITH flagged AS (
	SELECT 
		company_size, employee_count,
		CASE
			WHEN employee_count < 10 AND company_size = 'Micro (<10)' THEN 'Y'
			WHEN employee_count >= 10 AND employee_count <= 49 AND company_size = 'Small (10-49)' THEN 'Y'
			WHEN employee_count >= 50 AND employee_count <= 249 AND company_size = 'Medium (50-249)' THEN 'Y'
			WHEN employee_count >= 250 AND company_size = 'Large (250+)' THEN 'Y'
			ELSE 'N'
		END AS checking
	FROM dim_client
)

-- some company_size labels are set to 'Unspecified' despite the employee_count being present
-- needs to be re-labelled
SELECT
	company_size, employee_count,
	checking
FROM flagged
WHERE checking = 'N';

SELECT 
	company_size, employee_count,
	CASE
		WHEN employee_count < 10 AND company_size = 'Unspecified' THEN 'Micro (<10)'
		WHEN employee_count >= 10 AND employee_count <= 49 AND company_size = 'Unspecified' THEN 'Small (10-49)'
		WHEN employee_count >= 50 AND employee_count <= 249 AND company_size = 'Unspecified' THEN 'Medium (50-249)'
		WHEN employee_count >= 250 AND company_size = 'Unspecified' THEN 'Large (250+)'
		ELSE company_size
	END AS cleaned
FROM dim_client;

UPDATE dim_client
SET company_size =
	CASE
		WHEN employee_count < 10 AND company_size = 'Unspecified' THEN 'Micro (<10)'
		WHEN employee_count >= 10 AND employee_count <= 49 AND company_size = 'Unspecified' THEN 'Small (10-49)'
		WHEN employee_count >= 50 AND employee_count <= 249 AND company_size = 'Unspecified' THEN 'Medium (50-249)'
		WHEN employee_count >= 250 AND company_size = 'Unspecified' THEN 'Large (250+)'
		ELSE company_size
	END;

-- no dirty data, but wrong data type
SELECT DISTINCT year_established
FROM dim_client
-- WHERE
-- 	year_established IS NULL
-- 	OR year_established IN ('NULL', 'N/A')
-- 	OR year_established ~ '[-]'
-- 	OR year_established ~ '[.]'
-- 	OR year_established !~ '[0-9]'
;

SELECT DISTINCT year_established::INTEGER
FROM dim_client;

ALTER TABLE dim_client
ALTER COLUMN year_established TYPE INTEGER
USING year_established::INTEGER;

SELECT *
FROM dim_client;

----------------------------------- LOAN_DETAILS DATA CLEANING -----------------------------------

-- 24,870 rows
SELECT *
FROM loan_details;

SELECT DISTINCT c.client_uuid
FROM dim_client AS c
INNER JOIN loan_details AS l
ON c.client_uuid = l.client_uuid;

-- no dirty data
SELECT DISTINCT loan_uuid
FROM loan_details
-- WHERE
-- 	loan_uuid IS NULL 
-- 	OR loan_uuid ~* '[a-z]'
-- 	OR loan_uuid !~ '[0-9]'
;

-- no dirty data
SELECT DISTINCT loan_type
FROM loan_details;

/*
dirty data:
1. inconsistent date formatting
	a. combining / and - in one value
	b. using / instead of - (standard format)
2. wrong data type
*/
SELECT DISTINCT contract_date
FROM loan_details
-- WHERE
-- 	contract_date IS NULL 
-- 	OR contract_date ~* '[a-z]'
-- 	OR contract_date !~ '[0-9]'
;

SELECT DISTINCT REPLACE(TRIM(contract_date),'/','-')
FROM loan_details;

UPDATE loan_details
SET contract_date = REPLACE(TRIM(contract_date),'/','-');

ALTER TABLE loan_details
ALTER COLUMN contract_date TYPE DATE
USING contract_date::DATE;

-- no dirty data, but wrong data type
SELECT initial_loan_amount
FROM loan_details
-- WHERE
-- 	initial_loan_amount IS NULL
-- 	OR initial_loan_amount IN ('NULL', 'N/A')
-- 	OR initial_loan_amount ~ '[-]'
-- 	OR initial_loan_amount ~ '[.]'
-- 	OR initial_loan_amount !~ '[0-9]'
;

SELECT initial_loan_amount::NUMERIC
FROM loan_details;

ALTER TABLE loan_details
ALTER COLUMN initial_loan_amount TYPE NUMERIC
USING initial_loan_amount::NUMERIC;

/*
dirty data:
1. inconsistent date formatting
	a. combining / and - in one value
	b. using / instead of - (standard format)
2. wrong data type
*/
SELECT loan_end_date
FROM loan_details
-- WHERE
-- 	loan_end_date IS NULL 
-- 	OR loan_end_date ~* '[a-z]'
-- 	OR loan_end_date !~ '[0-9]'
;

SELECT DISTINCT REPLACE(TRIM(loan_end_date),'/','-')
FROM loan_details;

UPDATE loan_details
SET loan_end_date =	REPLACE(TRIM(loan_end_date),'/','-');

ALTER TABLE loan_details
ALTER COLUMN loan_end_date TYPE DATE
USING loan_end_date::DATE;

/*
dirty data:
1. inconsistent date formatting
	a. combining / and - in one value
	b. using / instead of - (standard format)
2. wrong data type
*/
SELECT DISTINCT original_loan_end_date
FROM loan_details
-- WHERE
-- 	original_loan_end_date IS NULL 
-- 	OR original_loan_end_date ~* '[a-z]'
-- 	OR original_loan_end_date !~ '[0-9]'
;

SELECT DISTINCT REPLACE(TRIM(original_loan_end_date),'/','-')
FROM loan_details;

UPDATE loan_details
SET original_loan_end_date = REPLACE(TRIM(original_loan_end_date),'/','-');

ALTER TABLE loan_details
ALTER COLUMN original_loan_end_date TYPE DATE
USING original_loan_end_date::DATE;

-- no dirty data, but wrong data type
SELECT DISTINCT current_principal_outstanding
FROM loan_details
-- WHERE
-- 	current_principal_outstanding IS NULL
	-- OR current_principal_outstanding IN ('NULL', 'N/A')
	-- OR current_principal_outstanding ~ '[-]'
	-- OR current_principal_outstanding ~ '[.]'
	-- OR current_principal_outstanding !~ '[0-9]'
;

SELECT DISTINCT current_principal_outstanding::NUMERIC
FROM loan_details;

ALTER TABLE loan_details
ALTER COLUMN current_principal_outstanding TYPE NUMERIC
USING current_principal_outstanding::NUMERIC;

-- no dirty data, but wrong data type
SELECT DISTINCT days_past_due
FROM loan_details
-- WHERE
-- 	days_past_due IS NULL 
-- 	OR days_past_due ~* '[a-z]'
-- 	OR days_past_due !~ '[0-9]'
-- 	OR days_past_due ~ '[-]'
-- 	OR days_past_due ~ '[.]'
;

SELECT DISTINCT days_past_due::INTEGER
FROM loan_details;

ALTER TABLE loan_details
ALTER COLUMN days_past_due TYPE INTEGER
USING days_past_due::INTEGER;

SELECT *
FROM loan_details;

SELECT *
FROM dim_client AS c
INNER JOIN loan_details AS l
ON c.client_uuid = l.client_uuid
ORDER BY c.client_uuid;